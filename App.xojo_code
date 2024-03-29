#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  savePreferences
		  
		  // The Kaju App.UpdateInitiater's Destructor should fire automatically on quit, but sometimes it doesn't, so we force the issue here.
		  App.UpdateInitiater = Nil
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  // Check whether we are running as an administrator.  If not, warn the user.  This is only applicable on Windows and
		  // if we're not debugging (when remote debugging, this causes a failure to connect to the IDE).
		  #If TargetWindows Then
		    If Not isUserLocalAdministrator Then
		      MsgBox("The installer is not running as an administrator.  This may cause problems as it needs to write to your X-Plane folder which is often in 'Program Files'.  Re-run as administrator to avoid any problems.")
		    End If
		  #EndIf
		  
		  // Remove the separator under the help item if we're not on a Mac (no separator needed in Help menu on Windows and Linux)
		  #if not TargetMacOS
		    HelpAboutSeparator.Close
		  #endif
		  
		  // The system-wide HTTP cache on Mac will cache HTTP content
		  #If TargetMacOS And TargetCocoa Then
		    Declare Function NSClassFromString Lib "Cocoa" ( className As CFStringRef ) As Ptr
		    Declare Function sharedURLCache Lib "Cocoa" selector "sharedURLCache" ( NSURLCacheClass As ptr ) As Ptr
		    Declare Sub removeAllCachedResponses Lib "Cocoa" selector "removeAllCachedResponses" ( NSURLCacheInstance As Ptr )
		    removeAllCachedResponses( sharedURLCache( NSClassFromString( "NSURLCache" ) ) )
		  #EndIf
		  
		  #If TargetMacOS Then
		    App.pPlatform = "macOS"
		  #ElseIf TargetLinux Then
		    App.pPlatform = "Linux"
		  #ElseIf TargetWindows Then
		    App.pPlatform = "Windows"
		  #Else
		    App.pPlatform = "Unknown"
		  #EndIf
		  
		  wndMain.show
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  If error <> Nil Then
		    Var type As String = Introspection.GetType(error).Name
		    MessageBox(type + EndOfLine + EndOfLine + Join(error.Stack, EndOfLine))
		  End If
		  
		  Return False
		  
		End Function
	#tag EndEvent


	#tag MenuHandler
		Function HelpAbout() As Boolean Handles HelpAbout.Action
			wndAbout.show
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function getXPlaneFolder(require as Boolean) As boolean
		  // Returns true if the user chose a new folder (and require is false)
		  
		  dim dialog as SelectFolderDialog = new SelectFolderDialog()
		  dim xPlaneFolder as FolderItem
		  
		  dialog.title = kLocateXPlaneFolder
		  dialog.promptText = kLocateXPlaneFolder
		  
		  #if TargetWin32
		    dialog.initialDirectory = Volume(0).Child("Program Files")
		  #elseif TargetMacOS
		    dialog.initialDirectory = Volume(0).Child("Applications")
		  #elseif TargetLinux
		    dialog.initialDirectory = Volume(0)
		  #endif
		  
		  while true
		    xPlaneFolder = dialog.showModal()
		    if (xPlaneFolder = nil) then
		      if (require) then
		        msgBox(kErrorNoXPlaneFolderSelected)
		        quit
		      else
		        return false
		      end if
		    end if
		    
		    dim customSceneryFolder as FolderItem = xPlaneFolder.child("Custom Scenery")
		    if (customSceneryFolder = nil or not customSceneryFolder.exists()) then
		      msgBox(kErrorNoCustomSceneryFolder)
		    else
		      pXPlaneFolder = xPlaneFolder
		      pPreferences.value(App.kPreferenceXPlanePath) = pXPlaneFolder.nativePath
		      return true
		    end if
		  wend
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub initKajuUpdateChecker()
		  ' Only auto-update on 64 bit architectures - we don't support auto-updating on Linux 32 bit as Kaju
		  ' doesn't support separate versions for x86 and ARM
		  #If Target64Bit Then
		    Dim updater As New Kaju.UpdateChecker(pPrefsFolder)
		    
		    ' This line matches the allowed updates to the app's Stage Code in the shared Build Settings.
		    ' So a 'Final' version app will only get updates marked as 'Final', while a 'Development' app will get all updates.
		    updater.AllowedStage = App.StageCode
		    
		    updater.ServerPublicRSAKey = App.kKeyKajuUpdate
		    updater.UpdateURL = App.kURLKajuUpdateData
		    'updater.DefaultImage = imgBannerBG
		    updater.DefaultUseTransparency = True
		    updater.AllowRedirection = True
		    
		    updater.ExecuteAsync
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadPreferences()
		  ' Old prefs location
		  
		  Dim prefsFile As FolderItem = SpecialFolder.Preferences.Child(App.kApplicationNameASCII + ".plist")
		  
		  If (prefsFile.exists) Then
		    If (Not pPreferences.loadXML(prefsFile)) Then
		      pPreferences = New Dictionary
		    End If
		    prefsFile.Delete
		  End If
		  
		  ' New prefs location in a subfolder so it can be shared with kaju updater
		  
		  Dim prefsParentFolder As FolderItem
		  
		  #If Not TargetLinux
		    prefsParentFolder = SpecialFolder.ApplicationData
		  #Else
		    prefsParentFolder = SpecialFolder.ApplicationData.Child(".config")
		  #EndIf
		  
		  If Not prefsParentFolder.Exists Then
		    prefsParentFolder.CreateAsFolder
		  End If
		  
		  pPrefsFolder = prefsParentFolder.Child(App.kApplicationNameASCII)
		  
		  If Not pPrefsFolder.Exists Then
		    pPrefsFolder.CreateAsFolder
		  End If
		  
		  prefsFile = pPrefsFolder.Child(App.kApplicationName + ".plist")
		  
		  If (prefsFile.exists) Then
		    If (Not pPreferences.loadXML(prefsFile)) Then
		      pPreferences = New Dictionary
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function mbToString(dst as Xojo.Core.MemoryBlock) As String
		  Return(CType(dst.Data, MemoryBlock).StringValue(0, dst.Size))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function processParameterizedString(str as String, parameters() as String) As String
		  If parameters <> Nil And ubound(parameters) > -1 Then
		    dim i as integer
		    for i = 0 to ubound(parameters)
		      str = str.ReplaceAll("${" + str(i+1) + "}", parameters(i))
		    next
		  end if
		  
		  return str
		  
		  exception err as NilObjectException
		    // Will throw exception if no second parameter passed
		    return str
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub savePreferences()
		  Dim prefsFile As FolderItem = pPrefsFolder.Child(App.kApplicationNameASCII + ".plist")
		  Dim result As Boolean = pPreferences.saveXML(prefsFile, True)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function stringToText(str as String) As Text
		  Return Str.ToText
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		pPlatform As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pPreferences As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pPrefsFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		pXPlaneFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		UpdateInitiater As Kaju.UpdateInitiater
	#tag EndProperty


	#tag Constant, Name = kApplicationName, Type = String, Dynamic = True, Default = \"OpenSceneryX Installer", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Instalador de OpenSceneryX"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Installeur OpenSceneryX"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Instal\xC2\xB7lador de l\'OpenSceneryX"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Installatore di OpenSceneryX"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"OpenSceneryX Installationsprogramm"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"OpenSceneryX Installer"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\xA9\xD7\x9C \xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Instalator OpenSceneryX"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD0\xB0 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 OpenSceneryX"
	#tag EndConstant

	#tag Constant, Name = kApplicationNameASCII, Type = String, Dynamic = False, Default = \"OpenSceneryX Installer", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kColourDarkBlue, Type = Color, Dynamic = False, Default = \"&c3634a3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kColourLightBlue, Type = Color, Dynamic = False, Default = \"&cb9b8e1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kConnectionRetries, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDonationPrompt, Type = String, Dynamic = True, Default = \"If you use and like the library\x2C please consider a donation to keep it running:", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Se usi e ti piace questa libreria\x2C per favore considera una donazione per farla crescere:"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x95\xD1\x81\xD0\xBB\xD0\xB8 \xD0\xB2\xD0\xB0\xD0\xBC \xD0\xBF\xD0\xBE\xD0\xBD\xD1\x80\xD0\xB0\xD0\xB2\xD0\xB8\xD0\xBB\xD0\xBE\xD1\x81\xD1\x8C \xD0\xBF\xD1\x80\xD0\xB8\xD0\xBB\xD0\xBE\xD0\xB6\xD0\xB5\xD0\xBD\xD0\xB8\xD0\xB5 \xD0\xB8 \xD0\xB2\xD1\x8B \xD0\xB5\xD0\xB3\xD0\xBE \xD0\xB8\xD1\x81\xD0\xBF\xD0\xBE\xD0\xBB\xD1\x8C\xD0\xB7\xD1\x83\xD0\xB5\xD1\x82\xD0\xB5\x2C \xD0\xBF\xD0\xBE\xD0\xB6\xD0\xB0\xD0\xBB\xD1\x83\xD0\xB9\xD1\x81\xD1\x82\xD0\xB0 \xD1\x80\xD0\xB0\xD1\x81\xD1\x81\xD0\xBC\xD0\xBE\xD1\x82\xD1\x80\xD0\xB8\xD1\x82\xD0\xB5 \xD0\xB2\xD0\xBE\xD0\xB7\xD0\xBC\xD0\xBE\xD0\xB6\xD0\xBD\xD0\xBE\xD1\x81\xD1\x82\xD1\x8C \xD0\xBF\xD0\xBE\xD0\xB6\xD0\xB5\xD1\x80\xD1\x82\xD0\xB2\xD0\xBE\xD0\xB2\xD0\xB0\xD0\xBD\xD0\xB8\xD1\x8F \xD0\xBD\xD0\xB0 \xD0\xB5\xD0\xB3\xD0\xBE \xD0\xBF\xD0\xBE\xD0\xB4\xD0\xB4\xD0\xB5\xD1\x80\xD0\xB6\xD0\xBA\xD1\x83"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Indien je de scenery bestanden mooi vindt en gebruikt\x2C overweeg dan een donatie om het project te ondersteunen."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Si vous utilisez et appr\xC3\xA9ciez cette biblioth\xC3\xA8que\x2C pensez \xC3\xA0 faire une donation pour la soutenir:"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Ay\xC3\xBAdanos a seguir manteniendo la librer\xC3\xADa. Si la usas y te gusta por favor considera hacer una donaci\xC3\xB3n:"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Si utilitzeu i us agrada la biblioteca\x2C considereu una donaci\xC3\xB3 per mantenir-la en funcionament:"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Wenn Sie diese Bibliothek nutzen und m\xC3\xB6gen\x2C erw\xC3\xA4gen Sie bitte eine Spende um die Entwicklung am Laufen zu halten:"
	#tag EndConstant

	#tag Constant, Name = kEdit, Type = String, Dynamic = True, Default = \"&Edit", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Editer"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Editar"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Edita"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Modifica"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Bearbeiten"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"B&ewerken"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA2\xD7\xA8\xD7\x95\xD7\x9A"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"&Edycja"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"&\xD0\xA0\xD0\xB5\xD0\xB4\xD0\xB0\xD0\xBA\xD1\x82\xD0\xB8\xD1\x80\xD0\xBE\xD0\xB2\xD0\xB0\xD1\x82\xD1\x8C"
	#tag EndConstant

	#tag Constant, Name = kEditClear, Type = String, Dynamic = True, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Borrar"
		#Tag Instance, Platform = Windows, Language = es, Definition  = \"&Borrar"
		#Tag Instance, Platform = Linux, Language = es, Definition  = \"&Borrar"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Effacer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Es&borra"
		#Tag Instance, Platform = Windows, Language = ca, Definition  = \"Es&borra"
		#Tag Instance, Platform = Linux, Language = ca, Definition  = \"Es&borra"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Cancella"
		#Tag Instance, Platform = Windows, Language = it, Definition  = \"&Cancella"
		#Tag Instance, Platform = Linux, Language = it, Definition  = \"&Cancella"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Windows, Language = de, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = de, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Mac OS, Language = de, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"&Verwijderen"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9E\xD7\x97\xD7\xA7"
		#Tag Instance, Platform = Windows, Language = he, Definition  = \"\xD7\x9E\xD7\x97\xD7\xA7"
		#Tag Instance, Platform = Linux, Language = he, Definition  = \"\xD7\x9E\xD7\x97\xD7\xA7"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"&Usu\xC5\x84"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"&\xD0\xA3\xD0\xB4\xD0\xB0\xD0\xBB\xD0\xB8\xD1\x82\xD1\x8C"
		#Tag Instance, Platform = Windows, Language = ru, Definition  = \"&\xD0\xA3\xD0\xB4\xD0\xB0\xD0\xBB\xD0\xB8\xD1\x82\xD1\x8C"
		#Tag Instance, Platform = Linux, Language = ru, Definition  = \"&\xD0\xA3\xD0\xB4\xD0\xB0\xD0\xBB\xD0\xB8\xD1\x82\xD1\x8C"
		#Tag Instance, Platform = Mac OS, Language = es, Definition  = \"&Borrar"
	#tag EndConstant

	#tag Constant, Name = kEditCopy, Type = String, Dynamic = True, Default = \"&Copy", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Co&pier"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Copiar"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Copia"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Copia"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Kopieren"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"&Kopi\xC3\xABren"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\xA2\xD7\xAA\xD7\xA7"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"&Kopiuj"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"&\xD0\x9A\xD0\xBE\xD0\xBF\xD0\xB8\xD1\x80\xD0\xBE\xD0\xB2\xD0\xB0\xD1\x82\xD1\x8C"
	#tag EndConstant

	#tag Constant, Name = kEditCut, Type = String, Dynamic = True, Default = \"Cu&t", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Co&uper"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"C&ortar"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Re&talla"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Taglia"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Ausschneiden"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"K&nippen"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x92\xD7\x96\xD7\x95\xD7\xA8"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Wy&tnij"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x92\xD1\x8B\xD1\x80\xD0\xB5\xD0\xB7\xD0\xB0\xD1\x82\xD1\x8C&"
	#tag EndConstant

	#tag Constant, Name = kEditPaste, Type = String, Dynamic = True, Default = \"&Paste", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Coller"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Pegar"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Enganxa"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Incolla"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Einf\xC3\xBCgen"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"&Plakken"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x93\xD7\x91\xD7\xA7"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"&Wklej"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"&\xD0\x92\xD1\x81\xD1\x82\xD0\xB0\xD0\xB2\xD0\xB8\xD1\x82\xD1\x8C"
	#tag EndConstant

	#tag Constant, Name = kEditSelectAll, Type = String, Dynamic = True, Default = \"Select &All", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Tout s\xC3\xA9lectionner"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Seleccionar &Todo"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Selecciona-ho tot"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Selezion&a Tutto"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Alles Ausw\xC3\xA4hlen"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Alles se&lecteren"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x91\xD7\x97\xD7\xA8 \xD7\x94\xD7\x9B\xD7\x9C"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Z&aznacz wszystko"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x92\xD1\x8B\xD0\xB1\xD1\x80\xD0\xB0\xD1\x82\xD1\x8C &\xD0\xB2\xD1\x81\xD0\xB5"
	#tag EndConstant

	#tag Constant, Name = kEditUndo, Type = String, Dynamic = True, Default = \"&Undo", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Annuler"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Deshacer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Desf\xC3\xA9s"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Annulla "
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&R\xC3\xBCckg\xC3\xA4ngig"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"&Ongedaan maken"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x91\xD7\x98\xD7\x9C"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"&Cofnij"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"&\xD0\x9E\xD1\x82\xD0\xBC\xD0\xB5\xD0\xBD\xD0\xB8\xD1\x82\xD1\x8C"
	#tag EndConstant

	#tag Constant, Name = kErrorNoCustomSceneryFolder, Type = String, Dynamic = True, Default = \"A \"Custom Scenery\" folder could not be found inside the X-Plane\xC2\xAE folder you specified\x2C please try again.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"No fue posible localizar una carpeta \"Custom Scenery\" dentro de la carpeta de X-Plane\xC2\xAE especificada\x2C por favor int\xC3\xA9ntalo de nuevo."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Le dossier \"Custom Scenery\"  n\'a pas pu \xC3\xAAtre trouv\xC3\xA9 dans le r\xC3\xA9pertoire d\'X-Plane\xC2\xAE. Veuillez r\xC3\xA9essayer."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"La carpeta \xC2\xABCustom Scenery\xC2\xBB no es troba dins la carpeta d\'X-Plane\xC2\xAE que heu seleccionat\x2C torneu-ho a provar un altre cop."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Non \xC3\xA8 stata trovata la cartella dei \"Custom Scenery\" nella cartella di X-Plane\xC2\xAE che avete specificato\x2C per favore riprovare."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Das Programm konnte in dem von Ihnen angegebenen Ordner keinen \"Custom Scenery\" Ordner finden. Bitte versuchen Sie es erneut."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Een \"Custom Scenery\" map werd niet gevonden in de X-Plane\xC2\xAE map die je aangaf\x2C probeer het opnieuw."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xAA\xD7\x99\xD7\xA7\xD7\x99\xD7\x99\xD7\xAA \"\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99 \xD7\x9E\xD7\x95\xD7\xAA\xD7\x90\xD7\x9E\xD7\xAA \xD7\x90\xD7\x99\xD7\xA9\xD7\x99\xD7\xAA\" \xD7\x9C\xD7\x90 \xD7\xA0\xD7\x9E\xD7\xA6\xD7\x90\xD7\x94 \xD7\x91\xD7\xAA\xD7\x95\xD7\x9A \xD7\xAA\xD7\x99\xD7\xA7\xD7\x99\xD7\x99\xD7\xAA \xD7\x94\xD7\x90\xD7\xA7\xD7\xA1-\xD7\xA4\xD7\x9C\xD7\x9F\xC2\xAE \xD7\xA9\xD7\x94\xD7\x92\xD7\x93\xD7\xA8\xD7\xAA\x2C \xD7\x90\xD7\xA0\xD7\x90 \xD7\xA0\xD7\xA1\xD7\x94 \xD7\xA9\xD7\xA0\xD7\x99\xD7\xAA."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Katalog \"Custom Scenery\" nie zosta\xC5\x82 znaleziony wewn\xC4\x85trz lokacji X-Plane\xC2\xAE kt\xC3\xB3ra zosta\xC5\x82a podana\x2C prosz\xC4\x99 wybra\xC4\x87 ponownie."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD0\xB0\xD0\xBF\xD0\xBA\xD0\xB0 \"Custom Scenery\" \xD0\xB2 \xD1\x83\xD0\xBA\xD0\xB0\xD0\xB7\xD0\xB0\xD0\xBD\xD0\xBD\xD0\xBE\xD0\xB9 \xD0\xBF\xD0\xB0\xD0\xBF\xD0\xBA\xD0\xB5 X-Plane\xC2\xAE \xD0\xBD\xD0\xB5 \xD0\xBD\xD0\xB0\xD0\xB9\xD0\xB4\xD0\xB5\xD0\xBD\xD0\xB0\x2C \xD0\xBF\xD0\xBE\xD0\xB6\xD0\xB0\xD0\xBB\xD1\x83\xD0\xB9\xD1\x81\xD1\x82\xD0\xB0 \xD0\xBF\xD0\xBE\xD0\xBF\xD1\x80\xD0\xBE\xD0\xB1\xD1\x83\xD0\xB9\xD1\x82\xD0\xB5 \xD0\xB5\xD1\x89\xD0\xB5 \xD1\x80\xD0\xB0\xD0\xB7."
	#tag EndConstant

	#tag Constant, Name = kErrorNoXPlaneFolderSelected, Type = String, Dynamic = True, Default = \"This installer cannot work without knowing where your X-Plane\xC2\xAE folder is located and will now quit.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Este instalador no puede operar sin saber donde est\xC3\xA1 ubicada su carpeta de X-Plane\xC2\xAE y dejar\xC3\xA1 de ejecutarse."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"L\'installeur ne peut pas fonctionner sans X-Plane\xC2\xAE et va maintenant \xC3\xAAtre ferm\xC3\xA9."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Aquest instal\xC2\xB7lador no pot continuar sense saber on \xC3\xA9s la vostra carpeta de l\'X-Plane\xC2\xAE i ara es tancar\xC3\xA0."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Questo installatore non pu\xC3\xB2 lavorare senza aver specificato la posizione della cartella di X-Plane\xC2\xAE e quindi verr\xC3\xA0 chiuso."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Dieses Installationsprogramm funktioniert nicht\x2C solange der X-Plane\xC2\xAE Ordner nicht lokalisiert ist. Das Programm wird nun beendet."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Deze installer werkt niet als hij niet weet waar je X-Plane\xC2\xAE map is en wordt nu afgesloten."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\x94\xD7\x96\xD7\x94 \xD7\x9C\xD7\x90 \xD7\x99\xD7\x9B\xD7\x95\xD7\x9C \xD7\x9C\xD7\xA2\xD7\x91\xD7\x95\xD7\x93 \xD7\x9E\xD7\x91\xD7\x9C\xD7\x99 \xD7\x9C\xD7\x93\xD7\xA2\xD7\xAA \xD7\x94\xD7\x99\xD7\x9B\xD7\x9F \xD7\xAA\xD7\x99\xD7\xA7\xD7\x99\xD7\xAA \xD7\x94\xD7\x90\xD7\xA7\xD7\xA1-\xD7\xA4\xD7\x9C\xD7\x9F\xC2\xAE \xD7\xA9\xD7\x9C\xD7\x9A \xD7\xA0\xD7\x9E\xD7\xA6\xD7\x90\xD7\xAA \xD7\x95\xD7\x9B\xD7\xA2\xD7\xAA \xD7\x99\xD7\x99\xD7\xA1\xD7\x92\xD7\xA8."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Instalator zako\xC5\x84czy prac\xC4\x99 gdy\xC5\xBC nie mo\xC5\xBCe kontynuowa\xC4\x87 bez informacji gdzie znajduje si\xC4\x99 katalog X-Plane\xC2\xAE."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD0\xB0 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 \xD0\xBD\xD0\xB5 \xD0\xBC\xD0\xBE\xD0\xB6\xD0\xB5\xD1\x82 \xD1\x80\xD0\xB0\xD0\xB1\xD0\xBE\xD1\x82\xD0\xB0\xD1\x82\xD1\x8C \xD0\xB1\xD0\xB5\xD0\xB7 \xD1\x83\xD0\xBA\xD0\xB0\xD0\xB7\xD0\xB0\xD0\xBD\xD0\xB8\xD1\x8F \xD0\xBC\xD0\xB5\xD1\x81\xD1\x82\xD0\xBE\xD0\xBF\xD0\xBE\xD0\xBB\xD0\xBE\xD0\xB6\xD0\xB5\xD0\xBD\xD0\xB8\xD1\x8F \xD0\xBF\xD0\xB0\xD0\xBF\xD0\xBA\xD0\xB8 X-Plane\xC2\xAE \xD0\xB8 \xD0\xB7\xD0\xB0\xD0\xB2\xD0\xB5\xD1\x80\xD1\x88\xD0\xB0\xD0\xB5\xD1\x82 \xD1\x80\xD0\xB0\xD0\xB1\xD0\xBE\xD1\x82\xD1\x83."
	#tag EndConstant

	#tag Constant, Name = kErrorSteamNotFound, Type = String, Dynamic = True, Default = \"A Steam installation could not be found.", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Un installazione di Steam non pu\xC3\xB2 essere trovata. "
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9D\xD0\xB5 \xD1\x83\xD0\xB4\xD0\xB0\xD0\xBB\xD0\xBE\xD1\x81\xD1\x8C \xD0\xBD\xD0\xB0\xD0\xB9\xD1\x82\xD0\xB8 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD1\x83 Steam."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Een Steam installatie kon niet worden gevonden"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Une Sintallation Steam ne peut \xC3\xAAtre trouv\xC3\xA9e."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Un instalador de Steam no pudo ser encontrado."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"No s\xE2\x80\x99ha pogut trobar una instal\xC2\xB7laci\xC3\xB3 de Steam."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Es konnte keine Steam Installation gefunden werden."
	#tag EndConstant

	#tag Constant, Name = kErrorXPlaneSteamFolderNotFound, Type = String, Dynamic = True, Default = \"The XPlane Steam folder could not be found at ${1}.", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"La cartella di XPlane Steam non pu\xC3\xB2 essere trovata a ${1}."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD0\xB0\xD0\xBF\xD0\xBA\xD0\xB0 XPlane Steam \xD0\xBD\xD0\xB5 \xD0\xBC\xD0\xBE\xD0\xB6\xD0\xB5\xD1\x82 \xD0\xB1\xD1\x8B\xD1\x82\xD1\x8C \xD0\xBD\xD0\xB0\xD0\xB9\xD0\xB4\xD0\xB5\xD0\xBD\xD0\xB0 \xD0\xB2"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"De XPlane Steam map kon niet worden gevonden bij ${1}."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Le dossier Steam d\'Xplane ne peut \xC3\xAAtre trouv\xC3\xA9 \xC3\xA0 l\'emplacement ${1}."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"La carpeta X-Plane\xC2\xAE de Steam no pudo ser encontrada en ${1}."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"No s\xE2\x80\x99ha pogut trobar la carpeta X-Plane\xC2\xAE Steam a ${1}."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Der XPlane Steam Ordner konnte nicht unter ${1} gefunden werden."
	#tag EndConstant

	#tag Constant, Name = kFile, Type = String, Dynamic = True, Default = \"&File", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Fichier"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Archivo"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Fitxer"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Archivio"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Datei"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"&Bestand"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA7\xD7\x95\xD7\x91\xD7\xA5"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"&Plik"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"&\xD0\xA4\xD0\xB0\xD0\xB9\xD0\xBB"
	#tag EndConstant

	#tag Constant, Name = kFileClose, Type = String, Dynamic = True, Default = \"&Close", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Schliessen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Fermer"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"&Sluiten"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Tanca"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA1\xD7\x92\xD7\x95\xD7\xA8"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"&Zamknij"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x97\xD0\xB0\xD0\xBA\xD1\x80\xD1\x8B\xD1\x82\xD1\x8C"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Cerrar"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Chiudi"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = True, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Salir"
		#Tag Instance, Platform = Windows, Language = es, Definition  = \"&Salir"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Quitter"
		#Tag Instance, Platform = Windows, Language = fr, Definition  = \"&Quitter"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Surt"
		#Tag Instance, Platform = Windows, Language = ca, Definition  = \"&Surt"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Esci"
		#Tag Instance, Platform = Windows, Language = it, Definition  = \"&Chiudi"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Beenden"
		#Tag Instance, Platform = Windows, Language = de, Definition  = \"&Beenden"
		#Tag Instance, Platform = Linux, Language = de, Definition  = \"&Beenden"
		#Tag Instance, Platform = Mac OS, Language = de, Definition  = \"&Beenden"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"&Afsluiten"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA6\xD7\x90"
		#Tag Instance, Platform = Windows, Language = he, Definition  = \"\xD7\xA6\xD7\x90"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"W&yj\xC5\x9Bcie"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"&\xD0\x92\xD1\x8B\xD1\x85\xD0\xBE\xD0\xB4"
		#Tag Instance, Platform = Windows, Language = ru, Definition  = \"&\xD0\x92\xD1\x8B\xD1\x85\xD0\xBE\xD0\xB4"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = True, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
		#Tag Instance, Platform = Mac OS, Language = es, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = es, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kHelp, Type = String, Dynamic = True, Default = \"&Help", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Aiuto"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&Hilfe"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"&Help"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Aide"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Ajuda"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA2\xD7\x96\xD7\xA8\xD7\x94"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"&Pomoc"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"&\xD0\x9F\xD0\xBE\xD0\xBC\xD0\xBE\xD1\x89\xD1\x8C"
		#Tag Instance, Platform = Windows, Language = ru, Definition  = \"&\xD0\x9F\xD0\xBE\xD0\xBC\xD0\xBE\xD1\x89\xD1\x8C"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Ayuda"
	#tag EndConstant

	#tag Constant, Name = kHelpAbout, Type = String, Dynamic = True, Default = \"&About OpenSceneryX Installer", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&A proposito di OpenSceneryX"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&\xC3\x9Cber"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Over de OpenScenery&X installer"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"A &propos de l\'intalleur OpenSceneyX"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Sobre l\'instal\xC2\xB7lador OpenSceneryX"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x90\xD7\x95\xD7\x93\xD7\x95\xD7\xAA \xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\xA9\xD7\x9C \xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"&O Instalatorze OpenSceneryX"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"&\xD0\x9E \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD0\xB5 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 OpenSceneryX"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Acerca del Instalador OpenSceneryX"
	#tag EndConstant

	#tag Constant, Name = kKeyKajuUpdate, Type = Text, Dynamic = False, Default = \"30820120300D06092A864886F70D01010105000382010D00308201080282010100DA2AD994B9F91D39D1C6433F4578593CC096D89C874A650011C0C3095AB5C750CDCBB269A8D61EF3D86F0A4C5A7D179F2D32E54F941F873AC97F06AEA63BFA8740BDEE090E32B5FD864244C2221F18D4E05202D35B63D2874C271E4CAC9465BCB042EF2F3685757FC449A084D08809BCF8C7ACDBA74FEC3FE0EED4AC23271ACCE4D338AEFE747BC8C963A8061585927EA812BA8C304597F0CBB788B949D0AF185C29490015F926D293B9F57FCE4DD7CBA5746119215020364EC4A4285358DCF7334C89D84F313679CFC1078C14CB3BC192F1C5E1DB942F567A232FCDBE4E6EA8184AC62245B53A1CD34A54C6D69E854A6A172A02EE963E6AB33D02EEB00B43F9020111", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kLocateXPlaneFolder, Type = String, Dynamic = True, Default = \"Please locate your X-Plane\xC2\xAE folder", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Por favor localice su carpeta de X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Indiquer le chemin de votre installation X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Localitzeu la carpeta de l\'X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Per favore imposta la cartella principale di X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Lokalisieren Sie bitte Ihren X-Plane\xC2\xAE Ordner"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geef de lokatie van je X-Plane\xC2\xAEmap aan"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x90\xD7\xA0\xD7\x90 \xD7\x90\xD7\xAA\xD7\xA8 \xD7\x90\xD7\xAA \xD7\xAA\xD7\x99\xD7\xA7\xD7\x99\xD7\x99\xD7\xAA \xD7\x94\xD7\x90\xD7\xA7\xD7\xA1-\xD7\xA4\xD7\x9C\xD7\x9F\xC2\xAE \xD7\xA9\xD7\x9C\xD7\x9A"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Wska\xC5\xBC sw\xC3\xB3j katalog X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD0\xBE\xD0\xB6\xD0\xB0\xD0\xBB\xD1\x83\xD0\xB9\xD1\x81\xD1\x82\xD0\xB0\x2C \xD1\x83\xD0\xBA\xD0\xB0\xD0\xB6\xD0\xB8\xD1\x82\xD0\xB5 \xD0\xBF\xD0\xB0\xD0\xBF\xD0\xBA\xD1\x83 X-Plane\xC2\xAE"
	#tag EndConstant

	#tag Constant, Name = kPathSeparator, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"/"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"\\"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"/"
	#tag EndConstant

	#tag Constant, Name = kPreferenceBackupLibraries, Type = String, Dynamic = False, Default = \"BackupLibraries", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceBackupLibrariesDisabled, Type = String, Dynamic = False, Default = \"disabled", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceBackupLibrariesInvisible, Type = String, Dynamic = False, Default = \"invisible", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceBackupLibrariesVisible, Type = String, Dynamic = False, Default = \"visible", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceDeleteUnused, Type = String, Dynamic = False, Default = \"DeleteUnused", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceHDForests, Type = String, Dynamic = False, Default = \"HDForests", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceInstallType, Type = String, Dynamic = False, Default = \"InstallType", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceInstallTypeFull, Type = String, Dynamic = False, Default = \"full", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceInstallTypeMinimal, Type = String, Dynamic = False, Default = \"minimal", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceScanDisabled, Type = String, Dynamic = False, Default = \"ScanDisabled", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceSeasons, Type = String, Dynamic = False, Default = \"Seasons", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceSeasonsDisabled, Type = String, Dynamic = False, Default = \"disabled", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceSeasonsFourSeasons, Type = String, Dynamic = False, Default = \"fourseasons", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceSeasonsSAM, Type = String, Dynamic = False, Default = \"sam", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceSeasonsTerraMaxx, Type = String, Dynamic = False, Default = \"terramaxx", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceSeasonsXAmbience, Type = String, Dynamic = False, Default = \"xambience", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceSeasonsXEnviro, Type = String, Dynamic = False, Default = \"xenviro", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceSeasonsXPlane, Type = String, Dynamic = False, Default = \"xplane", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceStaticAircraft, Type = String, Dynamic = False, Default = \"StaticAircraft", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceXPlanePath, Type = String, Dynamic = False, Default = \"XPlanePath", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSteamLinuxDefaultPaths, Type = String, Dynamic = False, Default = \"/steam/SteamApps/common/X-plane 11\n/steam/SteamApps/common/X-plane 10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSteamMacDefaultPaths, Type = String, Dynamic = False, Default = \"/Steam/SteamApps/common/X-plane 11\n/Steam/SteamApps/common/X-plane 10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSteamWindowsDefaultPaths, Type = String, Dynamic = False, Default = \"\\steamapps\\common\\X-plane 11\n\\steamapps\\common\\X-plane 10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLBackupLibrary, Type = Text, Dynamic = False, Default = \"https://forums.x-plane.org/index.php\?/files/file/25033-backup-scenery-library/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLDevManifest, Type = Text, Dynamic = False, Default = \"https://downloads.opensceneryx.com/manifest.xml.zip", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLDevRepository, Type = Text, Dynamic = False, Default = \"https://downloads.opensceneryx.com/repository", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLKajuUpdateData, Type = Text, Dynamic = False, Default = \"https://www.opensceneryx.com/versioninfo/installerupdatedata.json", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kURLLicense, Type = Text, Dynamic = False, Default = \"https://creativecommons.org/licenses/by-nc-nd/2.0/uk/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLManifest, Type = Text, Dynamic = False, Default = \"https://downloads.opensceneryx.com/manifest.xml.zip", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLRepository, Type = Text, Dynamic = False, Default = \"https://downloads.opensceneryx.com/repository", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLSeasonsFourSeasons, Type = Text, Dynamic = False, Default = \"https://forums.x-plane.org/index.php\?/files/file/44351-four-seasons/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLSeasonsSAM, Type = Text, Dynamic = False, Default = \"https://forum.thresholdx.net/files/file/122-sam-scenery-animation-manager/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLSeasonsTerramaxx, Type = Text, Dynamic = False, Default = \"http://maxx-xp.com/terramaxx", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLSeasonsXAmbience, Type = Text, Dynamic = False, Default = \"https://forums.x-plane.org/index.php\?/forums/topic/168048-xambience-arrives/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLSeasonsXEnviro, Type = Text, Dynamic = False, Default = \"http://www.xenviro.net", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLWebsite, Type = Text, Dynamic = False, Default = \"https://www.opensceneryx.com", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="pPlatform"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

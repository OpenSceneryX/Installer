#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  savePreferences()
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
		  
		  wndMain.show
		  
		End Sub
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
		Sub loadPreferences()
		  Dim prefsFile As FolderItem = SpecialFolder.Preferences.Child(App.kApplicationName + ".plist")
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
		  dim prefsFile as FolderItem = SpecialFolder.Preferences().Child(App.kApplicationName + ".plist")
		  dim result as Boolean = pPreferences.saveXML(prefsFile, true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function stringToText(str as String) As Text
		  Return Str.ToText
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		pPreferences As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		pXPlaneFolder As FolderItem
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

	#tag Constant, Name = kColourDarkBlue, Type = Color, Dynamic = False, Default = \"&c3634a3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kColourLightBlue, Type = Color, Dynamic = False, Default = \"&cb9b8e1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kConnectionRetries, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDonationPrompt, Type = String, Dynamic = True, Default = \"If you use and like the library\x2C please consider a donation to keep it running:", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEdit, Type = String, Dynamic = True, Default = \"&Edit", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Editer"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Editar"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Edita"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Edita"
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
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Ann&ulla"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"&R\xC3\xBCckg\xC3\xA4ngig"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"&Ongedaan maken"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x91\xD7\x98\xD7\x9C"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"&Cofnij"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"&\xD0\x9E\xD1\x82\xD0\xBC\xD0\xB5\xD0\xBD\xD0\xB8\xD1\x82\xD1\x8C"
	#tag EndConstant

	#tag Constant, Name = kErrorNoCustomSceneryFolder, Type = String, Dynamic = True, Default = \"A \"Custom Scenery\" folder could not be found inside the X-Plane\xC2\xAE folder you specified\x2C please try again.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"No fue posible localizar una carpeta \"Custom Scenery\" dentro de la carpeta de X-Plane\xC2\xAE que usted especific\xC3\xB3\x2C por favor intente de nuevo."
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
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Questo installatore non pu\xC3\xB2 continuare senza aver specificato la posizione della cartella di X-Plane\xC2\xAE e verr\xC3\xA0 terminato."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Dieses Installationsprogramm funktioniert nicht\x2C solange der X-Plane\xC2\xAE Ordner nicht lokalisiert ist. Das Programm wird nun beendet."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Deze installer werkt niet als hij niet weet waar je X-Plane\xC2\xAE map is en wordt nu afgesloten."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\x94\xD7\x96\xD7\x94 \xD7\x9C\xD7\x90 \xD7\x99\xD7\x9B\xD7\x95\xD7\x9C \xD7\x9C\xD7\xA2\xD7\x91\xD7\x95\xD7\x93 \xD7\x9E\xD7\x91\xD7\x9C\xD7\x99 \xD7\x9C\xD7\x93\xD7\xA2\xD7\xAA \xD7\x94\xD7\x99\xD7\x9B\xD7\x9F \xD7\xAA\xD7\x99\xD7\xA7\xD7\x99\xD7\xAA \xD7\x94\xD7\x90\xD7\xA7\xD7\xA1-\xD7\xA4\xD7\x9C\xD7\x9F\xC2\xAE \xD7\xA9\xD7\x9C\xD7\x9A \xD7\xA0\xD7\x9E\xD7\xA6\xD7\x90\xD7\xAA \xD7\x95\xD7\x9B\xD7\xA2\xD7\xAA \xD7\x99\xD7\x99\xD7\xA1\xD7\x92\xD7\xA8."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Instalator zako\xC5\x84czy prac\xC4\x99 gdy\xC5\xBC nie mo\xC5\xBCe kontynuowa\xC4\x87 bez informacji gdzie znajduje si\xC4\x99 katalog X-Plane\xC2\xAE."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD0\xB0 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 \xD0\xBD\xD0\xB5 \xD0\xBC\xD0\xBE\xD0\xB6\xD0\xB5\xD1\x82 \xD1\x80\xD0\xB0\xD0\xB1\xD0\xBE\xD1\x82\xD0\xB0\xD1\x82\xD1\x8C \xD0\xB1\xD0\xB5\xD0\xB7 \xD1\x83\xD0\xBA\xD0\xB0\xD0\xB7\xD0\xB0\xD0\xBD\xD0\xB8\xD1\x8F \xD0\xBC\xD0\xB5\xD1\x81\xD1\x82\xD0\xBE\xD0\xBF\xD0\xBE\xD0\xBB\xD0\xBE\xD0\xB6\xD0\xB5\xD0\xBD\xD0\xB8\xD1\x8F \xD0\xBF\xD0\xB0\xD0\xBF\xD0\xBA\xD0\xB8 X-Plane\xC2\xAE \xD0\xB8 \xD0\xB7\xD0\xB0\xD0\xB2\xD0\xB5\xD1\x80\xD1\x88\xD0\xB0\xD0\xB5\xD1\x82 \xD1\x80\xD0\xB0\xD0\xB1\xD0\xBE\xD1\x82\xD1\x83."
	#tag EndConstant

	#tag Constant, Name = kErrorSteamNotFound, Type = String, Dynamic = True, Default = \"A Steam installation could not be found.", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kErrorXPlaneSteamFolderNotFound, Type = String, Dynamic = True, Default = \"The XPlane Steam folder could not be found at ${1}.", Scope = Public
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
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = True, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Salir"
		#Tag Instance, Platform = Windows, Language = es, Definition  = \"&Salir"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"&Quitter"
		#Tag Instance, Platform = Windows, Language = fr, Definition  = \"&Quitter"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Surt"
		#Tag Instance, Platform = Windows, Language = ca, Definition  = \"&Surt"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"&Chiudi"
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
	#tag EndConstant

	#tag Constant, Name = kHelp, Type = String, Dynamic = True, Default = \"&Help", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Aiut&o"
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
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"&Quan a l\'instal\xC2\xB7lador OpenSceneryX"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x90\xD7\x95\xD7\x93\xD7\x95\xD7\xAA \xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\xA9\xD7\x9C \xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"&O Instalatorze OpenSceneryX"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"&\xD0\x9E \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD0\xB5 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 OpenSceneryX"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"&Acerca del Instalador OpenSceneryX"
	#tag EndConstant

	#tag Constant, Name = kHTTPLogin, Type = String, Dynamic = False, Default = \"opensceneryx_installer", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kHTTPPassword, Type = String, Dynamic = False, Default = \"0p3nsc3n3ryx\xC2\xA3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLocateXPlaneFolder, Type = String, Dynamic = True, Default = \"Please locate your X-Plane\xC2\xAE folder", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Por favor localice su carpeta de X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Indiquer le chemin de votre installation X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Trieu la carpeta de l\'X-Plane\xC2\xAE"
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

	#tag Constant, Name = kPreferenceInstallType, Type = String, Dynamic = False, Default = \"InstallType", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceInstallTypeFull, Type = String, Dynamic = False, Default = \"full", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceInstallTypeMinimal, Type = String, Dynamic = False, Default = \"minimal", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPreferenceScanDisabled, Type = String, Dynamic = False, Default = \"ScanDisabled", Scope = Public
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

	#tag Constant, Name = kURLDevVersion, Type = Text, Dynamic = False, Default = \"https://www.opensceneryx.com/versioninfo/installerdevversion.txt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLLicense, Type = Text, Dynamic = False, Default = \"https://creativecommons.org/licenses/by-nc-nd/2.0/uk/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLManifest, Type = Text, Dynamic = False, Default = \"https://downloads.opensceneryx.com/manifest.xml.zip", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLRepository, Type = Text, Dynamic = False, Default = \"https://downloads.opensceneryx.com/repository", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLVersion, Type = Text, Dynamic = False, Default = \"https://www.opensceneryx.com/versioninfo/installerversion.txt", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kURLWebsite, Type = Text, Dynamic = False, Default = \"https://www.opensceneryx.com", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass

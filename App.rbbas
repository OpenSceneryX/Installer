#tag ClassProtected Class AppInherits Application	#tag Event		Sub Open()		  // The file menu is empty on the Mac, so hide it		  #if targetMacOS		    FileMenu.visible = false		  #endif		  		  pPreferences = new Dictionary()		  loadPreferences()		  		  dim xPlanePath as String		  if (pPreferences.hasKey("XPlanePath")) then xPlanePath = pPreferences.value("XPlanePath")		  if (xPlanePath <> "") then pXPlaneFolder = getFolderItem(xPlanePath, FolderItem.PathTypeAbsolute)		  		  if (pXPlaneFolder = nil or not pXPlaneFolder.exists() or not pXPlaneFolder.directory or not pXPlaneFolder.child("Custom Scenery").exists()) then		    dim result as Boolean = getXPlaneFolder(true)		  end if		End Sub	#tag EndEvent	#tag Event		Sub Close()		  savePreferences()		End Sub	#tag EndEvent	#tag Method, Flags = &h21		Private Sub loadPreferences()		  dim prefsFile as FolderItem = PreferencesFolder().Child(App.kApplicationName + ".plist")		  if (prefsFile.exists()) then		    if (not pPreferences.loadXML(prefsFile)) then		      pPreferences = new Dictionary()		    end if		  end if		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function getXPlaneFolder(require as Boolean) As boolean		  // Returns true if the user chose a new folder (and require is false)		  		  dim dialog as SelectFolderDialog = new SelectFolderDialog()		  dim xPlanePath as String		  dim xPlaneFolder as FolderItem		  		  dialog.title = "Please locate your X-Plane® folder"		  dialog.promptText = "Please locate your X-Plane® folder"		  		  #if TargetWin32		    dialog.initialDirectory = Volume(0).Child("Program Files")		  #elseif TargetMacOS		    dialog.initialDirectory = Volume(0).Child("Applications")		  #elseif TargetLinux		    dialog.initialDirectory = Volume(0)		  #endif		  		  while true		    xPlaneFolder = dialog.showModal()		    if (xPlaneFolder = nil) then		      if (require) then		        msgBox("This installer cannot work without knowing where your X-Plane® folder is located and will now quit.")		        quit		      else		        return false		      end if		    end if		    		    dim customSceneryFolder as FolderItem = xPlaneFolder.child("Custom Scenery")		    if (customSceneryFolder = nil or not customSceneryFolder.exists()) then		      msgBox("A 'Custom Scenery' folder could not be found inside the X-Plane® folder you specified, please try again")		    else		      pXPlaneFolder = xPlaneFolder		      pPreferences.value("XPlanePath") = pXPlaneFolder.absolutePath		      return true		    end if		  wend		  		  		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Sub savePreferences()		  dim prefsFile as FolderItem = PreferencesFolder().Child(App.kApplicationName + ".plist")		  dim result as Boolean = pPreferences.saveXML(prefsFile, true)		End Sub	#tag EndMethod	#tag Property, Flags = &h21		Private pPreferences As Dictionary	#tag EndProperty	#tag Property, Flags = &h0		pXPlaneFolder As FolderItem	#tag EndProperty	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"	#tag EndConstant	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"	#tag EndConstant	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"	#tag EndConstant	#tag Constant, Name = kApplicationName, Type = String, Dynamic = False, Default = \"OpenSceneryX Installer", Scope = Public	#tag EndConstant	#tag Constant, Name = kRepositoryLocalURL, Type = String, Dynamic = False, Default = \"127.0.0.1/~austin/opensceneryx", Scope = Public	#tag EndConstant	#tag Constant, Name = kRepositoryURL, Type = String, Dynamic = False, Default = \"www.opensceneryx.com", Scope = Public	#tag EndConstant	#tag ViewBehavior	#tag EndViewBehaviorEnd Class#tag EndClass
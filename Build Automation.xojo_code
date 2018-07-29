#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep scrCodeSign , AppliesTo = 2
					Dim command As String
					Dim result As String
					
					// Remove all Finder information from files (codesign fails if this is not done)
					command = "xattr -cr ""OpenSceneryX Installer.app"""
					result = DoShellCommand(command)
					
					// Sign the build
					command = "codesign -f --deep -s ""Developer ID Application: Austin Goudge"" ""OpenSceneryX Installer.app"""
					result = DoShellCommand(command)
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep copyFileszlib
					AppliesTo = 0
					Destination = 0
					Subdirectory = 
					FolderItem = Li4vTGlicmFyaWVzL3psaWIxLTY0L3psaWIxLmRsbA==
				End
			End
#tag EndBuildAutomation

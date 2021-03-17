#tag Window
Begin Window wndAbout
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   350
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   350
   MinimizeButton  =   True
   MinWidth        =   276
   Placement       =   2
   Resizeable      =   False
   Title           =   "#kWindowTitle"
   Visible         =   True
   Width           =   276
   Begin Label txtWebAddress
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "www.opensceneryx.com"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   80
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   236
   End
   Begin Timer tmrScroll
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   2
      Period          =   50
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Canvas cnvAboutText
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   198
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   112
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   236
   End
   Begin Label txtVersion
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   156
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "v"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   322
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Canvas cnvHeaderBG
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   74
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   276
      Begin Canvas cnvHeaderX
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   74
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cnvHeaderBG"
         Left            =   -72
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   0
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   348
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  yScroll = cnvAboutText.height + 20
		  txtVersion.text = "v" + App.ShortVersion
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			me.close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Property, Flags = &h0
		yScroll As Integer = 0
	#tag EndProperty


	#tag Constant, Name = kAboutBoxContents, Type = String, Dynamic = True, Default = \"OpenSceneryX Installer Copyright \xC2\xA92020 Austin Goudge (austin@opensceneryx.com)\n\nMany thanks go to:\n\nPhilip Carlisle\x2C Olivier Faivre\x2C Georges Gabet\x2C Valentin Kaufmann\x2C Tom Kyler\x2C Gerrit-Jan Rebel\x2C Jordi Sayol for testing\n\nNicola Altafini\x2C Haris Amiel\x2C Olivier Faivre\x2C Jon Hyams\x2C Valentin Kaufmann\x2C Matteo Lorenzini\x2C Gerrit-Jan Rebel\x2C Michal Rybinski\x2C Amado Chi\xC3\xB1as S\xC3\xA1nchez\x2C Jordi Sayol\x2C Luca S\xC3\xB6the\x2C M. Vishnyakov for the translations\n\nAll the contributors to OpenSceneryX\x2C without which the installer would be kind of pointless!\n\n\n\nThis software uses Thomas Tempelmann\'s Zip Package (www.tempel.org)\x2C Kevin Ballard\'s XMLDictionary module (www.tildesoft.com) and Kem Tekinay\'s Kaju Package (https://github.com/ktekinay/Kaju)", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"OpenSceneryX Installer Copyright \xC2\xA92020 Austin Goudge (austin@opensceneryx.com)\n\nOnze dank gaat uit naar:\n\nPhilip Carlisle\x2C Olivier Faivre\x2C Georges Gabet\x2C Valentin Kaufmann\x2C Tom Kyler\x2C Gerrit-Jan Rebel\x2C Jordi Sayol voor test werkzaamheden\n\nNicola Altafini\x2C Haris Amiel\x2C Olivier Faivre\x2C Jon Hyams\x2C Valentin Kaufmann\x2C Matteo Lorenzini\x2C Gerrit-Jan Rebel\x2C Michal Rybinski\x2C Amado Chi\xC3\xB1as S\xC3\xA1nchez\x2C Jordi Sayol\x2C Luca S\xC3\xB6the\x2C M. Vishnyakov voor de vertalingen\n\nAlle mensen die bijdragen aan OpenSceneryX\x2C zonder hen heeft de installer geen zin! \n\n\n\nDeze software gebruikt Thomas Tempelmann\'s Zip pakket (www.tempel.org)\x2C Kevin Ballard\'s XMLDictionary module (www.tildesoft.com) en Kem Tekinay\'s Kaju Package (https://github.com/ktekinay/Kaju)\n"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"OpenSceneryX Installer Copyright \xC2\xA92020 Austin Goudge (austin@opensceneryx.com)\n\nVielen Dank an:\n\nPhilip Carlisle\x2C Olivier Faivre\x2C Georges Gabet\x2C Valentin Kaufmann\x2C Tom Kyler\x2C Gerrit-Jan Rebel\x2C Jordi Sayol f\xC3\xBCr die Software-Tests.\n\nNicola Altafini\x2C Haris Amiel\x2C Olivier Faivre\x2C Jon Hyams\x2C Valentin Kaufmann\x2C Matteo Lorenzini\x2C Gerrit-Jan Rebel\x2C Michal Rybinski\x2C Amado Chi\xC3\xB1as S\xC3\xA1nchez\x2C Jordi Sayol\x2C Luca S\xC3\xB6the\x2C M. Vishnyakov f\xC3\xBCr die \xC3\x9Cbersetzungen.\n\nDer Dank geht auch an alle die OpenSceneryX unterst\xC3\xBCtzen\x2C ohne die dieses Installationsprogramm irgendwie sinnlos w\xC3\xA4re!\n\n\n\nDiese Software verwendet Thomas Tempelmann\'s Zip Packet (www.tempel.org)\x2C Kevin Ballard\'s XMLDictionary Module (www.tildesoft.com) und Kem Tekinay\'s Kaju Package (https://github.com/ktekinay/Kaju)\n"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Installeur OpenSceneryX Copyright \xC2\xA92020 Austin Goudge (austin@opensceneryx.com)\n\nRemerciements \xC3\xA0:\n\nPhilip Carlisle\x2C Olivier Faivre\x2C Georges Gabet\x2C Valentin Kaufmann\x2C Tom Kyler\x2C Gerrit-Jan Rebel\x2C Jordi Sayol pour leurs tests\n\nNicola Altafini\x2C Haris Amiel\x2C Olivier Faivre\x2C Jon Hyams\x2C Valentin Kaufmann\x2C Matteo Lorenzini\x2C Gerrit-Jan Rebel\x2C Michal Rybinski\x2C Amado Chi\xC3\xB1as S\xC3\xA1nchez\x2C Jordi Sayol\x2C Luca S\xC3\xB6the\x2C M. Vishnyakov pour leurs traductions\n\nTous les contributeurs \xC3\xA0 OpenSceneryX sans qui l\'installeur ne servirait \xC3\xA0 rien !\n\n\n\nCe logiciel utilise Zip Package de Thomas Tempelmann (www.tempel.org)\x2C le module XMLDictionary de Kevin Ballard (www.tildesoft.com) et Kaju Package de Kem Tekinay (https://github.com/ktekinay/Kaju)"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Instal\xC2\xB7lador de l\'OpenSceneryX Copyright \xC2\xA92020 Austin Goudge (austin@opensceneryx.com)\n\nMoltes gr\xC3\xA0cies a:\n\nPhilip Carlisle\x2C Olivier Faivre\x2C Georges Gabet\x2C Valentin Kaufmann\x2C Tom Kyler\x2C Gerrit-Jan Rebel\x2C Jordi Sayol per les proves\n\nNicola Altafini\x2C Haris Amiel\x2C Olivier Faivre\x2C Jon Hyams\x2C Valentin Kaufmann\x2C Matteo Lorenzini\x2C Gerrit-Jan Rebel\x2C Michal Rybinski\x2C Amado Chi\xC3\xB1as S\xC3\xA1nchez\x2C Jordi Sayol\x2C Luca S\xC3\xB6the\x2C M. Vishnyakov per les traduccions\n\nTots els col\xC2\xB7laboradors de l\'OpenSceneryX\x2C sense els quals l\'instal\xC2\xB7lador no tindria cap mena de sentit!\n\n\n\nAquest programa utilitza el Zip Package d\'en Thomas Tempelmann (www.tempel.org)\x2C el m\xC3\xB2dul XMLDictionary d\'en Kevin Ballard (www.tildesoft.com) i Kaju Package d\'en Kem Tekinay (https://github.com/ktekinay/Kaju)"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x96\xD7\x9B\xD7\x95\xD7\x99\xD7\x95\xD7\xAA \xD7\x94\xD7\x99\xD7\x95\xD7\xA6\xD7\xA8\xD7\x99\xD7\x9D \xD7\xA9\xD7\x9C \xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\x94\xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1 \xC2\xA92020 \xD7\x90\xD7\x95\xD7\xA1\xD7\x98\xD7\x99\xD7\x9F \xD7\x92\xD7\x95\xD7\x93\xD7\x92\' - Austin Goudge  (austin@opensceneryx.com)\n\n\xD7\xAA\xD7\x95\xD7\x93\xD7\x94 \xD7\xA8\xD7\x91\xD7\x94 \xD7\x9C:\n\n\xD7\xA1\xD7\xA8\xD7\x92\'\xD7\x99\xD7\x95 \xD7\xA1\xD7\xA0\xD7\x98\xD7\x92\xD7\x93\xD7\x94 \xD7\xA9\xD7\x94\xD7\xA1\xD7\x9B\xD7\x99\xD7\x9D \xD7\xA9\xD7\x94\xD7\xA1\xD7\x9E\xD7\x9C \xD7\x99\xD7\x94\xD7\x99\xD7\x94 \xD7\x9E\xD7\x91\xD7\x95\xD7\xA1\xD7\xA1 \xD7\xA2\xD7\x9C \xD7\x99\xD7\xA6\xD7\x99\xD7\xA8\xD7\xAA \xD7\x94\xD7\x90\xD7\x95\xD7\x9E\xD7\xA0\xD7\x95\xD7\xAA \xD7\xA9\xD7\x9C \xD7\x94\xD7\xA1\xD7\x9E\xD7\x9C \xD7\xA9\xD7\x9C \xD7\x90\xD7\xA7\xD7\xA1-\xD7\xA4\xD7\x9C\xD7\x9F\xC2\xAE\n\n\xD7\xA4\xD7\x99\xD7\x9C\xD7\x99\xD7\xA4 \xD7\xA7\xD7\xA8\xD7\x9C\xD7\x99\xD7\xA1\xD7\x9C\x2C \xD7\x90\xD7\x95\xD7\x9C\xD7\x99\xD7\x91\xD7\xA8 \xD7\xA4\xD7\x99\xD7\x99\xD7\x91\xD7\xA8\x2C \xD7\x92\'\xD7\x95\xD7\xA8\xD7\x96\' \xD7\x92\xD7\x90\xD7\x91\xD7\x98\x2C \xD7\x95\xD7\x9C\xD7\xA0\xD7\x98\xD7\x99\xD7\x9F \xD7\xA7\xD7\x90\xD7\x95\xD7\xA4\xD7\x9E\xD7\x9F\x2C \xD7\x98\xD7\x95\xD7\x9D\xD7\xA7\xD7\x99\xD7\x99\xD7\x9C\xD7\xA8\x2C \xD7\x92\xD7\xA8\xD7\x99\xD7\x98-\xD7\x96\'\xD7\x90\xD7\x9F \xD7\xA8\xD7\x91\xD7\x9C\x2C \xD7\x92\'\xD7\x95\xD7\xA8\xD7\x93\xD7\x99 \xD7\xA1\xD7\x90\xD7\x99\xD7\x95\xD7\x9C \xD7\xA2\xD7\x9C \xD7\x94\xD7\xAA\xD7\x91\xD7\x97\xD7\x95\xD7\x9F\n\n\xD7\xA0\xD7\x99\xD7\xA7\xD7\x95\xD7\x9C\xD7\x94 \xD7\x90\xD7\x9C\xD7\x98\xD7\x90\xD7\xA4\xD7\x99\xD7\xA0\xD7\x99\x2C \xD7\xA4\xD7\x91\xD7\x99\xD7\x90\xD7\x9F\x2C \xD7\x90\xD7\x95\xD7\x9C\xD7\x99\xD7\x91\xD7\xA8 \xD7\xA4\xD7\x99\xD7\x99\xD7\x91\xD7\xA8\x2C \xD7\x95\xD7\x9C\xD7\xA0\xD7\x98\xD7\x99\xD7\x9F \xD7\xA7\xD7\x90\xD7\x95\xD7\xA4\xD7\x9E\xD7\x9F\x2C \xD7\x92\xD7\xA8\xD7\x99\xD7\x98-\xD7\x96\'\xD7\x90\xD7\x9F \xD7\xA8\xD7\x91\xD7\x9C\x2C \xD7\x92\'\xD7\x95\xD7\xA8\xD7\x93\xD7\x99 \xD7\xA1\xD7\x90\xD7\x99\xD7\x95\xD7\x9C\x2C \xD7\x92\'\xD7\x95\xD7\x9F \xD7\x94\xD7\x99\xD7\x99\xD7\x9E\xD7\xA1 \xD7\xA2\xD7\x9C \xD7\x94\xD7\xAA\xD7\xA8\xD7\x92\xD7\x95\xD7\x9E\xD7\x99\xD7\x9D\n\n\xD7\x9C\xD7\x9B\xD7\x9C \xD7\x94\xD7\xAA\xD7\x95\xD7\xA8\xD7\x9E\xD7\x99\xD7\x9D \xD7\x9C\xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1\x2C \xD7\xA9\xD7\x91\xD7\x9C\xD7\xA2\xD7\x93\xD7\x99\xD7\x94\xD7\x9D \xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\x94\xD7\x99\xD7\x94 \xD7\x9E\xD7\xA2\xD7\x99\xD7\x9F \xD7\x97\xD7\xA1\xD7\xA8 \xD7\x98\xD7\xA2\xD7\x9D!\n\n\n\n\xD7\x94\xD7\xAA\xD7\x95\xD7\x9B\xD7\xA0\xD7\x94 \xD7\x94\xD7\x96\xD7\x95 \xD7\x9E\xD7\xA9\xD7\xAA\xD7\x9E\xD7\xA9\xD7\xAA \xD7\x93\xD7\x95\xD7\x97\xD7\xA1 \xD7\xA9\xD7\x9C \xD7\xAA\xD7\x95\xD7\x9E\xD7\xA1 \xD7\x98\xD7\x9E\xD7\xA4\xD7\x9C\xD7\x9E\xD7\xA0\xD7\xA1(www.tempel.org) \xD7\x95\xD7\x91\xD7\x9E\xD7\x95\xD7\x93\xD7\x95\xD7\x9C \xD7\x90\xD7\xA7\xD7\xA1-\xD7\x90\xD7\x9D-\xD7\x90\xD7\x9C-\xD7\x93\xD7\x99\xD7\xA7\xD7\xA9\xD7\x99\xD7\x95\xD7\xA0\xD7\x90\xD7\xA8\xD7\x99 \xD7\xA9\xD7\x9C \xD7\xA7\xD7\x95\xD7\x95\xD7\x99\xD7\x9F \xD7\x91\xD7\x9C\xD7\x90\xD7\xA8\xD7\x93 (www.tildesoft.com)\n\nMany thanks go to:\n\nPhilip Carlisle\x2C Olivier Faivre\x2C Georges Gabet\x2C Valentin Kaufmann\x2C Tom Kyler\x2C Gerrit-Jan Rebel\x2C Jordi Sayol for testing\n\nNicola Altafini\x2C Haris Amiel\x2C Olivier Faivre\x2C Jon Hyams\x2C Valentin Kaufmann\x2C Matteo Lorenzini\x2C Gerrit-Jan Rebel\x2C Michal Rybinski\x2C Amado Chi\xC3\xB1as S\xC3\xA1nchez\x2C Jordi Sayol\x2C Luca S\xC3\xB6the\x2C M. Vishnyakov for the translations\n\nAll the contributors to OpenSceneryX\x2C without which the installer would be kind of pointless!\n\n\n\nThis software uses Thomas Tempelmann\'s Zip Package (www.tempel.org)\x2C Kevin Ballard\'s XMLDictionary module (www.tildesoft.com) and Kem Tekinay\'s Kaju Package (https://github.com/ktekinay/Kaju)"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Instalator OpenSceneryX\x2C Prawa Autorskie \xC2\xA92020 Austin Goudge (austin@opensceneryx.com)\n\nPodzi\xC4\x99kowania dla:\n\nPhilip Carlisle\x2C Olivier Faivre\x2C Georges Gabet\x2C Valentin Kaufmann\x2C Tom Kyler\x2C Gerrit-Jan Rebel\x2C Jordi Sayol za testowanie\n\nNicola Altafini\x2C Haris Amiel\x2C Olivier Faivre\x2C Jon Hyams\x2C Valentin Kaufmann\x2C Matteo Lorenzini\x2C Gerrit-Jan Rebel\x2C Michal Rybinski\x2C Amado Chi\xC3\xB1as S\xC3\xA1nchez\x2C Jordi Sayol\x2C Luca S\xC3\xB6the\x2C M. Vishnyakov za t\xC5\x82umaczenia\n\nWszystkich maj\xC4\x85cych wk\xC5\x82ad w OpenSceneryX\x2C bez Was ten Instalator by\xC5\x82 by bezcelowy!\n\n\n\nTen program u\xC5\xBCywa kodu Zip Package autorstwa Thomasa Tempelmanna (www.tempel.org)\x2C modu\xC5\x82 XMLDictionary autorstwa Kevina Ballarda (www.tildesoft.com) i Kaju Package autorstwa Kem Tekinay (https://github.com/ktekinay/Kaju)"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD0\xB0 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 OpenSceneryX Copyright \xC2\xA92020 Austin Goudge (austin@opensceneryx.com)\n\n\xD0\x91\xD0\xBB\xD0\xB0\xD0\xB3\xD0\xBE\xD0\xB4\xD0\xB0\xD1\x80\xD0\xBD\xD0\xBE\xD1\x81\xD1\x82\xD0\xB8:\n\nPhilip Carlisle\x2C Olivier Faivre\x2C Georges Gabet\x2C Valentin Kaufmann\x2C Tom Kyler\x2C Gerrit-Jan Rebel\x2C Jordi Sayol - \xD1\x82\xD0\xB5\xD1\x81\xD1\x82\xD0\xB8\xD1\x80\xD0\xBE\xD0\xB2\xD0\xB0\xD0\xBD\xD0\xB8\xD0\xB5\n\nNicola Altafini\x2C Haris Amiel\x2C Olivier Faivre\x2C Jon Hyams\x2C Valentin Kaufmann\x2C Matteo Lorenzini\x2C Gerrit-Jan Rebel\x2C Michal Rybinski\x2C Amado Chi\xC3\xB1as S\xC3\xA1nchez\x2C Jordi Sayol\x2C Luca S\xC3\xB6the\x2C M. Vishnyakov - \xD0\xBF\xD0\xB5\xD1\x80\xD0\xB5\xD0\xB2\xD0\xBE\xD0\xB4\n\n\xD0\x92\xD1\x81\xD0\xB5\xD0\xBC\x2C \xD0\xBA\xD1\x82\xD0\xBE \xD0\xB2\xD0\xBD\xD0\xB5\xD1\x81 \xD0\xB2\xD0\xBA\xD0\xBB\xD0\xB0\xD0\xB4 \xD0\xB2 \xD1\x80\xD0\xB0\xD0\xB7\xD1\x80\xD0\xB0\xD0\xB1\xD0\xBE\xD1\x82\xD0\xBA\xD1\x83 OpenSceneryX\x2C \xD0\xB1\xD0\xB5\xD0\xB7 \xD0\xBA\xD0\xBE\xD1\x82\xD0\xBE\xD1\x80\xD0\xBE\xD0\xB3\xD0\xBE \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD0\xB0 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 \xD0\xBD\xD0\xB5 \xD0\xB8\xD0\xBC\xD0\xB5\xD0\xBB\xD0\xB0 \xD0\xB1\xD1\x8B \xD1\x81\xD0\xBC\xD1\x8B\xD1\x81\xD0\xBB\xD0\xB0!\n\n\n\nThis software uses Thomas Tempelmann\'s Zip Package (www.tempel.org)\x2C Kevin Ballard\'s XMLDictionary module (www.tildesoft.com) and Kem Tekinay\'s Kaju Package (https://github.com/ktekinay/Kaju)"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Instalador de OpenSceneryX Derecho de Autor \xC2\xA92020 Austin Goudge (austin@opensceneryx.com)\n\nMuchas gracias a:\n\nPhilip Carlisle\x2C Olivier Faivre\x2C Georges Gabet\x2C Valentin Kaufmann\x2C Tom Kyler\x2C Gerrit-Jan Rebel\x2C Jordi Sayol por probar el programa.\n\nNicola Altafini\x2C Haris Amiel\x2C Olivier Faivre\x2C Jon Hyams\x2C Valentin Kaufmann\x2C Matteo Lorenzini\x2C Gerrit-Jan Rebel\x2C Michal Rybinski\x2C Amado Chi\xC3\xB1as S\xC3\xA1nchez\x2C Jordi Sayol\x2C Luca S\xC3\xB6the\x2C M. Vishnyakov por las traducciones.\n\nA todos los colaboradores y contribuyentes de OpenSceneryX\x2C sin los cuales el instalador no tendr\xC3\xADa raz\xC3\xB3n de ser.\n\n\n\nEste programa usa el Paquete Zip de Thomas Tempelmann (www.tempel.org)\x2C el modulo XMLDictionary de Kevin Ballard (www.tildesoft.com) y el Paquete Kaju de Kem Tekinay (https://github.com/ktekinay/Kaju)"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"OpensSceneryX installer Copyright \xC2\xA92020 Austin Goudge (austin@opensceneryx.com)\n\nRingraziamenti anche a:\n\nPhilip Carlisle\x2C Olivier Faivre\x2C Georges Gabet\x2C Valentin Kaufmann\x2C Tom Kyler\x2C Gerrit-Jan Rebel\x2C Jordi Sayol per aver testato\n\nNicola Altafini\x2C Haris Amiel\x2C Olivier Faivre\x2C Jon Hyams\x2C Valentin Kaufmann\x2C Matteo Lorenzini\x2C Gerrit-Jan Rebel\x2C Michal Rybinski\x2C Amado Chi\xC3\xB1as S\xC3\xA1nchez\x2C Jordi Sayol\x2C Luca S\xC3\xB6the\x2C M. Vishnyakov per le traduzioni\n\nTutti I contribuenti di OpenSceneryX\x2C senza il quale sarebbe stato tutto inutile!\n\n\n\nQuesto software usa i pacchetti Zip di Thomas Tempelmann (www.tempel.org)\x2C Kevin Ballard\'s XMLDictionary module (www.tildesoft.com) y pacchetti Kaju di Kem Tekinay (https://github.com/ktekinay/Kaju)"
	#tag EndConstant

	#tag Constant, Name = kWindowTitle, Type = String, Dynamic = True, Default = \"About OpenSceneryX Installer", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Over de OpenSceneryX installer"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"\xC3\x9Cber das OpenSceneryX Installationsprogramm"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"A propos de l\'installeur OpenSceneryX"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Sobre l\'instal\xC2\xB7lador de l\'OpenSceneryX"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x90\xD7\x95\xD7\x93\xD7\x95\xD7\xAA \xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\xA9\xD7\x9C \xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"O Instalatorze OpenSceneryX"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9E \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD0\xB5 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 OpenSceneryX"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Acerca del Instalador de OpenSceneryX"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Altro sull\xE2\x80\x99Installatore di OpenSceneryX"
	#tag EndConstant


#tag EndWindowCode

#tag Events txtWebAddress
	#tag Event
		Sub Open()
		  me.mousecursor = system.cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  ShowURL("https://www.opensceneryx.com")
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tmrScroll
	#tag Event
		Sub Action()
		  yScroll = yScroll - 1
		  
		  if yScroll <= -300 then
		    yScroll = cnvAboutText.height + 20
		  end if
		  
		  cnvAboutText.refresh
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvAboutText
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.textSize = 9
		  
		  If IsDarkMode Then
		    g.foreColor = &cFFFFFF
		  Else
		    g.ForeColor = &c000000
		  End If
		  
		  g.drawString(kAboutBoxContents, 0, yScroll, Me.width)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvHeaderBG
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  showURL(App.kURLWebsite)
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.mouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  'Need to draw dynamically so that the image is scaled to the on screen region.  Caters for Retina and normal displays.
		  g.DrawPicture(imgBannerBG, 0, 0, g.Width, g.Height, 0, 0, imgBannerBG.Width, imgBannerBG.Height)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvHeaderX
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  showURL(App.kURLWebsite)
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.mouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  'Need to draw dynamically so that the image is scaled to the on screen region.  Caters for Retina and normal displays.
		  g.DrawPicture(imgBannerX, 0, 0, g.Width, g.Height, 0, 0, imgBannerX.Width, imgBannerX.Height)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="yScroll"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior

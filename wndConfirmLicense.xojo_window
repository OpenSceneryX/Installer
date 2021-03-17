#tag Window
Begin Window wndConfirmLicense
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   8
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   188
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   188
   MinimizeButton  =   True
   MinWidth        =   493
   Placement       =   0
   Resizeable      =   False
   Title           =   "#kWindowTitle"
   Visible         =   True
   Width           =   493
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   56
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kAgreeLicense"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   32
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   435
   End
   Begin Label StaticText2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   56
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kClickAgree"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   91
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   441
   End
   Begin AutoHeightPushButton btnAgree
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "#kAgree"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   372
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   148
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   101
   End
   Begin AutoHeightPushButton btnDisagree
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "#kDisagree"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   259
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   148
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   101
   End
   Begin AutoHeightPushButton btnReadLicense
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "#kReadLicense"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   32
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   148
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   128
   End
End
#tag EndWindow

#tag WindowCode
	#tag Constant, Name = kAgree, Type = String, Dynamic = True, Default = \"Agree", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Akkoord"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"ZUSTIMMEN"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"J\'accepte"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"D\'acord"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9E\xD7\xA1\xD7\x9B\xD7\x99\xD7\x9D"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Zgoda"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xB8\xD0\xBD\xD0\xB8\xD0\xBC\xD0\xB0\xD1\x8E"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"De Acuerdo"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Accetto"
	#tag EndConstant

	#tag Constant, Name = kAgreeLicense, Type = String, Dynamic = True, Default = \"To continue installing the software you must agree to the terms of the license.", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Om met installatie verder te gaan moet je akkoord gaan met de voorwaarden van de licentie"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Um mit der Installation fortzufahren m\xC3\xBCssen Sie den Lizenzbestimmungen zustimmen."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Avant d\'installer ce logiciel\x2C vous devez accepter les termes de la license."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Per continuar instal\xC2\xB7lant el programa heu d\'estar d\'acord amb els termes de la llic\xC3\xA8ncia."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x91\xD7\x9B\xD7\x93\xD7\x99 \xD7\x9C\xD7\x94\xD7\x9E\xD7\xA9\xD7\x99\xD7\x9A \xD7\x91\xD7\x94\xD7\xAA\xD7\xA7\xD7\xA0\xD7\xAA \xD7\x94\xD7\xAA\xD7\x95\xD7\x9B\xD7\xA0\xD7\x94 \xD7\x90\xD7\xAA\xD7\x94 \xD7\x97\xD7\x99\xD7\x99\xD7\x91 \xD7\x9C\xD7\x94\xD7\xA1\xD7\x9B\xD7\x99\xD7\x9D \xD7\x9C\xD7\xAA\xD7\xA0\xD7\x90\xD7\x99 \xD7\x94\xD7\xA8\xD7\xA9\xD7\x99\xD7\x95\xD7\x9F."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Aby kontynuowa\xC4\x87 instalacj\xC4\x99 oprogramowania musisz zgodzi\xC4\x87 si\xC4\x99 na warunki licencji."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x94\xD0\xBB\xD1\x8F \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB4\xD0\xBE\xD0\xBB\xD0\xB6\xD0\xB5\xD0\xBD\xD0\xB8\xD1\x8F \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 \xD0\xB2\xD1\x8B \xD0\xB4\xD0\xBE\xD0\xBB\xD0\xB6\xD0\xBD\xD1\x8B \xD0\xBF\xD1\x80\xD0\xB8\xD0\xBD\xD1\x8F\xD1\x82\xD1\x8C \xD1\x83\xD1\x81\xD0\xBB\xD0\xBE\xD0\xB2\xD0\xB8\xD1\x8F \xD0\x9B\xD0\xB8\xD1\x86\xD0\xB5\xD0\xBD\xD0\xB7\xD0\xB8\xD0\xBE\xD0\xBD\xD0\xBD\xD0\xBE\xD0\xB3\xD0\xBE \xD1\x81\xD0\xBE\xD0\xB3\xD0\xBB\xD0\xB0\xD1\x88\xD0\xB5\xD0\xBD\xD0\xB8\xD1\x8F."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Para continuar instalando el programa debe estar de acuerdo con los t\xC3\xA9rminos de la licencia."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Per continuare l\xE2\x80\x99installazione del software devi accettare i termini della licenza. "
	#tag EndConstant

	#tag Constant, Name = kClickAgree, Type = String, Dynamic = True, Default = \"Click Agree to continue or click Disagree to cancel the installation and quit the Installer.", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Klik Akkoord om door te gaan of Niet Akkoord om de installatie af te breken."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Klicken Sie auf ZUSTIMMEN um fortzufahren oder klicken Sie auf ABLEHNEN um die Installation abzubrechen und das Programm zu beenden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cliquer sur J\'accepte pour continuer ou Je refuse pour annuler l\'installation et fermer l\'installeur."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Cliqueu a \xC2\xABD\'acord\xC2\xBB per continuar o a \xC2\xABNo d\'acord\xC2\xBB per cancel\xC2\xB7lar i sortir de l\'instal\xC2\xB7lador."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9C\xD7\x97\xD7\xA5 \xD7\xA2\xD7\x9C \xD7\x9E\xD7\xA1\xD7\x9B\xD7\x99\xD7\x9D \xD7\x91\xD7\x9B\xD7\x93\xD7\x99 \xD7\x9C\xD7\x94\xD7\x9E\xD7\xA9\xD7\x99\xD7\x9A \xD7\x90\xD7\x95 \xD7\xA2\xD7\x9C \xD7\x9C\xD7\x90 \xD7\x9E\xD7\xA1\xD7\x9B\xD7\x99\xD7\x9D \xD7\x91\xD7\x9B\xD7\x93\xD7\x99 \xD7\x9C\xD7\x91\xD7\x98\xD7\x9C \xD7\x90\xD7\xAA \xD7\x94\xD7\x94\xD7\xAA\xD7\xA7\xD7\xA0\xD7\x94 \xD7\x95\xD7\x9C\xD7\xA1\xD7\x92\xD7\x95\xD7\xA8 \xD7\x90\xD7\xAA \xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Kliknij Zgoda aby kontynuowa\xC4\x87 lub Odmawiam aby przerwa\xC4\x87 instalacj\xC4\x99 i zako\xC5\x84czy\xC4\x87 Instalator."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9D\xD0\xB0\xD0\xB6\xD0\xB0\xD1\x82\xD1\x8C \xD0\x9F\xD1\x80\xD0\xB8\xD0\xBD\xD0\xB8\xD0\xBC\xD0\xB0\xD1\x8E \xD0\xB4\xD0\xBB\xD1\x8F \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB4\xD0\xBE\xD0\xBB\xD0\xB6\xD0\xB5\xD0\xBD\xD0\xB8\xD1\x8F \xD0\xB8\xD0\xBB\xD0\xB8 \xD0\x9D\xD0\xB5 \xD0\xBF\xD1\x80\xD0\xB8\xD0\xBD\xD0\xB8\xD0\xBC\xD0\xB0\xD1\x8E \xD0\xB4\xD0\xBB\xD1\x8F \xD0\xBE\xD1\x82\xD0\xBC\xD0\xB5\xD0\xBD\xD1\x8B \xD0\xB8 \xD0\xB2\xD1\x8B\xD1\x85\xD0\xBE\xD0\xB4\xD0\xB0 \xD0\xB8\xD0\xB7 \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD1\x8B \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Pulse \"De Acuerdo\" para continuar o pulse \"En Desacuerdo\" para cancelar la instalaci\xC3\xB3n y salir del instalador."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Premi \xE2\x80\x9CAccetto\xE2\x80\x9D per continuare o premi \xE2\x80\x9CRifiuto\xE2\x80\x9D per cancellare l\xE2\x80\x99installazione e uscire dall\xE2\x80\x99Installatore."
	#tag EndConstant

	#tag Constant, Name = kDisagree, Type = String, Dynamic = True, Default = \"Disagree", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Niet Akkoord"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"ABLEHNEN"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Je refuse"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"En desacord"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9C\xD7\x90 \xD7\x9E\xD7\xA1\xD7\x9B\xD7\x99\xD7\x9D"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Odmawiam"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9D\xD0\xB5 \xD0\xBF\xD1\x80\xD0\xB8\xD0\xBD\xD0\xB8\xD0\xBC\xD0\xB0\xD1\x8E"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"En Desacuerdo"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Rifiuto"
	#tag EndConstant

	#tag Constant, Name = kReadLicense, Type = String, Dynamic = True, Default = \"Read License", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Lees de licentie"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Lizenzbestimmung lesen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Lire la license"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Llegiu la llic\xC3\xA8ncia"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA7\xD7\xA8\xD7\x90 \xD7\xA8\xD7\xA9\xD7\x99\xD7\x95\xD7\x9F"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Przeczytaj Licencj\xC4\x99"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD1\x87\xD0\xB5\xD1\x81\xD1\x82\xD1\x8C \xD0\xBB\xD0\xB8\xD1\x86\xD0\xB5\xD0\xBD\xD0\xB7\xD0\xB8\xD1\x8E"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Lea la Licencia"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Leggi la Licenza"
	#tag EndConstant

	#tag Constant, Name = kWindowTitle, Type = String, Dynamic = True, Default = \"Confirm License", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Lizenzbestimmung akzeptieren"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Confirmer la licence"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bevestig het gebruik onder de licentie voorwaarden"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Confirmeu la llic\xC3\xA8ncia"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x90\xD7\xA9\xD7\xA8 \xD7\xA8\xD7\xA9\xD7\x99\xD7\x95\xD7\x9F"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Zatwierd\xC5\xBA Licencj\xC4\x99"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD0\xBE\xD0\xB4\xD1\x82\xD0\xB2\xD0\xB5\xD1\x80\xD0\xB4\xD0\xB8\xD1\x82\xD1\x8C \xD0\x9B\xD0\xB8\xD1\x86\xD0\xB5\xD0\xBD\xD0\xB7\xD0\xB8\xD1\x8E"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Confirme la Licencia"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Conferma la Licenza"
	#tag EndConstant


#tag EndWindowCode

#tag Events btnAgree
	#tag Event
		Sub Action()
		  wndConfirmLicense.close
		  wndMain.licenseConfirmed
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDisagree
	#tag Event
		Sub Action()
		  wndConfirmLicense.close
		  Quit
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnReadLicense
	#tag Event
		Sub Action()
		  wndConfirmLicense.close
		  showURL(App.kURLLicense)
		  
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
#tag EndViewBehavior

#tag WindowBegin Window wndLicense   BackColor       =   16777215   Backdrop        =   ""   CloseButton     =   True   Composite       =   True   Frame           =   0   FullScreen      =   False   HasBackColor    =   False   Height          =   652   ImplicitInstance=   True   LiveResize      =   True   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   False   MaxWidth        =   32000   MenuBar         =   ""   MenuBarVisible  =   True   MinHeight       =   64   MinimizeButton  =   True   MinWidth        =   64   Placement       =   0   Resizeable      =   False   Title           =   "#kWindowTitle"   Visible         =   True   Width           =   975   Begin HTMLViewer htmViewer      AutoDeactivate  =   True      Enabled         =   True      Height          =   618      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   20      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   True      LockRight       =   True      LockTop         =   True      Scope           =   0      TabIndex        =   0      TabPanelIndex   =   0      TabStop         =   True      Top             =   14      Visible         =   True      Width           =   935   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Open()		  htmViewer.LoadURL(App.kURLLicense)		End Sub	#tag EndEvent	#tag Constant, Name = kWindowTitle, Type = String, Dynamic = True, Default = \"License", Scope = Public		#Tag Instance, Platform = Any, Language = de, Definition  = \"Lizenzbestimmung"		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Licence"		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Licentie"		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Llic\xC3\xA8ncia"		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA8\xD7\xA9\xD7\x99\xD7\x95\xD7\x9F"	#tag EndConstant#tag EndWindowCode
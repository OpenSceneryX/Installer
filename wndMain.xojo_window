#tag Window
Begin Window wndMain
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   725
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   341440760
   MenuBarVisible  =   True
   MinHeight       =   725
   MinimizeButton  =   True
   MinWidth        =   900
   Placement       =   0
   Resizeable      =   True
   Title           =   "#App.kApplicationName"
   Visible         =   False
   Width           =   900
   Begin Canvas cnvBG
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   551
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   262
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   118
      Transparent     =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   624
      Begin PagePanel ppnlMain
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   537
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cnvBG"
         Left            =   269
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         PanelCount      =   7
         Panels          =   ""
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   125
         Transparent     =   True
         Value           =   3
         Visible         =   True
         Width           =   611
         Begin Label txtWelcome
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   495
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   284
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "#kIntroText"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   139
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   585
         End
         Begin Label txtLicenceIntro
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   92
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   284
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "#kLicenseText1"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   139
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   585
         End
         Begin Label txtInstallerVersionBodyText1
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   40
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   284
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   139
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   544
         End
         Begin Label txtLocalScanBodyText1
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   61
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   284
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   139
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   546
         End
         Begin ProgressWheel prgwLocalScan1
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   16
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Left            =   840
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   137
            Transparent     =   True
            Visible         =   False
            Width           =   16
         End
         Begin Label txtLocalScanBodyText2
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   63
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   284
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   214
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   546
         End
         Begin ProgressWheel prgwLocalScan2
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   16
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Left            =   840
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   214
            Transparent     =   True
            Visible         =   False
            Width           =   16
         End
         Begin Label txtLocalScanBodyText3
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   52
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   284
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   288
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   546
         End
         Begin ProgressWheel prgwLocalScan3
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   16
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Left            =   840
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   5
            TabStop         =   True
            Top             =   289
            Transparent     =   True
            Visible         =   False
            Width           =   16
         End
         Begin Label txtLocalScanBodyText4
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   79
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   284
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   6
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   352
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   574
         End
         Begin Label txtLicenseAddress
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   92
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   282
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "#kLicenseText3"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   291
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   585
         End
         Begin ProgressWheel prgwCheckInstaller
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   16
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Left            =   840
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   3
            TabStop         =   True
            Top             =   137
            Transparent     =   True
            Visible         =   False
            Width           =   16
         End
         Begin Label txtInstallerVersionBodyText2
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   205
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   284
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   ""
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   204
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   544
         End
         Begin Canvas cnvComplete
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   False
            Enabled         =   True
            EraseBackground =   False
            Height          =   130
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Left            =   400
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   7
            TabStop         =   True
            Top             =   152
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   348
         End
         Begin Label txtInstallBodyText1
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   40
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   284
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   ""
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   139
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   546
         End
         Begin ProgressWheel prgwInstall1
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   16
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Left            =   840
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   6
            TabStop         =   True
            Top             =   137
            Transparent     =   True
            Visible         =   False
            Width           =   16
         End
         Begin Label txtInstallBodyText2
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   72
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   284
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   ""
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   192
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   546
         End
         Begin GroupBox grpCoreXPlaneIntegration
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "#kCoreIntegration"
            Enabled         =   True
            Height          =   110
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   289
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   529
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   575
            Begin Label lblCoreIntegrationDescription
               AutoDeactivate  =   True
               Bold            =   False
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   33
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpCoreXPlaneIntegration"
               Italic          =   False
               Left            =   309
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               Multiline       =   True
               Scope           =   0
               Selectable      =   False
               TabIndex        =   0
               TabPanelIndex   =   4
               TabStop         =   True
               Text            =   "#kCoreIntegrationDescription"
               TextAlign       =   0
               TextColor       =   &c00000000
               TextFont        =   "System"
               TextSize        =   10.0
               TextUnit        =   0
               Top             =   565
               Transparent     =   False
               Underline       =   False
               Visible         =   True
               Width           =   419
            End
            Begin CheckBox chkStaticAircraft
               AutoDeactivate  =   True
               Bold            =   False
               Caption         =   "#kCoreIntegrationSAEnable"
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   20
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpCoreXPlaneIntegration"
               Italic          =   False
               Left            =   309
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   True
               LockTop         =   True
               Scope           =   0
               State           =   0
               TabIndex        =   1
               TabPanelIndex   =   4
               TabStop         =   True
               TextFont        =   "System"
               TextSize        =   0.0
               TextUnit        =   0
               Top             =   596
               Transparent     =   False
               Underline       =   False
               Value           =   False
               Visible         =   True
               Width           =   257
            End
            Begin CheckBox chkHDForests
               AutoDeactivate  =   True
               Bold            =   False
               Caption         =   "#kCoreIntegrationForestEnable"
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   20
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpCoreXPlaneIntegration"
               Italic          =   False
               Left            =   607
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   True
               LockTop         =   True
               Scope           =   0
               State           =   0
               TabIndex        =   2
               TabPanelIndex   =   4
               TabStop         =   True
               TextFont        =   "System"
               TextSize        =   0.0
               TextUnit        =   0
               Top             =   596
               Transparent     =   False
               Underline       =   False
               Value           =   False
               Visible         =   True
               Width           =   257
            End
         End
         Begin ProgressWheel prgwInstall2
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   16
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Left            =   840
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   6
            TabStop         =   True
            Top             =   192
            Transparent     =   True
            Visible         =   False
            Width           =   16
         End
         Begin Label txtInstallBodyText21
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   70
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   301
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   7
            TabStop         =   True
            Text            =   "#kInstallComplete2"
            TextAlign       =   1
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   350
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   546
         End
         Begin Label txtInstallBodyText211
            AutoDeactivate  =   True
            Bold            =   True
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   30
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   301
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   7
            TabStop         =   True
            Text            =   "#kInstallComplete1"
            TextAlign       =   1
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   16.0
            TextUnit        =   0
            Top             =   300
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   546
         End
         Begin ProgressBar prgBarOverall
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Left            =   387
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Maximum         =   100
            Scope           =   0
            TabIndex        =   20
            TabPanelIndex   =   6
            TabStop         =   True
            Top             =   626
            Transparent     =   True
            Value           =   0
            Visible         =   False
            Width           =   433
         End
         Begin AutoHeightPushButton btnViewLicense
            AutoDeactivate  =   True
            Bold            =   False
            ButtonStyle     =   "0"
            Cancel          =   False
            Caption         =   "#kLicenseText2"
            Default         =   False
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   312
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   237
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   529
         End
         Begin ProgressBar prgBarFile
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Left            =   387
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Maximum         =   100
            Scope           =   0
            TabIndex        =   22
            TabPanelIndex   =   6
            TabStop         =   True
            Top             =   592
            Transparent     =   True
            Value           =   0
            Visible         =   False
            Width           =   433
         End
         Begin Label txtCurrentFileLabel
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   284
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   4
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "#kCurrentFile"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   592
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   91
         End
         Begin Label txtAllFilesLabel
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   284
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   5
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   "#kAllFiles"
            TextAlign       =   2
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   624
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   91
         End
         Begin Label txtFilePercent
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   832
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   6
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   ""
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   592
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   37
         End
         Begin Label txtOverallPercent
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   832
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   7
            TabPanelIndex   =   6
            TabStop         =   True
            Text            =   ""
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   626
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   37
         End
         Begin GroupBox grpXPlaneFolder
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "#kXPlaneFolder"
            Enabled         =   True
            Height          =   114
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   289
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   145
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   575
            Begin Label txtXplaneFolder
               AutoDeactivate  =   True
               Bold            =   False
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   39
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpXPlaneFolder"
               Italic          =   False
               Left            =   305
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   True
               LockTop         =   False
               Multiline       =   True
               Scope           =   0
               Selectable      =   False
               TabIndex        =   0
               TabPanelIndex   =   4
               TabStop         =   True
               Text            =   "Untitled"
               TextAlign       =   0
               TextColor       =   &c00000000
               TextFont        =   "System"
               TextSize        =   0.0
               TextUnit        =   0
               Top             =   175
               Transparent     =   True
               Underline       =   False
               Visible         =   True
               Width           =   539
            End
            Begin AutoHeightPushButton btnSetXPlaneFolder
               AutoDeactivate  =   True
               Bold            =   False
               ButtonStyle     =   "0"
               Cancel          =   False
               Caption         =   "#kChangeXplaneFolder"
               Default         =   False
               Enabled         =   True
               Height          =   20
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpXPlaneFolder"
               Italic          =   False
               Left            =   631
               LockBottom      =   True
               LockedInPosition=   False
               LockLeft        =   False
               LockRight       =   True
               LockTop         =   False
               Scope           =   0
               TabIndex        =   1
               TabPanelIndex   =   4
               TabStop         =   True
               TextFont        =   "System"
               TextSize        =   0.0
               TextUnit        =   0
               Top             =   219
               Transparent     =   True
               Underline       =   False
               Visible         =   True
               Width           =   213
            End
            Begin AutoHeightPushButton btnUseSteam
               AutoDeactivate  =   True
               Bold            =   False
               ButtonStyle     =   "0"
               Cancel          =   False
               Caption         =   "#kUseSteam"
               Default         =   False
               Enabled         =   True
               Height          =   20
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpXPlaneFolder"
               Italic          =   False
               Left            =   451
               LockBottom      =   True
               LockedInPosition=   False
               LockLeft        =   False
               LockRight       =   True
               LockTop         =   False
               Scope           =   0
               TabIndex        =   3
               TabPanelIndex   =   4
               TabStop         =   True
               TextFont        =   "System"
               TextSize        =   0.0
               TextUnit        =   0
               Top             =   219
               Transparent     =   True
               Underline       =   False
               Visible         =   True
               Width           =   168
            End
         End
         Begin GroupBox grpBackupLibrary
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "#kBackupLibrary"
            Enabled         =   True
            Height          =   239
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   289
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   271
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   289
            Begin RadioButton rdoBackupLibraryInvisible
               AutoDeactivate  =   True
               Bold            =   False
               Caption         =   "#kBackupLibraryInvisible"
               Enabled         =   True
               Height          =   20
               HelpTag         =   "#kBackupLibraryInvisibleHelp"
               Index           =   -2147483648
               InitialParent   =   "grpBackupLibrary"
               Italic          =   False
               Left            =   309
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   True
               LockTop         =   True
               Scope           =   0
               TabIndex        =   2
               TabPanelIndex   =   4
               TabStop         =   True
               TextFont        =   "System"
               TextSize        =   0.0
               TextUnit        =   0
               Top             =   438
               Transparent     =   True
               Underline       =   False
               Value           =   False
               Visible         =   True
               Width           =   249
            End
            Begin RadioButton rdoBackupLibraryVisible
               AutoDeactivate  =   True
               Bold            =   False
               Caption         =   "#kBackupLibraryVisible"
               Enabled         =   True
               Height          =   20
               HelpTag         =   "#kBackupLibraryVisibleHelp"
               Index           =   -2147483648
               InitialParent   =   "grpBackupLibrary"
               Italic          =   False
               Left            =   309
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   True
               LockTop         =   True
               Scope           =   0
               TabIndex        =   1
               TabPanelIndex   =   4
               TabStop         =   True
               TextFont        =   "System"
               TextSize        =   0.0
               TextUnit        =   0
               Top             =   406
               Transparent     =   True
               Underline       =   False
               Value           =   True
               Visible         =   True
               Width           =   249
            End
            Begin RadioButton rdoBackupLibraryDisable
               AutoDeactivate  =   True
               Bold            =   False
               Caption         =   "#kBackupLibraryDisable"
               Enabled         =   True
               Height          =   20
               HelpTag         =   "#kBackupLibraryDisableHelp"
               Index           =   -2147483648
               InitialParent   =   "grpBackupLibrary"
               Italic          =   False
               Left            =   309
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   True
               LockTop         =   True
               Scope           =   0
               TabIndex        =   3
               TabPanelIndex   =   4
               TabStop         =   True
               TextFont        =   "System"
               TextSize        =   0.0
               TextUnit        =   0
               Top             =   470
               Transparent     =   True
               Underline       =   False
               Value           =   False
               Visible         =   True
               Width           =   249
            End
            Begin Label lblBackupLibraryDescription
               AutoDeactivate  =   True
               Bold            =   False
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   59
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpBackupLibrary"
               Italic          =   False
               Left            =   309
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   False
               LockTop         =   True
               Multiline       =   True
               Scope           =   0
               Selectable      =   False
               TabIndex        =   0
               TabPanelIndex   =   4
               TabStop         =   True
               Text            =   "#kBackupLibraryDescription"
               TextAlign       =   0
               TextColor       =   &c00000000
               TextFont        =   "System"
               TextSize        =   10.0
               TextUnit        =   0
               Top             =   307
               Transparent     =   False
               Underline       =   False
               Visible         =   True
               Width           =   241
            End
            Begin Label txtBackupLibraryMoreInfoLink
               AutoDeactivate  =   True
               Bold            =   False
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   20
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpBackupLibrary"
               Italic          =   False
               Left            =   309
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   False
               LockRight       =   False
               LockTop         =   False
               Multiline       =   False
               Scope           =   0
               Selectable      =   False
               TabIndex        =   4
               TabPanelIndex   =   4
               TabStop         =   True
               Text            =   "#kBackupLibraryMoreInfoLink"
               TextAlign       =   0
               TextColor       =   &c0000FE00
               TextFont        =   "System"
               TextSize        =   10.0
               TextUnit        =   0
               Top             =   364
               Transparent     =   False
               Underline       =   True
               Visible         =   True
               Width           =   236
            End
         End
         Begin GroupBox grpSeasons
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "#kSeasons"
            Enabled         =   True
            Height          =   239
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ppnlMain"
            Italic          =   False
            Left            =   590
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   271
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   274
            Begin Label lblSeasonsDescription
               AutoDeactivate  =   True
               Bold            =   False
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   59
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpSeasons"
               Italic          =   False
               Left            =   610
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   True
               LockTop         =   True
               Multiline       =   True
               Scope           =   0
               Selectable      =   False
               TabIndex        =   0
               TabPanelIndex   =   4
               TabStop         =   True
               Text            =   "#kSeasonsDescription"
               TextAlign       =   0
               TextColor       =   &c00000000
               TextFont        =   "System"
               TextSize        =   10.0
               TextUnit        =   0
               Top             =   307
               Transparent     =   False
               Underline       =   False
               Visible         =   True
               Width           =   236
            End
            Begin PopupMenu popSeasons
               AutoDeactivate  =   True
               Bold            =   False
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   20
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpSeasons"
               InitialValue    =   "#kSeasonsXPlane\n#kSeasonsFourSeasons\n#kSeasonsTerraMaxx\n#kSeasonsXAmbience\n#kSeasonsDisable"
               Italic          =   False
               Left            =   610
               ListIndex       =   0
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   True
               LockRight       =   True
               LockTop         =   True
               Scope           =   0
               TabIndex        =   6
               TabPanelIndex   =   4
               TabStop         =   True
               TextFont        =   "System"
               TextSize        =   0.0
               TextUnit        =   0
               Top             =   470
               Transparent     =   False
               Underline       =   False
               Visible         =   True
               Width           =   236
            End
            Begin Label txtSeasonsFourSeasonsMoreInfoLink
               AutoDeactivate  =   True
               Bold            =   False
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   20
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpSeasons"
               Italic          =   False
               Left            =   610
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   False
               LockRight       =   False
               LockTop         =   False
               Multiline       =   False
               Scope           =   0
               Selectable      =   False
               TabIndex        =   7
               TabPanelIndex   =   4
               TabStop         =   True
               Text            =   "#kSeasonsFourSeasonsMoreInfoLink"
               TextAlign       =   0
               TextColor       =   &c0000FE00
               TextFont        =   "System"
               TextSize        =   10.0
               TextUnit        =   0
               Top             =   378
               Transparent     =   False
               Underline       =   True
               Visible         =   True
               Width           =   236
            End
            Begin Label txtSeasonsTerraMaxxMoreInfoLink
               AutoDeactivate  =   True
               Bold            =   False
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   20
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpSeasons"
               Italic          =   False
               Left            =   610
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   False
               LockRight       =   False
               LockTop         =   False
               Multiline       =   False
               Scope           =   0
               Selectable      =   False
               TabIndex        =   8
               TabPanelIndex   =   4
               TabStop         =   True
               Text            =   "#kSeasonsTerraMaxxMoreInfoLink"
               TextAlign       =   0
               TextColor       =   &c0000FE00
               TextFont        =   "System"
               TextSize        =   10.0
               TextUnit        =   0
               Top             =   401
               Transparent     =   False
               Underline       =   True
               Visible         =   True
               Width           =   236
            End
            Begin Label txtSeasonsXAmbienceMoreInfoLink
               AutoDeactivate  =   True
               Bold            =   False
               DataField       =   ""
               DataSource      =   ""
               Enabled         =   True
               Height          =   20
               HelpTag         =   ""
               Index           =   -2147483648
               InitialParent   =   "grpSeasons"
               Italic          =   False
               Left            =   610
               LockBottom      =   False
               LockedInPosition=   False
               LockLeft        =   False
               LockRight       =   False
               LockTop         =   False
               Multiline       =   False
               Scope           =   0
               Selectable      =   False
               TabIndex        =   9
               TabPanelIndex   =   4
               TabStop         =   True
               Text            =   "#kSeasonsXAmbienceMoreInfoLink"
               TextAlign       =   0
               TextColor       =   &c0000FE00
               TextFont        =   "System"
               TextSize        =   10.0
               TextUnit        =   0
               Top             =   424
               Transparent     =   False
               Underline       =   True
               Visible         =   True
               Width           =   236
            End
         End
      End
   End
   Begin Canvas cnvHeaderBG
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   900
      Begin Canvas cnvHeaderX
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   74
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cnvHeaderBG"
         Left            =   552
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
      Begin Label lblPreRelease
         AutoDeactivate  =   False
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cnvHeaderBG"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "PRE-RELEASE TEST VERSION, DO NOT RE-DISTRIBUTE!"
         TextAlign       =   1
         TextColor       =   &cFF000000
         TextFont        =   "System"
         TextSize        =   16.0
         TextUnit        =   0
         Top             =   27
         Transparent     =   True
         Underline       =   False
         Visible         =   False
         Width           =   860
      End
   End
   Begin Label txtStage
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   46
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kStageIntroduction"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   118
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
   End
   Begin Label txtStage
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   46
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kStageLicense"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   150
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
   End
   Begin Label txtStage
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   46
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kStageSettings"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   214
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
   End
   Begin Label txtPanelTitle
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   262
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Introduction"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   14.0
      TextUnit        =   0
      Top             =   86
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   359
   End
   Begin AutoHeightPushButton btnContinue
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#kContinue"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   776
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   685
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   110
   End
   Begin AutoHeightPushButton btnBack
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#kGoBack"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   654
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   685
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   110
   End
   Begin Label txtStage
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   6
      InitialParent   =   ""
      Italic          =   False
      Left            =   46
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kStageSummary"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   310
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
   End
   Begin Label txtStage
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   46
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kStageInstallerVersion"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   180
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
   End
   Begin Label txtStage
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   46
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kStageLocalScan"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   246
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
   End
   Begin Label txtStage
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Italic          =   False
      Left            =   46
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   36
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kStageInstall"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   278
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
   End
   Begin GroupBox grpInstallType
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "#kTypeOfInstall"
      Enabled         =   True
      Height          =   149
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   38
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -198
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   575
      Begin RadioButton rdoInstallTypeFull
         AutoDeactivate  =   False
         Bold            =   False
         Caption         =   "#kInstallTypeFull"
         Enabled         =   True
         Height          =   24
         HelpTag         =   "#kInstallTypeFullHelp"
         Index           =   -2147483648
         InitialParent   =   "grpInstallType"
         Italic          =   False
         Left            =   16
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   -164
         Transparent     =   True
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   119
      End
      Begin RadioButton rdoInstallTypeMinimal
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kInstallTypeMinimal"
         Enabled         =   True
         Height          =   24
         HelpTag         =   "#kInstallTypeMinimalHelp"
         Index           =   -2147483648
         InitialParent   =   "grpInstallType"
         Italic          =   False
         Left            =   147
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   -164
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   416
      End
      Begin CheckBox chkDeleteUnused
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kDeleteUnusedFiles"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         Height          =   20
         HelpTag         =   "#kDeleteUnusedFilesHelp"
         Index           =   -2147483648
         InitialParent   =   "grpInstallType"
         Italic          =   False
         Left            =   164
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   -93
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   399
      End
      Begin CheckBox chkScanDisabled
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kScanDisabled"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         Height          =   32
         HelpTag         =   "#kScanDisabledHelp"
         Index           =   -2147483648
         InitialParent   =   "grpInstallType"
         Italic          =   False
         Left            =   164
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   -134
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   399
      End
   End
   Begin Thread thrUpdateFolderStructure
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
   End
   Begin Timer tmrUpdateFolderStructure
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   500
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Oval ovlStage
      AutoDeactivate  =   True
      BorderColor     =   &c00000000
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   10
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Left            =   24
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   39
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   124
      Transparent     =   True
      Visible         =   True
      Width           =   10
   End
   Begin Oval ovlStage
      AutoDeactivate  =   True
      BorderColor     =   &c00000000
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   10
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Left            =   24
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   40
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   156
      Transparent     =   True
      Visible         =   True
      Width           =   10
   End
   Begin Oval ovlStage
      AutoDeactivate  =   True
      BorderColor     =   &c00000000
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   10
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Left            =   24
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   41
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   188
      Transparent     =   True
      Visible         =   True
      Width           =   10
   End
   Begin Oval ovlStage
      AutoDeactivate  =   True
      BorderColor     =   &c00000000
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   10
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Left            =   24
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   42
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   220
      Transparent     =   True
      Visible         =   True
      Width           =   10
   End
   Begin Oval ovlStage
      AutoDeactivate  =   True
      BorderColor     =   &c00000000
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   10
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Left            =   24
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   43
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   252
      Transparent     =   True
      Visible         =   True
      Width           =   10
   End
   Begin Oval ovlStage
      AutoDeactivate  =   True
      BorderColor     =   &c00000000
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   10
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Left            =   24
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   44
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   284
      Transparent     =   True
      Visible         =   True
      Width           =   10
   End
   Begin Oval ovlStage
      AutoDeactivate  =   True
      BorderColor     =   &c00000000
      BorderWidth     =   0
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   10
      HelpTag         =   ""
      Index           =   6
      InitialParent   =   ""
      Left            =   24
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   45
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   316
      Transparent     =   True
      Visible         =   True
      Width           =   10
   End
   Begin Xojo.Net.HTTPSocket sockVersion
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      ValidateCertificates=   False
   End
   Begin Xojo.Net.HTTPSocket sockManifest
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      ValidateCertificates=   False
   End
   Begin Xojo.Net.HTTPSocket sockFile
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      ValidateCertificates=   False
   End
   Begin Thread thrLocalScan
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
   End
   Begin Timer tmrLocalScan
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   500
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin BevelButton btnPaypal
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   70
      HelpTag         =   ""
      Icon            =   949340159
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   46
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   46
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   599
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   197
   End
   Begin Label txtDonatePrompt
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   71
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   46
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   47
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#App.kDonationPrompt"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   524
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   197
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  sockManifest.RequestHeader("User-Agent") = App.stringToText(App.kApplicationNameASCII + " " + App.shortVersion + " " + App.pPlatform)
		  sockFile.RequestHeader("User-Agent") = App.stringToText(App.kApplicationNameASCII + " " + App.shortVersion + " " + App.pPlatform)
		  sockVersion.RequestHeader("User-Agent") = App.stringToText(App.kApplicationNameASCII + " " + App.shortVersion + " " + App.pPlatform)
		  sockManifest.RequestHeader("Authorization") = App.stringToText("Basic " + EncodeBase64(App.kHTTPLogin + ":" + App.kHTTPPassword))
		  sockFile.RequestHeader("Authorization") = App.stringToText("Basic " + EncodeBase64(App.kHTTPLogin + ":" + App.kHTTPPassword))
		  sockVersion.RequestHeader("Authorization") = App.stringToText("Basic " + EncodeBase64(App.kHTTPLogin + ":" + App.kHTTPPassword))
		  
		  If (App.StageCode = 3) Then
		    lblPreRelease.visible = False
		  Else
		    lblPreRelease.visible = True
		  End If
		  
		  // Set up the panel completed booleans
		  Dim i As Integer = 0
		  While ovlStage(i) <> Nil
		    pPanelCompleted.append(False)
		    i = i + 1
		  Wend
		  
		  setPanelCompleted(0)
		  selectPanel(0)
		  
		  // Windows occasionally crashes quietly if this code is in App.Open
		  App.pPreferences = New Dictionary
		  App.loadPreferences
		  
		  Dim xPlanePath As String
		  If (App.pPreferences.hasKey(App.kPreferenceXPlanePath)) Then xPlanePath = App.pPreferences.value(App.kPreferenceXPlanePath)
		  If (xPlanePath <> "") Then App.pXPlaneFolder = GetFolderItem(xPlanePath, FolderItem.PathTypeNative)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub backClicked()
		  selectPanel(ppnlMain.value - 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub backupLibraryChanged()
		  If (rdoBackupLibraryVisible.value = True) Then
		    App.pPreferences.value(App.kPreferenceBackupLibraries) = App.kPreferenceBackupLibrariesVisible
		  Elseif (rdoBackupLibraryInvisible.Value = True) Then
		    App.pPreferences.value(App.kPreferenceBackupLibraries) = App.kPreferenceBackupLibrariesInvisible
		  Else
		    App.pPreferences.value(App.kPreferenceBackupLibraries) = App.kPreferenceBackupLibrariesDisabled
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub buildLibrary()
		  // This function should only ever be called once, right at the end of the install.
		  // It constructs the final library.txt file based on user preferences
		  
		  If pPartialsInstallDone Then Return
		  pPartialsInstallDone = True
		  
		  // Copy in the correct visible / invisible placeholders for the Backup Library
		  copyPlaceholders
		  
		  Dim libraryContents As String
		  
		  // Start with the header partial
		  libraryContents = libraryContents + getPartial("header.txt")
		  
		  // Append the appropriate seasons if user requests it
		  If App.pPreferences.hasKey(App.kPreferenceSeasons) Then
		    If (App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsXPlane) Then
		      libraryContents = libraryContents + getPartial("seasonal_xplane.txt")
		    Elseif (App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsFourSeasons) Then
		      libraryContents = libraryContents + getPartial("seasonal_fourseasons.txt")
		    Elseif (App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsTerraMaxx) Then
		      libraryContents = libraryContents + getPartial("seasonal_terramaxx.txt")
		    Elseif (App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsXAmbience) Then
		      libraryContents = libraryContents + getPartial("seasonal_xambience.txt")
		    End If
		  End If
		  
		  // Append the main library contents
		  libraryContents = libraryContents + getPartial("library.txt")
		  
		  // Append the backup library if user requests it
		  If (App.pPreferences.hasKey(App.kPreferenceBackupLibraries) And App.pPreferences.value(App.kPreferenceBackupLibraries) <> App.kPreferenceBackupLibrariesDisabled) Then
		    libraryContents = libraryContents + getPartial("backup_library.txt")
		  End If
		  
		  // Append the static aircraft exports if user requests it
		  If (App.pPreferences.hasKey(App.kPreferenceStaticAircraft) And App.pPreferences.value(App.kPreferenceStaticAircraft) = True) Then
		    libraryContents = libraryContents + getPartial("extend_static_aircraft.txt")
		  End If
		  
		  // Append the HD forest exports if user requests it
		  If (App.pPreferences.hasKey(App.kPreferenceHDForests) And App.pPreferences.value(App.kPreferenceHDForests) = True) Then
		    libraryContents = libraryContents + getPartial("extend_forests.txt")
		  End If
		  
		  // Write library.txt
		  Dim libraryFolderItem As FolderItem = pOsxFolderItem.Child("library.txt")
		  Dim tos As TextOutputStream = TextOutputStream.Create(libraryFolderItem)
		  tos.Write(libraryContents)
		  tos.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub checkFolderStructure()
		  // Start checking folder structure
		  prgwLocalScan3.visible = true
		  showMessage(txtLocalScanBodyText3, kComparingLocalToRemote)
		  
		  pPendingFiles = new Collection()
		  pDeletedFiles = new Collection()
		  
		  // Reduce the server files to just those in DSFs (if option selected)
		  if (rdoInstallTypeMinimal.value = true) then
		    pServerManifest.intersect(pDSFManifest)
		  end if
		  
		  pLocalManifest.getDifferences(pServerManifest, pPendingFiles, pDeletedFiles)
		  
		  // Finished checking folder structure
		  prgwLocalScan3.visible = false
		  showMessage(txtLocalScanBodyText3, kComparingLocalToRemote + " " + kDone)
		  
		  if (pPendingFiles.count = 0 and pDeletedFiles.count = 0) then
		    // Install is fully up to date, progress straight to summary
		    showMessage(txtLocalScanBodyText4, kInstallUpToDate)
		    selectPanel(6)
		    enableContinue(1)
		    enableBack(0)
		  else
		    showMessage(txtLocalScanBodyText4, kInstallOutOfDate, Array(str(pDeletedFiles.count), str(pPendingFiles.count)))
		    setPanelCompleted(ppnlMain.value)
		    enableContinue()
		    enableBack()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub continueClicked()
		  // Usually just move to next panel.  On license screen, show confirmation
		  if (txtStage(ppnlMain.value).text = kStageLicense and not pPanelCompleted(ppnlMain.value)) then
		    wndConfirmLicense.show()
		  elseif (txtStage(ppnlMain.value).text = kStageSummary) then
		    quit
		  else
		    selectPanel(ppnlMain.value + 1)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub copyPlaceholders()
		  // Placeholder objects are stored in a subfolder called 'opensceneryx'.  Makes it easier to drop in the backup library as thats what it uses
		  if (not pOsxFolderItem.Child("opensceneryx").exists()) then
		    pOsxFolderItem.Child("opensceneryx").createAsFolder()
		  end if
		  
		  pOsxFolderItem.Child("opensceneryx").Child("placeholder_decal.png").delete
		  pOsxFolderItem.Child("opensceneryx").Child("placeholder.agp").delete
		  pOsxFolderItem.Child("opensceneryx").Child("placeholder.dcl").delete
		  pOsxFolderItem.Child("opensceneryx").Child("placeholder.fac").delete
		  pOsxFolderItem.Child("opensceneryx").Child("placeholder.for").delete
		  pOsxFolderItem.Child("opensceneryx").Child("placeholder.lin").delete
		  pOsxFolderItem.Child("opensceneryx").Child("placeholder.obj").delete
		  pOsxFolderItem.Child("opensceneryx").Child("placeholder.png").delete
		  pOsxFolderItem.Child("opensceneryx").Child("placeholder.pol").delete
		  pOsxFolderItem.Child("opensceneryx").Child("placeholder.net").delete
		  pOsxFolderItem.Child("opensceneryx").Child("placeholder.str").delete
		  
		  If (Not App.pPreferences.hasKey(App.kPreferenceBackupLibraries) Or App.pPreferences.value(App.kPreferenceBackupLibraries) = App.kPreferenceBackupLibrariesVisible) Then
		    pOsxFolderItem.Child("placeholders").Child("visible").Child("placeholder_decal.png").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("visible").Child("placeholder.agp").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("visible").Child("placeholder.dcl").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("visible").Child("placeholder.fac").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("visible").Child("placeholder.for").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("visible").Child("placeholder.lin").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("visible").Child("placeholder.obj").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("visible").Child("placeholder.png").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("visible").Child("placeholder.pol").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("visible").Child("placeholder.net").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("visible").Child("placeholder.str").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		  Else
		    // Invisible placeholders If the user has chosen invisible Of If the backup library Is disabled completely
		    pOsxFolderItem.Child("placeholders").Child("invisible").Child("placeholder.agp").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("invisible").Child("placeholder.dcl").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("invisible").Child("placeholder.fac").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("invisible").Child("placeholder.for").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("invisible").Child("placeholder.lin").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("invisible").Child("placeholder.obj").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("invisible").Child("placeholder.png").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("invisible").Child("placeholder.pol").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("invisible").Child("placeholder.net").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		    pOsxFolderItem.Child("placeholders").Child("invisible").Child("placeholder.str").copyFileTo(pOsxFolderItem.Child("opensceneryx"))
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub coreHDForestsChanged()
		  App.pPreferences.value(App.kPreferenceHDForests) = chkHDForests.value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub coreStaticAircraftChanged()
		  App.pPreferences.value(App.kPreferenceStaticAircraft) = chkStaticAircraft.value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteUnusedChanged()
		  App.pPreferences.value(App.kPreferenceDeleteUnused) = chkDeleteUnused.value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub downloadNextFile()
		  dim filePath as String = normaliseFilePath(pPendingFiles.item(1))
		  dim i as Integer
		  dim parts() as String = filePath.split("/")
		  
		  ' Can't use getTemporaryFolderItem here because there's a bug in it where the file handle is left open on Linux.
		  ' So instead we create our own randomly-named file inside the system temporary folder
		  dim r as Random = new Random
		  Dim destinationFolderItem As FolderItem = SpecialFolder.Temporary.child(Str(r.InRange(10000000, 99999999)))
		  Dim destinationFile As New Xojo.IO.FolderItem(destinationFolderItem.NativePath.ToText)
		  
		  Dim url As Text
		  
		  if (App.StageCode = 3) then
		    url = App.kURLRepository
		  else
		    url = App.kURLDevRepository
		  end if
		  
		  for i = 0 to ubound(parts)
		    if (parts(i) <> "") then url = url + "/"
		    url = url + App.StringToText(encodeURLComponent(parts(i)))
		  next
		  
		  url = url + ".zip"
		  
		  sockFile.send("GET", url, destinationFile)
		  
		  pSockFileWorking = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enableBack(override as Integer = - 1)
		  // Back button is enabled after the first panel
		  if (override > -1) then
		    btnBack.enabled = (override = 1)
		  else
		    btnBack.enabled = (ppnlMain.value > 0)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enableContinue(override as Integer = - 1)
		  // Continue button is enabled if we're not on the last panel and if the current panel has been completed, unless we're on the licence panel
		  // when it is enabled (but shows a popup when clicked)
		  if (txtPanelTitle.text = kStageLocalScan) then
		    btnContinue.caption = kInstall
		  elseif (txtPanelTitle.text = kStageSummary) then
		    btnContinue.caption = kClose
		  else
		    btnContinue.caption = kContinue
		  end if
		  
		  if (override > -1) then
		    btnContinue.enabled = (override = 1)
		  else
		    btnContinue.enabled = (ppnlMain.value < ubound(pPanelCompleted)) and (pPanelCompleted(ppnlMain.value) = true or txtStage(ppnlMain.value).text = kStageLicense)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPartial(partialFileName as String) As String
		  Dim partialFolderItem As FolderItem = pOsxFolderItem.Child("partials").Child(partialFileName)
		  Dim partialContents As String = ""
		  
		  Try
		    If partialFolderItem <> Nil And partialFolderItem.Exists Then
		      Dim tis As TextInputStream = TextInputStream.Open(partialFolderItem)
		      partialContents = tis.ReadAll(Encodings.UTF8)
		      tis.Close
		    End If
		  Catch e As IOException
		    // Something bad happened trying to work with the file
		  End Try
		  
		  Return partialContents
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getResolutionScalingFactor() As Single
		  #If TargetCocoa Then
		    Declare Function BackingScaleFactor Lib "AppKit" Selector "backingScaleFactor" (target As WindowPtr) As Double
		    Return BackingScaleFactor(Self)
		  #Else
		    Return 1
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub installTypeChanged()
		  chkDeleteUnused.enabled = rdoInstallTypeMinimal.value
		  chkScanDisabled.enabled = rdoInstallTypeMinimal.value
		  
		  if (rdoInstallTypeMinimal.value = true) then
		    App.pPreferences.value(App.kPreferenceInstallType) = App.kPreferenceInstallTypeMinimal
		  else
		    App.pPreferences.value(App.kPreferenceInstallType) = App.kPreferenceInstallTypeFull
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub licenseConfirmed()
		  pPanelCompleted(ppnlMain.value) = true
		  selectPanel(ppnlMain.value + 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub preProcessLocalFolderItem(osxFolderItem as FolderItem)
		  // Fix any one-off issues here, usually caused by case changes
		  
		  // Problem with b767-300ER changing to b767-300er
		  dim b767FolderItem as FolderItem = osxFolderItem.child("objects").child("aircraft").child("jets").child("heavy").child("b767-300ER")
		  if (b767FolderItem.exists()) then
		    b767FolderItem.name = "b767-300er"
		  end if
		  
		  dim b747EasyJetFolderItem as FolderItem = osxFolderItem.child("doc").child("B737-800 Easyjet.html")
		  if (b747EasyJetFolderItem.exists()) then
		    b747EasyJetFolderItem.name = "B737-800 easyJet.html"
		  end if
		  
		  dim a320EasyJetFolderItem as FolderItem = osxFolderItem.child("doc").child("A320 Easyjet.html")
		  if (a320EasyJetFolderItem.exists()) then
		    a320EasyJetFolderItem.name = "A320 easyJet.html"
		  end if
		  
		  Exception err as NilObjectException
		    // Catch this in case any folder item doesn't exist (new install)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub scanDisabledChanged()
		  App.pPreferences.value(App.kPreferenceScanDisabled) = chkScanDisabled.value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub seasonsChanged()
		  If (popSeasons.List(popSeasons.ListIndex) = kSeasonsXPlane) Then
		    App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsXPlane
		  Elseif (popSeasons.List(popSeasons.ListIndex) = kSeasonsFourSeasons) Then
		    App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsFourSeasons
		  Elseif (popSeasons.List(popSeasons.ListIndex) = kSeasonsTerraMaxx) Then
		    App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsTerraMaxx
		  Elseif (popSeasons.List(popSeasons.ListIndex) = kSeasonsXAmbience) Then
		    App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsXAmbience
		  Else
		    App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsDisabled
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub selectPanel(panelIndex as integer)
		  Dim i As Integer = 0
		  
		  // Set the page panel index
		  ppnlMain.value = panelIndex
		  
		  // Set the blob colours
		  while ovlStage(i) <> nil
		    if (i = panelIndex) then
		      ovlStage(i).FillColor = App.kColourDarkBlue
		      txtStage(i).enabled = true
		      txtPanelTitle.text = txtStage(i).text
		    else
		      ovlStage(i).FillColor = App.kColourLightBlue
		    end if
		    
		    i = i + 1
		  wend
		  
		  i = i - 1
		  
		  if (not pPanelCompleted(panelIndex)) then
		    // Panel not completed, begin any processing relevant to the panel
		    select case txtStage(ppnlMain.value).text
		      
		    case kStageInstallerVersion
		      enableBack(0)
		      enableContinue(0)
		      prgwCheckInstaller.visible = true
		      showMessage(txtInstallerVersionBodyText1, kCheckingInstallerVersion)
		      showMessage(txtInstallerVersionBodyText2, "")
		      
		      if (App.StageCode = 3) then
		        sockVersion.send("GET", App.kURLVersion)
		      else
		        sockVersion.send("GET", App.kURLDevVersion)
		      End If
		      
		      // Synchronous content checking was here with old Socket.  Now done in Socket methods
		      
		      enableBack
		      
		    Case kStageSettings
		      if (App.pXPlaneFolder = nil or not App.pXPlaneFolder.exists() or not App.pXPlaneFolder.directory or not App.pXPlaneFolder.child("Custom Scenery").exists()) then
		        txtXplaneFolder.text = "[Not Set]"
		        enableContinue(0)
		      else
		        setupOSXFolder()
		        txtXplaneFolder.text = App.pXPlaneFolder.nativePath
		        setPanelCompleted(panelIndex)
		      end if
		      
		      If (App.pPreferences.hasKey(App.kPreferenceInstallType) And App.pPreferences.value(App.kPreferenceInstallType) = App.kPreferenceInstallTypeMinimal) Then rdoInstallTypeMinimal.value = True
		      if (App.pPreferences.hasKey(App.kPreferenceDeleteUnused)) then chkDeleteUnused.value = App.pPreferences.value(App.kPreferenceDeleteUnused)
		      if (App.pPreferences.hasKey(App.kPreferenceScanDisabled)) then chkScanDisabled.value = App.pPreferences.value(App.kPreferenceScanDisabled)
		      
		      If App.pPreferences.hasKey(App.kPreferenceBackupLibraries) Then
		        If App.pPreferences.value(App.kPreferenceBackupLibraries) = App.kPreferenceBackupLibrariesInvisible Then
		          rdoBackupLibraryInvisible.value = True
		        Elseif App.pPreferences.value(App.kPreferenceBackupLibraries) = App.kPreferenceBackupLibrariesVisible Then
		          rdoBackupLibraryVisible.value = True
		        Elseif App.pPreferences.value(App.kPreferenceBackupLibraries) = App.kPreferenceBackupLibrariesDisabled Then
		          rdoBackupLibraryDisable.value = True
		        End If
		      End If
		      
		      If App.pPreferences.hasKey(App.kPreferenceSeasons) Then
		        If App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsXPlane Then
		          popSeasons.SelectByText(kSeasonsXPlane)
		        Elseif App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsFourSeasons Then
		          popSeasons.SelectByText(kSeasonsFourSeasons)
		        Elseif App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsTerraMaxx Then
		          popSeasons.SelectByText(kSeasonsTerraMaxx)
		        Elseif App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsXAmbience Then
		          popSeasons.SelectByText(kSeasonsXAmbience)
		        Elseif App.pPreferences.value(App.kPreferenceSeasons) = App.kPreferenceSeasonsDisabled Then
		          popSeasons.SelectByText(kSeasonsDisable)
		        End If
		      End If
		      
		      If App.pPreferences.HasKey(App.kPreferenceStaticAircraft) Then
		        chkStaticAircraft.value = App.pPreferences.value(App.kPreferenceStaticAircraft)
		      End If
		      
		      If App.pPreferences.HasKey(App.kPreferenceHDForests) Then
		        chkHDForests.value = App.pPreferences.value(App.kPreferenceHDForests)
		      End If
		      
		      enableContinue
		      enableBack()
		      
		    case kStageLocalScan
		      pLocalManifest = new FolderManifest()
		      pDSFManifest = new FolderManifest()
		      
		      // Starting Local Scan
		      enableBack(0)
		      enableContinue(0)
		      prgwLocalScan1.visible = true
		      showMessage(txtLocalScanBodyText1, kCollectingLocalFileInformation)
		      showMessage(txtLocalScanBodyText2, "")
		      showMessage(txtLocalScanBodyText3, "")
		      showMessage(txtLocalScanBodyText4, "")
		      
		      thrLocalScan.run
		      
		    case kStageInstall
		      dim j as Integer
		      
		      // Starting Install
		      enableBack(0)
		      enableContinue(0)
		      showMessage(txtInstallBodyText2, "")
		      prgBarOverall.maximum = pPendingFiles.count
		      
		      // Possibly wrap this in a thread…
		      if (pDeletedFiles.count > 0) then
		        prgwInstall1.visible = true
		        for j = 1 to pDeletedFiles.count
		          showMessage(txtInstallBodyText1, kDeletingFiles, Array(pDeletedFiles.item(j), str(j), str(pDeletedFiles.count)))
		          pLocalManifest.getLocalFolderItem(pDeletedFiles.item(j)).delete
		        next
		        
		        showMessage(txtInstallBodyText1, kDeletedFiles + " " + kDone, Array(str(pDeletedFiles.count)))
		      else
		        showMessage(txtInstallBodyText1, kNoFilesToDelete)
		      end if
		      
		      thrUpdateFolderStructure.run()
		      
		    case kStageSummary
		      buildLibrary
		      
		    else
		      enableBack()
		      enableContinue()
		    end select
		  else
		    // Panel already completed, just enable back and forward buttons
		    enableBack()
		    enableContinue()
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setPanelCompleted(panelIndex as integer, completed as Boolean = true)
		  // Set this panel as being completed
		  pPanelCompleted(panelIndex) = completed
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setupOSXFolder()
		  dim foundPrevious as boolean = false
		  dim tempFolderItem as FolderItem
		  // Newest name takes top priority, followed by older releases
		  pOsxFolderItem = App.pXPlaneFolder.child("Custom Scenery").child("OpenSceneryX")
		  if (pOsxFolderItem.exists()) then
		    foundPrevious = true
		  end if
		  
		  tempFolderItem = App.pXPlaneFolder.child("Custom Scenery").child("OpenSceneryX-1.1.0")
		  if (tempFolderItem.exists) then
		    if (foundPrevious) then
		      Utilities.deleteContentsOfFolder(tempFolderItem)
		      tempFolderItem.delete()
		    else
		      tempFolderItem.moveFileTo(pOsxFolderItem)
		      foundPrevious = true
		    end if
		  end if
		  
		  tempFolderItem = App.pXPlaneFolder.child("Custom Scenery").child("OpenSceneryX-1.0.0")
		  if (tempFolderItem.exists) then
		    if (foundPrevious) then
		      Utilities.deleteContentsOfFolder(tempFolderItem)
		      tempFolderItem.delete()
		    else
		      tempFolderItem.moveFileTo(pOsxFolderItem)
		      foundPrevious = true
		    end if
		  end if
		  
		  if (not foundPrevious) then
		    pOsxFolderItem.createAsFolder()
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showMessage(textField as Label, message as String, optional parameters() as String)
		  message = App.processParameterizedString(message, parameters)
		  textField.text = message
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pDeletedFiles As Collection
	#tag EndProperty

	#tag Property, Flags = &h0
		pDSFManifest As FolderManifest
	#tag EndProperty

	#tag Property, Flags = &h0
		pLocalManifest As FolderManifest
	#tag EndProperty

	#tag Property, Flags = &h0
		pOsxFolderItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		pPanelCompleted() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pPartialsInstallDone As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		pPendingFiles As Collection
	#tag EndProperty

	#tag Property, Flags = &h0
		pServerManifest As FolderManifest
	#tag EndProperty

	#tag Property, Flags = &h0
		pSockFileWorking As boolean = false
	#tag EndProperty


	#tag Constant, Name = kAllFiles, Type = String, Dynamic = True, Default = \"All Files:", Scope = Private
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Alle bestanden:"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alle Dateien:"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Tous les fichiers:"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Total fitxers:"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9B\xD7\x9C \xD7\x94\xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D:"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Wszystkie pliki:"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x92\xD1\x81\xD0\xB5 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD1\x8B:"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Todos los archivos:"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Tutti i File:"
	#tag EndConstant

	#tag Constant, Name = kBackupLibrary, Type = String, Dynamic = True, Default = \"Backup Library", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Backup Libreria"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA0\xD0\xB5\xD0\xB7\xD0\xB5\xD1\x80\xD0\xB2\xD0\xBD\xD0\xB0\xD1\x8F \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\xD0\xB0"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Backup bestanden"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Sauvegarde Biblioth\xC3\xA8que"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Librer\xC3\xADa de respaldo"
	#tag EndConstant

	#tag Constant, Name = kBackupLibraryDescription, Type = String, Dynamic = True, Default = \"OpenSceneryX includes a backup library for many other popular third party libraries\x2C in case you don\'t have those libraries installed.", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"OpenSceneryX include una libreria di Backup per molte altre popolari librerie di terze parti\x2C in caso tu non abbia queste librerie installate. "
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"OpenSceneryX  \xD0\xB2\xD0\xBA\xD0\xBB\xD1\x8E\xD1\x87\xD0\xB0\xD0\xB5\xD1\x82 \xD0\xB2 \xD1\x81\xD0\xB5\xD0\xB1\xD1\x8F \xD1\x80\xD0\xB5\xD0\xB7\xD0\xB5\xD1\x80\xD0\xB2\xD0\xBD\xD1\x83\xD1\x8E \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\xD1\x83 \xD0\xBC\xD0\xBD\xD0\xBE\xD0\xB3\xD0\xB8\xD1\x85 \xD0\xBF\xD0\xBE\xD0\xBF\xD1\x83\xD0\xBB\xD1\x8F\xD1\x80\xD0\xBD\xD1\x8B\xD1\x85 \xD1\x81\xD1\x82\xD0\xBE\xD1\x80\xD0\xBE\xD0\xBD\xD0\xBD\xD0\xB8\xD1\x85 \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\x2C \xD0\xBD\xD0\xB0 \xD1\x81\xD0\xBB\xD1\x83\xD1\x87\xD0\xB0\xD0\xB9\x2C \xD0\xB5\xD1\x81\xD0\xBB\xD0\xB8 \xD1\x8D\xD1\x82\xD0\xB8 \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\xD0\xB8 \xD1\x83 \xD0\xB2\xD0\xB0\xD1\x81 \xD0\xBD\xD0\xB5 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBB\xD0\xB5\xD0\xBD\xD1\x8B."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"OpenSceneryX bevat een kopie van scenery bestanden voor vele andere populaire scenery bestanden van derden\x2C voor het geval je die niet hebt ge\xC3\xAFnstalleerd staan."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"OpenSceneryX comprend une biblioth\xC3\xA8que de sauvegarde pour beaucoup de biblioth\xC3\xA8ques tierces\x2C au cas o\xC3\xB9 vous n\'auriez pas ces biblioth\xC3\xA8que d\'install\xC3\xA9es."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"OpenSceneryX incluye una Librer\xC3\xADa de Respaldo para otras muchas librer\xC3\xADas provenientes de terceros\x2C en el caso de que no tengas instaladas dichas librer\xC3\xADas."
	#tag EndConstant

	#tag Constant, Name = kBackupLibraryDisable, Type = String, Dynamic = True, Default = \"Disable the Backup Library", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Disabilit\xC3\xA0 il Backup della Libreria"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9E\xD1\x82\xD0\xBA\xD0\xBB\xD1\x8E\xD1\x87\xD0\xB8\xD1\x82\xD1\x8C \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\xD1\x83 \xD1\x80\xD0\xB5\xD0\xB7\xD0\xB5\xD1\x80\xD0\xB2\xD0\xBD\xD0\xBE\xD0\xB3\xD0\xBE \xD0\xBA\xD0\xBE\xD0\xBF\xD0\xB8\xD1\x80\xD0\xBE\xD0\xB2\xD0\xB0\xD0\xBD\xD0\xB8\xD1\x8F"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Schakel de Backup van de scenery bestanden uit"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"D\xC3\xA9sactiver la biblioth\xC3\xA8que de sauvegarde"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Deshabilitar la Librer\xC3\xADa de Respaldo"
	#tag EndConstant

	#tag Constant, Name = kBackupLibraryDisableHelp, Type = String, Dynamic = True, Default = \"OpenSceneryX includes a backup library for many other popular third party libraries\x2C in case you haven\xE2\x80\x99t installed those libraries.  If you want to disable this feature completely\x2C select this option", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"OpenSceneryX include una libreria di Backup per molte altre popolari librerie di terze parti\x2C nel caso tu non le abbia installate. Se vuoi disabilitare questa funzione completamente\x2C seleziona quest\xE2\x80\x99opzione"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"OpenSceneryX  \xD0\xB2\xD0\xBA\xD0\xBB\xD1\x8E\xD1\x87\xD0\xB0\xD0\xB5\xD1\x82 \xD0\xB2 \xD1\x81\xD0\xB5\xD0\xB1\xD1\x8F \xD1\x80\xD0\xB5\xD0\xB7\xD0\xB5\xD1\x80\xD0\xB2\xD0\xBD\xD1\x83\xD1\x8E \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\xD1\x83 \xD0\xBC\xD0\xBD\xD0\xBE\xD0\xB3\xD0\xB8\xD1\x85 \xD0\xBF\xD0\xBE\xD0\xBF\xD1\x83\xD0\xBB\xD1\x8F\xD1\x80\xD0\xBD\xD1\x8B\xD1\x85 \xD1\x81\xD1\x82\xD0\xBE\xD1\x80\xD0\xBE\xD0\xBD\xD0\xBD\xD0\xB8\xD1\x85 \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\x2C \xD0\xBD\xD0\xB0 \xD1\x81\xD0\xBB\xD1\x83\xD1\x87\xD0\xB0\xD0\xB9\x2C \xD0\xB5\xD1\x81\xD0\xBB\xD0\xB8 \xD1\x8D\xD1\x82\xD0\xB8 \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\xD0\xB8 \xD1\x83 \xD0\xB2\xD0\xB0\xD1\x81 \xD0\xBD\xD0\xB5 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBB\xD0\xB5\xD0\xBD\xD1\x8B.  \xD0\x95\xD1\x81\xD0\xBB\xD0\xB8 \xD0\xB2\xD1\x8B \xD1\x85\xD0\xBE\xD1\x82\xD0\xB8\xD1\x82\xD0\xB5 \xD0\xBF\xD0\xBE\xD0\xBB\xD0\xBD\xD0\xBE\xD1\x81\xD1\x82\xD1\x8C\xD1\x8E \xD0\xBE\xD1\x82\xD0\xBA\xD0\xBB\xD1\x8E\xD1\x87\xD0\xB8\xD1\x82\xD1\x8C \xD1\x8D\xD1\x82\xD1\x83 \xD1\x84\xD1\x83\xD0\xBD\xD0\xBA\xD1\x86\xD0\xB8\xD1\x8E\x2C \xD0\xB2\xD1\x8B\xD0\xB1\xD0\xB5\xD1\x80\xD0\xB8\xD1\x82\xD0\xB5 \xD1\x8D\xD1\x82\xD1\x83 \xD0\xBE\xD0\xBF\xD1\x86\xD0\xB8\xD1\x8E."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"OpenSceneryX bevat een kopie van bestanden voor vele andere populaire scenery bestanden van derden\x2C voor het geval je die niet hebt ge\xC3\xAFnstalleerd staan. Als je dit niet wil gebruiken\x2C kies dan deze optie\r"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"OpenSceneryX includes a backup library for many other popular third party libraries\x2C in case you don\'t have those libraries installed. Si vous voulez d\xC3\xA9sactiver cette fonctionnalit\xC3\xA9\x2C s\xC3\xA9lectionnez cette option"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"OpenSceneryX incluye una librer\xC3\xADa de respaldo para otras muchas librer\xC3\xADas provenientes de terceros\x2C en el caso de que no tengas instaladas dichas librer\xC3\xADas. Si quieres deshabilitar esta funcionalidad completamente\x2C selecciona esta opci\xC3\xB3n"
	#tag EndConstant

	#tag Constant, Name = kBackupLibraryInvisible, Type = String, Dynamic = True, Default = \"Show invisible placeholders", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Mostra i segnaposto invisibili"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD0\xBE\xD0\xBA\xD0\xB0\xD0\xB7\xD0\xB0\xD1\x82\xD1\x8C \xD0\xBD\xD0\xB5\xD0\xB2\xD0\xB8\xD0\xB4\xD0\xB8\xD0\xBC\xD1\x8B\xD0\xB5 \xD0\xB7\xD0\xB0\xD0\xBF\xD0\xBE\xD0\xBB\xD0\xBD\xD0\xB8\xD1\x82\xD0\xB5\xD0\xBB\xD0\xB8\r"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Laat plaatsvervangers van niet ge\xC3\xAFnstalleerde items zien "
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Montrer les espaces r\xC3\xA9serv\xC3\xA9s invisibles"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Mostrar Marcadores de Posici\xC3\xB3n invisibles"
	#tag EndConstant

	#tag Constant, Name = kBackupLibraryInvisibleHelp, Type = String, Dynamic = True, Default = \"If you don\'t want to see the Backup Library placeholders\x2C select this option.", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Se non vuoi vedere i luoghi del Backup della Libreria\x2C selezione quest\xE2\x80\x99opzione. "
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x95\xD1\x81\xD0\xBB\xD0\xB8 \xD0\xB2\xD1\x8B \xD0\xBD\xD0\xB5 \xD1\x85\xD0\xBE\xD1\x82\xD0\xB8\xD1\x82\xD0\xB5 \xD0\xB2\xD0\xB8\xD0\xB4\xD0\xB5\xD1\x82\xD1\x8C \xD0\xB7\xD0\xB0\xD0\xBF\xD0\xBE\xD0\xBB\xD0\xBD\xD0\xB8\xD1\x82\xD0\xB5\xD0\xBB\xD0\xB8 \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\xD0\xB8 \xD1\x80\xD0\xB5\xD0\xB7\xD0\xB5\xD1\x80\xD0\xB2\xD0\xBD\xD0\xBE\xD0\xB3\xD0\xBE \xD0\xBA\xD0\xBE\xD0\xBF\xD0\xB8\xD1\x80\xD0\xBE\xD0\xB2\xD0\xB0\xD0\xBD\xD0\xB8\xD1\x8F\x2C \xD0\xB2\xD1\x8B\xD0\xB1\xD0\xB5\xD1\x80\xD0\xB8\xD1\x82\xD0\xB5 \xD1\x8D\xD1\x82\xD0\xBE\xD1\x82 \xD0\xBF\xD0\xB0\xD1\x80\xD0\xB0\xD0\xBC\xD0\xB5\xD1\x82\xD1\x80."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Als je geen Backup van plaatsvervangers wilt zien\x2C kies deze optie."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Si vous ne voulez pas voir les emplacements r\xC3\xA9serv\xC3\xA9s pour la biblioth\xC3\xA8que de sauvegarde\x2C s\xC3\xA9lectionnez cette option."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Si no quieres ver los Marcadores de Posici\xC3\xB3n de la Librer\xC3\xADa de Respaldo\x2C selecciona esta opci\xC3\xB3n."
	#tag EndConstant

	#tag Constant, Name = kBackupLibraryMoreInfoLink, Type = String, Dynamic = True, Default = \"More about the Backup Library", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Di pi\xC3\xB9 sul Backup della Libreria "
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD0\xBE\xD0\xB4\xD1\x80\xD0\xBE\xD0\xB1\xD0\xBB\xD0\xB5\xD0\xB5 \xD0\xBE \xD0\xA0\xD0\xB5\xD0\xB7\xD0\xB5\xD1\x80\xD0\xB2\xD0\xBD\xD0\xBE\xD0\xB9 \xD0\x91\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\xD0\xB5"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Meer over de Backup bestanden"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Plus \xC3\xA0 propos de la bilbioth\xC3\xA8que de sauvegarde"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Conocer m\xC3\xA1s acerca de la Librer\xC3\xADa de Respaldo"
	#tag EndConstant

	#tag Constant, Name = kBackupLibraryVisible, Type = String, Dynamic = True, Default = \"Show bright red placeholders", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Mostra i segnaposto in rosso acceso "
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD0\xBE\xD0\xBA\xD0\xB0\xD0\xB7\xD0\xB0\xD1\x82\xD1\x8C \xD1\x8F\xD1\x80\xD0\xBA\xD0\xBE-\xD0\xBA\xD1\x80\xD0\xB0\xD1\x81\xD0\xBD\xD1\x8B\xD0\xB5 \xD0\xB7\xD0\xB0\xD0\xBF\xD0\xBE\xD0\xBB\xD0\xBD\xD0\xB8\xD1\x82\xD0\xB5\xD0\xBB\xD0\xB8"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Laat fel rode plaatsvervangers zien"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Montrer les emplacements r\xC3\xA9serv\xC3\xA9s en rouge"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Mostrar Marcadores de Posici\xC3\xB3n rojos y brillantes"
	#tag EndConstant

	#tag Constant, Name = kBackupLibraryVisibleHelp, Type = String, Dynamic = True, Default = \"If you do want to see the bright red Backup Library placeholders\x2C select this option.", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Se vuoi vedere i segnaposto del Backup della Libreria in rosso acceso\x2C seleziona quest\xE2\x80\x99opzione. "
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x95\xD1\x81\xD0\xBB\xD0\xB8 \xD0\xB2\xD1\x8B \xD1\x85\xD0\xBE\xD1\x82\xD0\xB8\xD1\x82\xD0\xB5 \xD0\xB2\xD0\xB8\xD0\xB4\xD0\xB5\xD1\x82\xD1\x8C \xD1\x8F\xD1\x80\xD0\xBA\xD0\xBE-\xD0\xBA\xD1\x80\xD0\xB0\xD1\x81\xD0\xBD\xD1\x8B\xD0\xB5 \xD0\xB7\xD0\xB0\xD0\xBF\xD0\xBE\xD0\xBB\xD0\xBD\xD0\xB8\xD1\x82\xD0\xB5\xD0\xBB\xD0\xB8 \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\xD0\xB8 \xD1\x80\xD0\xB5\xD0\xB7\xD0\xB5\xD1\x80\xD0\xB2\xD0\xBD\xD0\xBE\xD0\xB3\xD0\xBE \xD0\xBA\xD0\xBE\xD0\xBF\xD0\xB8\xD1\x80\xD0\xBE\xD0\xB2\xD0\xB0\xD0\xBD\xD0\xB8\xD1\x8F\x2C \xD0\xB2\xD1\x8B\xD0\xB1\xD0\xB5\xD1\x80\xD0\xB8\xD1\x82\xD0\xB5 \xD1\x8D\xD1\x82\xD0\xBE\xD1\x82 \xD0\xBF\xD0\xB0\xD1\x80\xD0\xB0\xD0\xBC\xD0\xB5\xD1\x82\xD1\x80."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Als je wel de fel rode Backup plaatsvervangers wilt zien\x2C kies deze optie"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Si vosu ne voulez pas voir les emplacements r\xC3\xA9serv\xC3\xA9s en rouge\x2C s\xC3\xA9lectionnez cette option."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Si no quieres ver los Marcadores de Posici\xC3\xB3n rojos y brillantes de la Librer\xC3\xADa de Respaldo\x2C selecciona esta opci\xC3\xB3n."
	#tag EndConstant

	#tag Constant, Name = kChangeXplaneFolder, Type = String, Dynamic = True, Default = \"Change X-Plane\xC2\xAE Folder", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"X-Plane Verzeichnis \xC3\xA4ndern"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Changer le dossier d\'X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verander X-Plane\xC2\xAE map"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Tria carpeta de l\'X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA9\xD7\xA0\xD7\x94 \xD7\x90\xD7\xAA \xD7\xAA\xD7\x99\xD7\xA7\xD7\x99\xD7\x99\xD7\xAA \xD7\x94\xD7\x90\xD7\xA7\xD7\xA1-\xD7\xA4\xD7\x9C\xD7\x9F"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Zmie\xC5\x84 katalog X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA1\xD0\xBC\xD0\xB5\xD0\xBD\xD0\xB8\xD1\x82\xD1\x8C \xD0\xBF\xD0\xB0\xD0\xBF\xD0\xBA\xD1\x83 X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Cambie la carpeta X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Cambia Cartella X-Plane\xC2\xAE"
	#tag EndConstant

	#tag Constant, Name = kCheckingInstallerVersion, Type = String, Dynamic = True, Default = \"Checking installer version\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Installer versie controle.."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"\xC3\x9Cberpr\xC3\xBCfe die Version des Installationsprogramms..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"V\xC3\xA9rification de la version de l\'installeur..."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Comprovant la versi\xC3\xB3 de l\'instal\xC2\xB7lador..."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x91\xD7\x95\xD7\x93\xD7\xA7 \xD7\x90\xD7\xAA \xD7\x92\xD7\x99\xD7\xA8\xD7\xA1\xD7\xAA \xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F..."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Sprawdzanie wersji Instalatora..."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB2\xD0\xB5\xD1\x80\xD1\x8F\xD0\xB5\xD1\x82\xD1\x81\xD1\x8F \xD0\xB2\xD0\xB5\xD1\x80\xD1\x81\xD0\xB8\xD1\x8F \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD1\x8B \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8..."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Verificando la versi\xC3\xB3n del instalador..."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Controllando la versione dell\xE2\x80\x99installatore\xE2\x80\xA6"
	#tag EndConstant

	#tag Constant, Name = kClose, Type = String, Dynamic = True, Default = \"Close", Scope = Private
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Sluiten"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Beenden"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Fermer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Tanca"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA1\xD7\x92\xD7\x95\xD7\xA8"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Zamknij"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x97\xD0\xB0\xD0\xBA\xD1\x80\xD1\x8B\xD1\x82\xD1\x8C"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Cerrar"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Chiudi"
	#tag EndConstant

	#tag Constant, Name = kCollectingLocalFileInformation, Type = String, Dynamic = True, Default = \"Collecting local file information\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Recabando informaci\xC3\xB3n de los archivos locales\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Collecte des informations locales\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"S\'est\xC3\xA0 recollint informaci\xC3\xB3 dels fitxers locals\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Sto raccogliendo informazioni sul file\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Untersuchung der lokalen Dateien\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Opzoeken van lokale bestandsinformatie..."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x90\xD7\x95\xD7\xA1\xD7\xA3 \xD7\x9E\xD7\x99\xD7\x93\xD7\xA2 \xD7\x9E\xD7\xA7\xD7\x95\xD7\x9E\xD7\x99 \xD7\xA2\xD7\x9C \xD7\x94\xD7\xA7\xD7\x95\xD7\x91\xD7\xA5..."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Zbieram dane o lokalnych plikach..."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA1\xD0\xB1\xD0\xBE\xD1\x80 \xD0\xB8\xD0\xBD\xD1\x84\xD0\xBE\xD1\x80\xD0\xBC\xD0\xB0\xD1\x86\xD0\xB8\xD0\xB8 \xD0\xBE \xD0\xBB\xD0\xBE\xD0\xBA\xD0\xB0\xD0\xBB\xD1\x8C\xD0\xBD\xD1\x8B\xD1\x85 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xB0\xD1\x85"
	#tag EndConstant

	#tag Constant, Name = kComparingLocalToRemote, Type = String, Dynamic = True, Default = \"Comparing local files to remote\xE2\x80\xA6", Scope = Private
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Ik vergelijk je lokale bestanden met de op te halen bestanden"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Vergleiche die lokalen Dateien..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Comparaisons des fichiers locaux et du serveur"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Comparant els fitxers locals i remots..."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9E\xD7\xA9\xD7\x95\xD7\x95\xD7\x94 \xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D \xD7\x9E\xD7\xA7\xD7\x95\xD7\x9E\xD7\x99\xD7\x99\xD7\x9D \xD7\x91\xD7\x9E\xD7\xA8\xD7\x95\xD7\x97\xD7\xA7\xD7\x99\xD7\x9D..."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Por\xC3\xB3wnuj\xC4\x99 lokalne pliki ze zdalnymi..."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA1\xD1\x80\xD0\xB0\xD0\xB2\xD0\xBD\xD0\xB5\xD0\xBD\xD0\xB8\xD0\xB5 \xD0\xBB\xD0\xBE\xD0\xBA\xD0\xB0\xD0\xBB\xD1\x8C\xD0\xBD\xD1\x8B\xD1\x85 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xBE\xD0\xB2 \xD1\x81 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xB0\xD0\xBC\xD0\xB8 \xD0\xBD\xD0\xB0 \xD1\x81\xD0\xB5\xD1\x80\xD0\xB2\xD0\xB5\xD1\x80\xD0\xB5..."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Comparando los archivos locales con los remotos..."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Comparando i file locali con quelli remoti\xE2\x80\xA6"
	#tag EndConstant

	#tag Constant, Name = kComplete, Type = String, Dynamic = True, Default = \"Complete.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Completado."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Termin\xC3\xA9."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Completat."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Completato."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Abgeschlossen."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Klaar"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x95\xD7\xA9\xD7\x9C\xD7\x9D."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Zako\xC5\x84czone."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x97\xD0\xB0\xD0\xB2\xD0\xB5\xD1\x80\xD1\x88\xD0\xB5\xD0\xBD\xD0\xBE"
	#tag EndConstant

	#tag Constant, Name = kContinue, Type = String, Dynamic = True, Default = \"Continue", Scope = Private
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Doorgaan"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Weiter"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Continuer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Endavant"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x9E\xD7\xA9\xD7\x9A"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Dalej"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB4\xD0\xBE\xD0\xBB\xD0\xB6\xD0\xB8\xD1\x82\xD1\x8C"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Continuar"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Continua"
	#tag EndConstant

	#tag Constant, Name = kCoreIntegration, Type = String, Dynamic = True, Default = \"Core X-Plane\xC2\xAE Integration", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Integrazione del cuore di X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x98\xD0\xBD\xD1\x82\xD0\xB5\xD0\xB3\xD1\x80\xD0\xB0\xD1\x86\xD0\xB8\xD1\x8F \xD1\x81 \xD1\x8F\xD0\xB4\xD1\x80\xD0\xBE\xD0\xBC  X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"OpenSceneryX wordt in X-Plane verwerkt"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Int\xC3\xA9gration au noyau d\'X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Integraci\xC3\xB3n Central de X-Plane\xC2\xAE "
	#tag EndConstant

	#tag Constant, Name = kCoreIntegrationDescription, Type = String, Dynamic = True, Default = \"OpenSceneryX can incorporate elements into the X-Plane\xC2\xAE core autogen systems.", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"OpenSceneryX pu\xC3\xB2 incorporare elementi nel cuore del sistema di autogenerazione di X-Plane\xC2\xAE."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"OpenSceneryX \xD0\xBC\xD0\xBE\xD0\xB6\xD0\xB5\xD1\x82 \xD0\xB2\xD0\xBA\xD0\xBB\xD1\x8E\xD1\x87\xD0\xB0\xD1\x82\xD1\x8C \xD1\x8D\xD0\xBB\xD0\xB5\xD0\xBC\xD0\xB5\xD0\xBD\xD1\x82\xD1\x8B \xD0\xB2 \xD0\xBE\xD1\x81\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBD\xD1\x8B\xD0\xB5 \xD1\x81\xD0\xB8\xD1\x81\xD1\x82\xD0\xB5\xD0\xBC\xD1\x8B \xD0\xB0\xD0\xB2\xD1\x82\xD0\xBE\xD0\xB3\xD0\xB5\xD0\xBD\xD0\xBE\xD0\xB2 X-Plane\xC2\xAE."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"OpenSceneryX kan elementen in de X-Plane\xC2\xAE hoofd programma verwerken."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"OpenSceneryX peut incorporer des \xC3\xA9l\xC3\xA9ments dans l\'autogen d\'X-Plane\xC2\xAE."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"OpenSceneryX puede incorporar elementos en los sistemas centrales de auto generaci\xC3\xB3n de X-Plane\xC2\xAE"
	#tag EndConstant

	#tag Constant, Name = kCoreIntegrationForestEnable, Type = String, Dynamic = True, Default = \"Incorporate HD forests", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Incorpora le foreste HD"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x92\xD0\xBA\xD0\xBB\xD1\x8E\xD1\x87\xD0\xB8\xD1\x82\xD1\x8C HD \xD0\xBB\xD0\xB5\xD1\x81\xD0\xB0"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geeft in HD bossen weer"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Incorporer les f\xC3\xB4rets HD"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Incorporar bosques en HD"
	#tag EndConstant

	#tag Constant, Name = kCoreIntegrationSAEnable, Type = String, Dynamic = True, Default = \"Incorporate static aircraft", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Incorpora aerei statici"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x92\xD0\xBA\xD0\xBB\xD1\x8E\xD1\x87\xD0\xB8\xD1\x82\xD1\x8C \xD1\x81\xD1\x82\xD0\xB0\xD1\x82\xD0\xB8\xD1\x87\xD0\xBD\xD1\x8B\xD0\xB5 \xD1\x81\xD0\xB0\xD0\xBC\xD0\xBE\xD0\xBB\xD1\x91\xD1\x82\xD1\x8B"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geeft een statisch vliegtuig"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Incorporer des appareils statiques"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Incorporar aeronave est\xC3\xA1tica"
	#tag EndConstant

	#tag Constant, Name = kCouldntCheckInstallerVersion, Type = String, Dynamic = True, Default = \"The installer version couldn\'t be checked\x2C continuing anyway\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"De Installer versie kon niet worden gecontroleerd\x2C toch doorgaan..."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Die Version des Installationsprogramms konnte nicht \xC3\xBCberpr\xC3\xBCft werden\x2C trotzdem weiterfahren..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"La version de l\'installeur n\'a pas pu \xC3\xAAtre v\xC3\xA9rifi\xC3\xA9e..."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"La versi\xC3\xB3 de l\'instal lador no es pot comprovar\x2C continuant de tota manera ..."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x92\xD7\x99\xD7\xA8\xD7\xA1\xD7\xAA \xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\x9C\xD7\x90 \xD7\x99\xD7\x9B\xD7\x9C\xD7\x94 \xD7\x9C\xD7\x94\xD7\x99\xD7\x91\xD7\x93\xD7\xA7\x2C \xD7\x9E\xD7\x9E\xD7\xA9\xD7\x99\xD7\x9A \xD7\x91\xD7\x9B\xD7\x9C \xD7\x96\xD7\x90\xD7\xAA..."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Wersja Instalatora nie mog\xC5\x82a zosta\xC4\x87 sprawdzona\x2C kontynuuje mimo tego..."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9D\xD0\xB5 \xD1\x83\xD0\xB4\xD0\xB0\xD0\xB5\xD1\x82\xD1\x81\xD1\x8F \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB2\xD0\xB5\xD1\x80\xD0\xB8\xD1\x82\xD1\x8C \xD0\xB2\xD0\xB5\xD1\x80\xD1\x81\xD0\xB8\xD1\x8E \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD1\x8B \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8\x2C \xD0\xB2\xD1\x81\xD0\xB5 \xD1\x80\xD0\xB0\xD0\xB2\xD0\xBD\xD0\xBE \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB4\xD0\xBE\xD0\xBB\xD0\xB6\xD0\xB8\xD1\x82\xD1\x8C..."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"La versi\xC3\xB3n del instalador no pudo ser verificada\x2C el proceso contin\xC3\xBAa de todas maneras..."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"La versione dell\xE2\x80\x99installatore non pu\xC3\xB2 essere controllata\x2C continuando comunque\xE2\x80\xA6"
	#tag EndConstant

	#tag Constant, Name = kCurrentFile, Type = String, Dynamic = True, Default = \"Current File:", Scope = Private
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Huidig bestand:"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Aktuelle Datei:"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Fichiers actuels:"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Fitxer actual:"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA7\xD7\x95\xD7\x91\xD7\xA5 \xD7\xA0\xD7\x95\xD7\x9B\xD7\x97\xD7\x99:"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Bie\xC5\xBC\xC4\x85cy plik:"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA2\xD0\xB5\xD0\xBA\xD1\x83\xD1\x89\xD0\xB8\xD0\xB9 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB:"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Archivo Actual:"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"File Corrente:"
	#tag EndConstant

	#tag Constant, Name = kDeletedFiles, Type = String, Dynamic = True, Default = \"Deleted ${1} files.", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"${1} Dateien gel\xC3\xB6scht."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"${1} fichiers supprim\xC3\xA9s."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verwijderd ${1} bestanden."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Esborrats ${1} fitxers."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA0\xD7\x9E\xD7\x97\xD7\xA7\xD7\x95 ${1} \xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Skasowano ${1} plik\xC3\xB3w."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD0\xB4\xD0\xB0\xD0\xBB\xD0\xB5\xD0\xBD\xD1\x8B ${1} \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xBE\xD0\xB2"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Borrados ${1} archivos."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Cancellati ${1} file."
	#tag EndConstant

	#tag Constant, Name = kDeleteUnusedFiles, Type = String, Dynamic = True, Default = \"Delete Unused Files", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"L\xC3\xB6sche nicht verwendete Dateien"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Supprimer les fichiers non utilis\xC3\xA9"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verwijderen van ongebruikte bestanden"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Elimina arxius no usats"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9E\xD7\x97\xD7\xA7 \xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D \xD7\xA9\xD7\x90\xD7\x99\xD7\xA0\xD7\x9D \xD7\x91\xD7\xA9\xD7\x99\xD7\x9E\xD7\x95\xD7\xA9."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Skasuj nieu\xC5\xBCywane pliki"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD0\xB4\xD0\xB0\xD0\xBB\xD0\xB8\xD1\x82\xD1\x8C \xD0\xBD\xD0\xB5\xD0\xB8\xD1\x81\xD0\xBF\xD0\xBE\xD0\xBB\xD1\x8C\xD0\xB7\xD1\x83\xD0\xB5\xD0\xBC\xD1\x8B\xD0\xB5 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD1\x8B"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Borrar archivos no usados"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Cancella File non Usati"
	#tag EndConstant

	#tag Constant, Name = kDeleteUnusedFilesHelp, Type = String, Dynamic = True, Default = \"Delete all OpenSceneryX files from your system that are not used in your installed scenery packages.", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"L\xC3\xB6sche alle OpenSceneryX Dateien die von Ihrer Installation nicht verwendet werden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Supprime tous les fichiers OpenScenery qui ne sont pas utilis\xC3\xA9s par les sc\xC3\xA8nes install\xC3\xA9es."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verwijderen van OpenSceneryX bestanden van je systeem die niet in gebruik zijn in geinstalleerde scenery pakketten."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Elimina tots els fitxers de l\'OpenSceneryX del vostre sistema que no s\'utilitzen en els paquets d\'escenari instal\xC2\xB7lats."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9E\xD7\x97\xD7\xA7 \xD7\x90\xD7\xAA \xD7\x9B\xD7\x9C \xD7\xA7\xD7\x91\xD7\xA6\xD7\x99 \xD7\x94\xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1 \xD7\x9E\xD7\x94\xD7\x9E\xD7\xA2\xD7\xA8\xD7\x9B\xD7\xAA \xD7\xA9\xD7\x9C\xD7\x9A \xD7\xA9\xD7\x9C\xD7\x90 \xD7\xA0\xD7\xA2\xD7\xA9\xD7\x94 \xD7\x91\xD7\x94\xD7\x9D \xD7\xA9\xD7\x99\xD7\x9E\xD7\x95\xD7\xA9 \xD7\x91\xD7\x97\xD7\x91\xD7\x99\xD7\x9C\xD7\x95\xD7\xAA \xD7\x94\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99 \xD7\x94\xD7\x9E\xD7\x95\xD7\xAA\xD7\xA7\xD7\xA0\xD7\x95\xD7\xAA \xD7\xA9\xD7\x9C\xD7\x9A."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Skasuj wszystkie pliki OpenSceneryX w swoim systemie\x2C kt\xC3\xB3re nie s\xC4\x85 u\xC5\xBCywane przez zainstalowane pakiety scenerii."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD0\xB4\xD0\xB0\xD0\xBB\xD0\xB8\xD1\x82\xD1\x8C \xD0\xB2\xD1\x81\xD0\xB5 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD1\x8B OpenSceneryX\x2C  \xD0\xBA\xD0\xBE\xD1\x82\xD0\xBE\xD1\x80\xD1\x8B\xD0\xB5 \xD0\xBD\xD0\xB5 \xD0\xB8\xD1\x81\xD0\xBF\xD0\xBE\xD0\xBB\xD1\x8C\xD0\xB7\xD1\x83\xD1\x8E\xD1\x82\xD1\x81\xD1\x8F \xD0\xB2 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBB\xD0\xB5\xD0\xBD\xD0\xBD\xD1\x8B\xD1\x85 \xD0\xBF\xD0\xB0\xD0\xBA\xD0\xB5\xD1\x82\xD0\xB0\xD1\x85 \xD1\x81\xD1\x86\xD0\xB5\xD0\xBD\xD0\xB0\xD1\x80\xD0\xB8\xD0\xB5\xD0\xB2."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Borrar todos los archivos de OpenSceneryX de su sistema que no est\xC3\xA1n siendo usados en sus paquetes de escenarios instalados."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Cancella tutti i file OpenSceneryX dal tuo sistema che non sono usati nei pacchetti dello scenario installato."
	#tag EndConstant

	#tag Constant, Name = kDeletingFiles, Type = String, Dynamic = True, Default = \"Deleting file ${1} (${2} of ${3})\xE2\x80\xA6", Scope = Private
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bestand verwijderen ${1} (${2} of ${3})\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"L\xC3\xB6sche Datei ${1} (${2} von ${3})\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Suppresion du fichier ${1} (${2} of ${3})\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Suprimint els fitxers ${1} (${2} de ${3})\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9E\xD7\x95\xD7\x97\xD7\xA7 \xD7\xA7\xD7\x95\xD7\x91\xD7\xA5 ${1} (${2} of ${3})\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Kasuj\xC4\x99 plik ${1} (${2} z ${3})\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD0\xB4\xD0\xB0\xD0\xBB\xD1\x8F\xD0\xB5\xD1\x82\xD1\x81\xD1\x8F \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB ${1} (${2} \xD0\xB8\xD0\xB7 ${3})\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Borrando archivo  ${1} (${2} de ${3})\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Cancellando file ${1} (${2} of ${3})\xE2\x80\xA6"
	#tag EndConstant

	#tag Constant, Name = kDone, Type = String, Dynamic = True, Default = \"Done", Scope = Private
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Klaar"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Abgeschlossen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Fait"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Fet"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA0\xD7\xA2\xD7\xA9\xD7\x94"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Zrobione"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x93\xD0\xBE\xD1\x82\xD0\xBE\xD0\xB2\xD0\xBE"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Hecho"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Completato"
	#tag EndConstant

	#tag Constant, Name = kDownloadedFiles, Type = String, Dynamic = True, Default = \"Downloaded ${1} files.", Scope = Private
		#Tag Instance, Platform = Any, Language = de, Definition  = \"${1} Dateien runtergeladen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"${1} fichiers t\xC3\xA9l\xC3\xA9charg\xC3\xA9s."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Gedownload ${1} bestanden."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"${1} fitxers descarregats."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x95\xD7\xA8\xD7\x93\xD7\x95 ${1} \xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Pobieram ${1} plik\xC3\xB3w."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x97\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB6\xD0\xB5\xD0\xBD\xD0\xBE ${1} \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xBE\xD0\xB2."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Descargados ${1} archivos."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Scaricati ${1} file."
	#tag EndConstant

	#tag Constant, Name = kDownloadingFiles, Type = String, Dynamic = True, Default = \"Downloading file ${2} of ${3}:\n${1}\xE2\x80\xA6", Scope = Private
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Bestand downloaden ${2} van ${3}:\n${1}\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Datei ${2} von ${3} runterladen:\n${1}\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9chargement du fichier  ${2} of ${3}:\n${1}\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Descarregant el fitxer ${2} de ${3}:\n${1}\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9E\xD7\x95\xD7\xA8\xD7\x99\xD7\x93 \xD7\xA7\xD7\x95\xD7\x91\xD7\xA5 ${1} (${2} of ${3})\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Pobieram plik ${2} z ${3}:\n${1}\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x97\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB6\xD0\xB0\xD0\xB5\xD1\x82\xD1\x81\xD1\x8F \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB ${2} \xD0\xB8\xD0\xB7 ${3}:\n${1}\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Descargando archivo: ${2} de ${3}:\n${1}\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Scaricando file ${2} of ${3}:\n${1}\xE2\x80\xA6"
	#tag EndConstant

	#tag Constant, Name = kDownloadingManifest, Type = String, Dynamic = True, Default = \"Connecting to the server and downloading the list of available files\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Conectando con el servidor y descargando la lista de archivos disponibles\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Connection au serveur et t\xC3\xA9l\xC3\xA9chargement de la liste de fichiers disponible\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"S\'est\xC3\xA0 connectant amb el servidor per descarregar la llista de fitxers disponibles\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Mi sto connettendo al server e sto caricando la lista dei file disponibili\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Die Verbindung zum Server wird aufgenommen und die Liste der verf\xC3\xBCgbaren Dateien wird untersucht\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Verbinding met de server maken en de lijst van beschikbare bestanden ophalen..."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9E\xD7\xAA\xD7\x97\xD7\x91\xD7\xA8 \xD7\x9C\xD7\xA9\xD7\xA8\xD7\xAA \xD7\x95\xD7\x9E\xD7\x95\xD7\xA8\xD7\x99\xD7\x93 \xD7\x90\xD7\xAA \xD7\xA8\xD7\xA9\xD7\x99\xD7\x9E\xD7\xAA \xD7\x94\xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D \xD7\x94\xD7\x96\xD7\x9E\xD7\x99\xD7\xA0\xD7\x99\xD7\x9D..."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"\xC5\x81\xC4\x85cze z serwerem i pobieram list\xC4\x99 dost\xC4\x99pnych plik\xC3\xB3w..."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA1\xD0\xBE\xD0\xB5\xD0\xB4\xD0\xB8\xD0\xBD\xD1\x8F\xD0\xB5\xD1\x82\xD1\x81\xD1\x8F \xD1\x81 \xD1\x81\xD0\xB5\xD1\x80\xD0\xB2\xD0\xB5\xD1\x80\xD0\xBE\xD0\xBC \xD0\xB8 \xD0\xB7\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB6\xD0\xB0\xD0\xB5\xD1\x82\xD1\x81\xD1\x8F \xD1\x81\xD0\xBF\xD0\xB8\xD1\x81\xD0\xBE\xD0\xBA \xD0\xB4\xD0\xBE\xD1\x81\xD1\x82\xD1\x83\xD0\xBF\xD0\xBD\xD1\x8B\xD1\x85 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xBE\xD0\xB2..."
	#tag EndConstant

	#tag Constant, Name = kError, Type = String, Dynamic = True, Default = \"Error: \"${1}\"", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Erreur.\"${1}\""
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Error: \xC2\xAB${1}\xC2\xBB"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Errore: \"${1}\""
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Fehler: \"${1}\""
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Fout: \"${1}\""
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA9\xD7\x92\xD7\x99\xD7\x90\xD7\x94: \"${1}\""
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"B\xC5\x82\xC4\x85d: \"${1}\""
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9E\xD1\x88\xD0\xB8\xD0\xB1\xD0\xBA\xD0\xB0: \"${1}\""
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Error: \"${1}\""
	#tag EndConstant

	#tag Constant, Name = kErrorDownloading, Type = String, Dynamic = True, Default = \"Error downloading (code ${1})\x2C retrying\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Error descargando (code ${1})\x2C reintentando\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Erreur de t\xC3\xA9l\xC3\xA9chargement (code${1})\x2C nouvel essai\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Error en la desc\xC3\xA0rrega (codi ${1})\x2C provant-ho un altre cop\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"\xC3\x88 successo un errore scaricando (code ${1})\x2C sto riprovando\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Download Fehler (code ${1})\x2C erneuter Versuch\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Fout bij het downloaden (code ${1})\x2C opnieuw proberen..."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA9\xD7\x92\xD7\x99\xD7\x90\xD7\x94 \xD7\x91\xD7\x94\xD7\x95\xD7\xA8\xD7\x93\xD7\x94 (code ${1})\x2C \xD7\x9E\xD7\xA0\xD7\xA1\xD7\x94 \xD7\xA9\xD7\xA0\xD7\x99\xD7\xAA\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"B\xC5\x82\xC4\x85d pobierania (kod ${1})\x2C ponawiam..."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9E\xD1\x88\xD0\xB8\xD0\xB1\xD0\xBA\xD0\xB0 \xD0\xB7\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB7\xD0\xBA\xD0\xB8 (code ${1})\x2C \xD0\xBF\xD0\xBE\xD0\xB2\xD1\x82\xD0\xBE\xD1\x80\xD0\xBD\xD0\xB0\xD1\x8F \xD0\xBF\xD0\xBE\xD0\xBF\xD1\x8B\xD1\x82\xD0\xBA\xD0\xB0..."
	#tag EndConstant

	#tag Constant, Name = kErrorDownloadingManifest, Type = String, Dynamic = True, Default = \"There was an error while fetching the list of files - attempt ${1}.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Hubo un error al recuperar la lista de archivos - intento  ${1}."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Erreur lors de la lecture de la liste de fichiers - tentavive ${1}."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"S\'ha podu\xC3\xAFt un error en obtenir la llista de fitxers - intent ${1}."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"C\'\xC3\xA8 stato un errore andando a prendere la lista dei files - tentativo ${1}."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"W\xC3\xA4hrend der Untersuchung der Liste der verf\xC3\xBCgbaren Dateien ist ein Fehler aufgetreten - Versuch ${1}."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Er is een fout opgetreden bij het ophalen van de lijst met bestanden - poging ${1}."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\xAA\xD7\xA8\xD7\x97\xD7\xA9\xD7\x94 \xD7\xA9\xD7\x92\xD7\x99\xD7\x90\xD7\x94 \xD7\x91\xD7\x96\xD7\x9E\xD7\x9F \xD7\x94\xD7\x99\xD7\x99\xD7\x91\xD7\x95\xD7\x90 \xD7\xA9\xD7\x9C \xD7\xA8\xD7\xA9\xD7\x99\xD7\x9E\xD7\xAA \xD7\x94\xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D - \xD7\xA0\xD7\xA1\xD7\x99\xD7\x95\xD7\x9F ${1}."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Wyst\xC4\x85pi\xC5\x82 b\xC5\x82\xC4\x85d podczas przetwarzania listy plik\xC3\xB3w - pr\xC3\xB3ba ${1}."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xB8 \xD0\xBF\xD0\xBE\xD0\xBB\xD1\x83\xD1\x87\xD0\xB5\xD0\xBD\xD0\xB8\xD0\xB8 \xD1\x81\xD0\xBF\xD0\xB8\xD1\x81\xD0\xBA\xD0\xB0 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xBE\xD0\xB2 \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB8\xD0\xB7\xD0\xBE\xD1\x88\xD0\xBB\xD0\xB0 \xD0\xBE\xD1\x88\xD0\xB8\xD0\xB1\xD0\xBA\xD0\xB0 - \xD0\xBF\xD0\xBE\xD0\xBF\xD1\x8B\xD1\x82\xD0\xBA\xD0\xB0 ${1}."
	#tag EndConstant

	#tag Constant, Name = kErrorHTTP, Type = String, Dynamic = True, Default = \"There was an error downloading the file (status ${1})\x2C the download was aborted.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Hubo un error al descargar el archivo (status ${1}). La descarga fue abortada."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Erreur de t\xC3\xA9l\xC3\xA9chargement de fichier (status${1})\x2C le t\xC3\xA9l\xC3\xA9chargement a \xC3\xA9t\xC3\xA9 annul\xC3\xA9."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"S\'ha produ\xC3\xAFt un error en la desc\xC3\xA0rrega el fitxer (estat ${1})\x2C s\'ha cancel\xC2\xB7lat la desc\xC3\xA0rrega."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"\xC3\x88 successo un errore scaricando il file (status ${1})\x2C lo scaricamento \xC3\xA8 stato interrotto."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"W\xC3\xA4hrend des Downloads der Datei (status ${1}) ist ein Fehler aufgetreten\x2C Download wird abgebrochen."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Er is een fout opgetreden bij het downloaden van het bestand (status ${1})\x2C de download is afgebroken."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\xAA\xD7\xA8\xD7\x97\xD7\xA9\xD7\x94 \xD7\xA9\xD7\x92\xD7\x99\xD7\x90\xD7\x94 \xD7\x91\xD7\x94\xD7\x95\xD7\xA8\xD7\x93\xD7\xAA \xD7\x94\xD7\xA7\xD7\x95\xD7\x91\xD7\xA5 (status ${1})\x2C \xD7\x94\xD7\x94\xD7\x95\xD7\xA8\xD7\x93\xD7\x94 \xD7\x91\xD7\x95\xD7\x98\xD7\x9C\xD7\x94."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Wyst\xC4\x85pi\xC5\x82 b\xC5\x82\xC4\x85d podczas pobierania pliku (status ${1})\x2C pobieranie zosta\xC5\x82o przerwane."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB8\xD0\xB7\xD0\xBE\xD1\x88\xD0\xBB\xD0\xB0 \xD0\xBE\xD1\x88\xD0\xB8\xD0\xB1\xD0\xBA\xD0\xB0 \xD0\xBF\xD1\x80\xD0\xB8 \xD0\xB7\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB7\xD0\xBA\xD0\xB8 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xB0 (status ${1})\x2C \xD0\xB7\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB7\xD0\xBA\xD0\xB0 \xD0\xBE\xD1\x82\xD0\xBC\xD0\xB5\xD0\xBD\xD0\xB5\xD0\xBD\xD0\xB0."
	#tag EndConstant

	#tag Constant, Name = kErrorManifest, Type = String, Dynamic = True, Default = \"There was a problem with the list of files downloaded from the server\x2C please try again later.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Hubo un problema con la lista de archivos descargados desde el servidor\x2C por favor intente de nuevo m\xC3\xA1s tarde."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Probl\xC3\xA8me lors du t\xC3\xA9l\xC3\xA9chargement de la liste de fichiers depuis le serveur\x2C re-essayez plus tard."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Hi ha un problema amb la llista de fitxers descarregada del servidor\x2C proveu-ho un altre cop m\xC3\xA9s tard."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"C\'\xC3\xA8 stato un problema con la lista dei files scaricati dal server\x2C per favore prova ancora."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Es ist ein Problem mit der Liste der vom Server heruntergeladenen Dateien aufgetreten\x2C bitte versuchen Sie es sp\xC3\xA4ter noch einmal."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Er is een probleem met de opgehaalde bestandenlijst van de server\x2C probeer het later opnieuw."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\xAA\xD7\xA8\xD7\x97\xD7\xA9\xD7\x94 \xD7\xA9\xD7\x92\xD7\x99\xD7\x90\xD7\x94 \xD7\xA2\xD7\x9D \xD7\xA8\xD7\xA9\xD7\x99\xD7\x9E\xD7\xAA \xD7\x94\xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D \xD7\xA9\xD7\x94\xD7\x95\xD7\xA8\xD7\x93\xD7\x94 \xD7\x9E\xD7\x94\xD7\xA9\xD7\xA8\xD7\xAA\x2C \xD7\x90\xD7\xA0\xD7\x90 \xD7\xA0\xD7\xA1\xD7\x94 \xD7\xA9\xD7\x95\xD7\x91 \xD7\x9E\xD7\x90\xD7\x95\xD7\x97\xD7\xA8 \xD7\x99\xD7\x95\xD7\xAA\xD7\xA8."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Wyst\xC4\x85pi\xC5\x82 problem z list\xC4\x85 plik\xC3\xB3w pobranych z serwera\x2C spr\xC3\xB3buj ponownie p\xC3\xB3\xC5\xBAniej."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x92\xD0\xBE\xD0\xB7\xD0\xBD\xD0\xB8\xD0\xBA\xD0\xBB\xD0\xB0 \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB1\xD0\xBB\xD0\xB5\xD0\xBC\xD0\xB0 \xD1\x81\xD0\xBE \xD1\x81\xD0\xBF\xD0\xB8\xD1\x81\xD0\xBA\xD0\xBE\xD0\xBC \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xBE\xD0\xB2\x2C \xD0\xB7\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB6\xD0\xB5\xD0\xBD\xD0\xBD\xD1\x8B\xD1\x85 \xD1\x81 \xD1\x81\xD0\xB5\xD1\x80\xD0\xB2\xD0\xB5\xD1\x80\xD0\xB0\x2C \xD0\xBF\xD0\xBE\xD0\xB2\xD1\x82\xD0\xBE\xD1\x80\xD0\xB8\xD1\x82\xD1\x8C \xD0\xBF\xD0\xBE\xD0\xBF\xD1\x8B\xD1\x82\xD0\xBA\xD1\x83 \xD0\xBF\xD0\xBE\xD0\xB7\xD0\xB4\xD0\xBD\xD0\xB5\xD0\xB5."
	#tag EndConstant

	#tag Constant, Name = kErrorWritingFile, Type = String, Dynamic = True, Default = \"There was an error creating the local file\x2C do you have permission to write to the X-Plane folder structure\?", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"C\xE2\x80\x99\xC3\xA8 stato un errore creando il file locale\x2C hai il permesso di scrivere la struttura della cartella X-Plane\?"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB8\xD0\xB7\xD0\xBE\xD1\x88\xD0\xBB\xD0\xB0 \xD0\xBE\xD1\x88\xD0\xB8\xD0\xB1\xD0\xBA\xD0\xB0 \xD0\xBF\xD1\x80\xD0\xB8 \xD1\x81\xD0\xBE\xD0\xB7\xD0\xB4\xD0\xB0\xD0\xBD\xD0\xB8\xD0\xB8 \xD0\xBB\xD0\xBE\xD0\xBA\xD0\xB0\xD0\xBB\xD1\x8C\xD0\xBD\xD0\xBE\xD0\xB3\xD0\xBE \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xB0\x2C \xD0\xB8\xD0\xBC\xD0\xB5\xD0\xB5\xD1\x82\xD1\x81\xD1\x8F \xD0\xBB\xD0\xB8 \xD1\x83 \xD0\xB2\xD0\xB0\xD1\x81 \xD1\x80\xD0\xB0\xD0\xB7\xD1\x80\xD0\xB5\xD1\x88\xD0\xB5\xD0\xBD\xD0\xB8\xD0\xB5 \xD0\xBD\xD0\xB0 \xD0\xB7\xD0\xB0\xD0\xBF\xD0\xB8\xD1\x81\xD1\x8C\xD0\xB2 \xD1\x81\xD1\x82\xD1\x80\xD1\x83\xD0\xBA\xD1\x82\xD1\x83\xD1\x80\xD0\xB5 \xD0\xBF\xD0\xB0\xD0\xBF\xD0\xBE\xD0\xBA X-plane\?"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Er was een probleem om een bestand aan te maken op de computer\x2C heb je de rechten om in de X-Plane directory bestanden aan te maken\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Une erreur s\'est produite lors de la cr\xC3\xA9ation du fichier local. Avez-vous les permissions pour \xC3\xA9crire dans le dossier d\'X-Plane \?"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Hubo un error al crear el archivo local. \xC2\xBFTienes permiso para escribir en la estructura de la carpeta de X-Plane\xC2\xAE\?"
	#tag EndConstant

	#tag Constant, Name = kExtractionFailed, Type = String, Dynamic = True, Default = \"Extraction of \"${1}\" failed: \"${2}\"", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Extracci\xC3\xB3n de \"${1}\" fall\xC3\xB3: \"${2}\""
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"L\'extraction de \"{1}\" a \xC3\xA9chou\xC3\xA9e:\"{2}\""
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"L\'extracci\xC3\xB3 de \xC2\xAB${1}\xC2\xBB ha fallat: \xC2\xAB${2}\xC2\xBB"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Estrazione di \"${1}\" non avvenuta: \"${2}\""
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Dekomprimierung von \"${1}\" ist misslungen \"${2}\""
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Uitpakken van \"$ {1}\" is mislukt: \"${2}\""
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x97\xD7\x99\xD7\x9C\xD7\x95\xD7\xA5 \xD7\xA9\xD7\x9C \"${1}\" \xD7\xA0\xD7\x9B\xD7\xA9\xD7\x9C: \"${2}\""
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Rozpakowanie \"${1}\" niepowiod\xC5\x82o si\xC4\x99: \"${2}\""
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9D\xD0\xB5 \xD1\x83\xD0\xB4\xD0\xB0\xD0\xBB\xD0\xBE\xD1\x81\xD1\x8C \xD0\xB2\xD1\x8B\xD0\xB4\xD0\xB5\xD0\xBB\xD0\xB8\xD1\x82\xD1\x8C \"${1}\":  \"${2}\""
	#tag EndConstant

	#tag Constant, Name = kFilesRemain, Type = String, Dynamic = True, Default = \"${1} remain", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"${1} restantes"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"${1} restant"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"en resten ${1}"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"${1} rimanenti"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"${1} verbleiben"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"${1} nog te gaan"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"${1} \xD7\xA0\xD7\x95\xD7\xAA\xD7\xA8\xD7\x95"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"pozosta\xC5\x82o ${1}"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9E\xD1\x81\xD1\x82\xD0\xB0\xD0\xBB\xD0\xBE\xD1\x81\xD1\x8C ${1}"
	#tag EndConstant

	#tag Constant, Name = kGivingUp, Type = String, Dynamic = True, Default = \"Giving up.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Renunciando."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Abandon."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Deixant-ho."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Rinunciando."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Abbruch."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"ik geef het op."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9E\xD7\x95\xD7\x95\xD7\xAA\xD7\xA8."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Poddaje si\xC4\x99."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x91\xD1\x80\xD0\xBE\xD1\x81\xD0\xB8\xD1\x82\xD1\x8C."
	#tag EndConstant

	#tag Constant, Name = kGoBack, Type = String, Dynamic = True, Default = \"Go Back", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Zur\xC3\xBCck"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Retour"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Ga terug"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Enrera"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x97\xD7\x96\xD7\x95\xD7\xA8 \xD7\x97\xD7\x96\xD7\xA8\xD7\x94"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Wr\xC3\xB3\xC4\x87"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x92\xD0\xB5\xD1\x80\xD0\xBD\xD1\x83\xD1\x82\xD1\x8C\xD1\x81\xD1\x8F"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Regresar"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Indietro"
	#tag EndConstant

	#tag Constant, Name = kInstall, Type = String, Dynamic = True, Default = \"Install", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Installeren"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Installieren"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Installer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Instal\xC2\xB7la"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\xAA\xD7\xA7\xD7\x9F"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Instaluj"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xB8\xD1\x82\xD1\x8C"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Instalar"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Installa"
	#tag EndConstant

	#tag Constant, Name = kInstallComplete1, Type = String, Dynamic = True, Default = \"Installation Complete", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Klaar met de installatie"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Installation abgeschlossen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Installation termin\xC3\xA9e"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Instal\xC2\xB7laci\xC3\xB3 acabada"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x94\xD7\xAA\xD7\xA7\xD7\xA0\xD7\x94 \xD7\x94\xD7\x95\xD7\xA9\xD7\x9C\xD7\x9E\xD7\x94"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Instalacja zako\xC5\x84czona"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB0 \xD0\xB7\xD0\xB0\xD0\xB2\xD0\xB5\xD1\x80\xD1\x88\xD0\xB5\xD0\xBD\xD0\xB0"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Instalaci\xC3\xB3n Completada"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Installazione Completata"
	#tag EndConstant

	#tag Constant, Name = kInstallComplete2, Type = String, Dynamic = True, Default = \"Your OpenSceneryX installation is fully up to date and you may now quit this installer.", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"De OpenSceneryX installatie is volledig up to date en de installer kan worden afgesloten."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ihre OpenSceneryX Installation ist vollst\xC3\xA4ndig und Sie k\xC3\xB6nnen nun das Installationsprogramm beenden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Votre isntallation d\'OpenSceneyX est \xC3\xA0 jour. Vous pouvez \xC3\xA0 pr\xC3\xA9sent quitter l\'installeur."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"La vostra intal\xC2\xB7laci\xC3\xB3 de l\'OpenSceneryX est\xC3\xA0 totalment actualitzada i ara podeu sortir d\'aquest instal\xC2\xB7lador."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x94\xD7\xAA\xD7\xA7\xD7\xA0\xD7\x94 \xD7\xA9\xD7\x9C \xD7\x94\xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1 \xD7\xA9\xD7\x9C\xD7\x9A \xD7\x9E\xD7\xA2\xD7\x95\xD7\x93\xD7\x9B\xD7\xA0\xD7\xAA \xD7\x9B\xD7\x91\xD7\xA8 \xD7\x91\xD7\x9E\xD7\x9C\xD7\x95\xD7\x90\xD7\x94 \xD7\x95\xD7\x90\xD7\xAA\xD7\x94 \xD7\x99\xD7\x9B\xD7\x95\xD7\x9C \xD7\x9B\xD7\xA2\xD7\xAA \xD7\x9C\xD7\xA1\xD7\x92\xD7\x95\xD7\xA8 \xD7\x90\xD7\xAA \xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\x94\xD7\x96\xD7\x94."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Twoja instalacja OpenSceneryX jest w pe\xC5\x82ni aktualna\x2C mo\xC5\xBCesz zako\xC5\x84czy\xC4\x87 Instalator."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB0 OpenSceneryX \xD0\xBF\xD0\xBE\xD0\xBB\xD0\xBD\xD0\xBE\xD1\x81\xD1\x82\xD1\x8C\xD1\x8E \xD0\xBE\xD0\xB1\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBB\xD0\xB5\xD0\xBD\xD0\xB0\x2C \xD0\xBC\xD0\xBE\xD0\xB6\xD0\xBD\xD0\xBE \xD0\xB2\xD1\x8B\xD0\xB9\xD1\x82\xD0\xB8 \xD0\xB8\xD0\xB7 \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD1\x8B \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Su instalaci\xC3\xB3n de OpenSceneryX est\xC3\xA1 totalmente actualizada. Ahora puede cerrar el instalador."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"La installazione di OpenSceneryX \xC3\xA8 pienamente aggiornata e adesso puoi uscire dall\xE2\x80\x99installatore. "
	#tag EndConstant

	#tag Constant, Name = kInstallerVersionUpToDate, Type = String, Dynamic = True, Default = \"The installer is the most up to date version\x2C please click Continue to proceed.", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"De installer is de meest recente versie\x2C klik Doorgaan om verder te gaan."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sie haben die neueste Version des Installationsprogramms\x2C bitte klicken Sie auf \"Weiter\" um fortzufahren."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"l\'isntalleur est \xC3\xA0 jour\x2C cliquer sur Continuer pour poursuivre."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Aquesta \xC3\xA9s la versi\xC3\xB3 m\xC3\xA9s recent de l\'instal\xC2\xB7lador\x2C si us plau feu clic a Endavant per procedir."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\xA0\xD7\x9E\xD7\xA6\xD7\x90 \xD7\x91\xD7\x92\xD7\xA8\xD7\xA1\xD7\xAA\xD7\x95 \xD7\x94\xD7\x90\xD7\x97\xD7\xA8\xD7\x95\xD7\xA0\xD7\x94\x2C \xD7\x90\xD7\xA0\xD7\x90 \xD7\x9C\xD7\x97\xD7\xA5 \xD7\xA2\xD7\x9C \xD7\x94\xD7\x9E\xD7\xA9\xD7\x9A \xD7\x91\xD7\x9B\xD7\x93\xD7\x99 \xD7\x9C\xD7\x94\xD7\xAA\xD7\xA7\xD7\x93\xD7\x9D \xD7\x94\xD7\x9C\xD7\x90\xD7\x94."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Instalator jest w najnowszej dost\xC4\x99pnej wersji\x2C naci\xC5\x9Bnij Dalej by kontynuowa\xC4\x87."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x98\xD1\x81\xD0\xBF\xD0\xBE\xD0\xBB\xD1\x8C\xD0\xB7\xD1\x83\xD0\xB5\xD0\xBC\xD0\xB0\xD1\x8F \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD0\xB0 \xD0\xBF\xD0\xBE\xD1\x81\xD0\xBB\xD0\xB5\xD0\xB4\xD0\xBD\xD0\xB5\xD0\xB9 \xD0\xB2\xD0\xB5\xD1\x80\xD1\x81\xD0\xB8\xD0\xB8\x2C \xD0\xBD\xD0\xB0\xD0\xB6\xD0\xBC\xD0\xB8\xD1\x82\xD0\xB5 \xD0\x9F\xD1\x80\xD0\xBE\xD0\xB4\xD0\xBE\xD0\xBB\xD0\xB6\xD0\xB8\xD1\x82\xD1\x8C."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"El instalador es la versi\xC3\xB3n m\xC3\xA1s actualizada\x2C por favor pulse Continuar para proceder."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"L\xE2\x80\x99installatore \xC3\xA8 la versione pi\xC3\xB9 aggiornata\x2C per favore premi \xE2\x80\x9CContinua\xE2\x80\x9D per procedere."
	#tag EndConstant

	#tag Constant, Name = kInstallOutOfDate, Type = String, Dynamic = True, Default = \"Your OpenSceneryX install is out of date\x2C ${1} files need to be deleted and ${2} files need to be downloaded\x2C click Install to begin the process.", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"De OpenSceneryX installatie is verouderd\x2C ${1} bestanden moeten worden verwijderd en ${2} bestanden moeten worden opgehaald\x2C klik Installeren om te beginnen."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ihre OpenSceneryX Installation ist nicht aktuell\x2C ${1} Dateien m\xC3\xBCssen gel\xC3\xB6scht werden und ${2} Dateien m\xC3\xBCssen runtergeladen werden. Klicken Sie \"Installieren\" um den Prozess zu starten."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Votre installation d\'OpenSceneryX n\'est pas \xC3\xA0 jour. ${1} fihciers doivent \xC3\xAAtre supprim\xC3\xA9s et ${2} fichiers doivent \xC3\xAAtre t\xC3\xA9l\xC3\xA9charg\xC3\xA9s. Cliquez sur Installer pour commencer la mise \xC3\xA0 jour."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"La vostra instal\xC2\xB7laci\xC3\xB3 de l\'OpenSceneryX no est\xC3\xA0 actualitzada\x2C ${1} arxius han de ser suprimits i ${2} arxius han de ser descarregats\x2C feu clic a Instal\xC2\xB7la per a comen\xC3\xA7ar el proc\xC3\xA9s."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x94\xD7\xAA\xD7\xA7\xD7\xA0\xD7\x94 \xD7\xA9\xD7\x9C \xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1 \xD7\xA9\xD7\x9C\xD7\x9A \xD7\x90\xD7\x99\xD7\xA0\xD7\x94 \xD7\x9E\xD7\xA2\xD7\x95\xD7\x93\xD7\x9B\xD7\xA0\xD7\xAA\x2C ${1} \xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D \xD7\xA6\xD7\xA8\xD7\x99\xD7\x9B\xD7\x99\xD7\x9D \xD7\x9C\xD7\x94\xD7\x9E\xD7\x97\xD7\xA7 \xD7\x95 ${2} \xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D \xD7\xA6\xD7\xA8\xD7\x99\xD7\x9B\xD7\x99\xD7\x9D \xD7\x9C\xD7\xA8\xD7\x93\xD7\xAA\x2C \xD7\x9C\xD7\x97\xD7\xA5 \xD7\xA2\xD7\x9C \xD7\x94\xD7\xAA\xD7\xA7\xD7\x9F \xD7\x91\xD7\x9B\xD7\x93\xD7\x99 \xD7\x9C\xD7\x94\xD7\x9E\xD7\xA9\xD7\x99\xD7\x9A."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Twoja instalacja OpenSceneryX jest nieaktualna\x2C ${1} plik\xC3\xB3w zostanie skasowanych i ${2} plik\xC3\xB3w zostanie pobranych. Naci\xC5\x9Bnij Instaluj by rozpocz\xC4\x85\xC4\x87 proces."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD0\xB0 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 OpenScenery \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD1\x80\xD0\xB5\xD0\xBB\xD0\xB0\x2C ${1} \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xBE\xD0\xB2 \xD0\xBD\xD0\xB5\xD0\xBE\xD0\xB1\xD1\x85\xD0\xBE\xD0\xB4\xD0\xB8\xD0\xBC\xD0\xBE \xD1\x83\xD0\xB4\xD0\xB0\xD0\xBB\xD0\xB8\xD1\x82\xD1\x8C \xD0\xB8 ${2} \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xBE\xD0\xB2 \xD0\xB7\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB7\xD0\xB8\xD1\x82\xD1\x8C\x2C \xD0\xBD\xD0\xB0\xD0\xB6\xD0\xBC\xD0\xB8\xD1\x82\xD0\xB5 \xD0\xA3\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xB8\xD1\x82\xD1\x8C \xD0\xB4\xD0\xBB\xD1\x8F \xD0\xB7\xD0\xB0\xD0\xBF\xD1\x83\xD1\x81\xD0\xBA\xD0\xB0."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Su instalaci\xC3\xB3n de OpenSceneryX no est\xC3\xA1 actualizada\x2C ${1} archivos necesitan ser borrados y ${2} archivos necesitan ser descargados. Pulse Instalar para iniciar el proceso."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Il tuo OpenSceneryX \xC3\xA8 scaduto\x2C ${1} deve essere cancellato e ${2} deve essere scaricato\x2C premi installa per far iniziare il processo."
	#tag EndConstant

	#tag Constant, Name = kInstallTypeFull, Type = String, Dynamic = True, Default = \"Full", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Vollst\xC3\xA4ndig"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Compl\xC3\xA8te"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Volledig"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Tot"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9E\xD7\x9C\xD7\x90"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Pe\xC5\x82na"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x97\xD0\xB0\xD0\xBF\xD0\xBE\xD0\xBB\xD0\xBD\xD0\xB5\xD0\xBD\xD0\xBE"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Completa"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Pieno"
	#tag EndConstant

	#tag Constant, Name = kInstallTypeFullHelp, Type = String, Dynamic = True, Default = \"Installs the complete OpenSceneryX library\x2C for those who want all files.", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Installiert die komplette OpenSceneryX Bibliothek."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Installe la librairies compl\xC3\xA8te d\'OpenSceneryX\x2C pour obtenir tous les fichiers."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Installeert de complete OpenSceneryX bibliotheek\x2C voor diegenen die alle bestanden wensen."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Instal\xC2\xB7la la col\xC2\xB7leci\xC3\xB3 completa de l\'OpenSceneryX\x2C per als que volen tots els arxius."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\x90\xD7\xAA \xD7\xA1\xD7\xA4\xD7\xA8\xD7\x99\xD7\x99\xD7\xAA \xD7\x94\xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1 \xD7\x91\xD7\x9E\xD7\x9C\xD7\x95\xD7\x90\xD7\x94\x2C \xD7\x9C\xD7\x90\xD7\x9C\xD7\x94 \xD7\x94\xD7\x9E\xD7\xA2\xD7\x95\xD7\xA0\xD7\x99\xD7\x99\xD7\xA0\xD7\x99\xD7\x9D \xD7\x91\xD7\x9B\xD7\x9C \xD7\x94\xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Instaluje kompletn\xC4\x85 bibliotek\xC4\x99 OpenSceneryX\x2C dla tych kt\xC3\xB3rzy potrzebuj\xC4\x85 wszystkich plik\xC3\xB3w."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xB0\xD0\xB2\xD0\xBB\xD0\xB8\xD0\xB2\xD0\xB0\xD0\xB5\xD1\x82 \xD0\xBF\xD0\xBE\xD0\xBB\xD0\xBD\xD1\x83\xD1\x8E \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\xD1\x83 OpenSceneryX\x2C \xD0\xB4\xD0\xBB\xD1\x8F \xD1\x82\xD0\xB5\xD1\x85\x2C \xD0\xBA\xD1\x82\xD0\xBE \xD1\x85\xD0\xBE\xD1\x87\xD0\xB5\xD1\x82 \xD0\xB8\xD0\xBC\xD0\xB5\xD1\x82\xD1\x8C \xD0\xB2\xD1\x81\xD0\xB5 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD1\x8B."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Instala la librer\xC3\xADa completa de OpenSceneryX\x2C para aquellos que desean todos los archivos."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Installa la libreria completa di OpenSceneryX\x2C per quelli che vogliono tutti i file."
	#tag EndConstant

	#tag Constant, Name = kInstallTypeMinimal, Type = String, Dynamic = True, Default = \"Minimal", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Minimal"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Minimale"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Minimaal"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"M\xC3\xADnima"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9E\xD7\x96\xD7\xA2\xD7\xA8\xD7\x99"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Minimalna"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9C\xD0\xB8\xD0\xBD\xD0\xB8\xD0\xBC\xD0\xB0\xD0\xBB\xD1\x8C\xD0\xBD\xD1\x8B\xD0\xB9"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"M\xC3\xADnima"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Minimale"
	#tag EndConstant

	#tag Constant, Name = kInstallTypeMinimalHelp, Type = String, Dynamic = True, Default = \"Scans your installed scenery packages and only installs the necessary files from OpenSceneryX.", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"\xC3\x9Cberpr\xC3\xBCfe Ihre installierten Pakete und installiere nur die notwendigen Dateien von OpenSceneryX."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Scan les sc\xC3\xA8nes install\xC3\xA9es pour ne t\xC3\xA9l\xC3\xA9charger ques les fichiers n\xC3\xA9cessaires d\'OpenSceneryX."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Ik bekijk je geinstalleerde pakketten en installeer alleen diegene die nodig zijn."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Analitza els paquets d\'escenari instal\xC2\xB7lats i nom\xC3\xA9s n\'instal\xC2\xB7la els arxius necessaris de l\'OpenSceneryX."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA1\xD7\x95\xD7\xA8\xD7\xA7 \xD7\x90\xD7\xAA \xD7\x97\xD7\x91\xD7\x99\xD7\x9C\xD7\x95\xD7\xAA \xD7\x94\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99 \xD7\x94\xD7\x9E\xD7\x95\xD7\xAA\xD7\xA7\xD7\xA0\xD7\x95\xD7\xAA \xD7\xA9\xD7\x9C\xD7\x9A \xD7\x95\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\x90\xD7\xAA \xD7\x94\xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D \xD7\x94\xD7\x94\xD7\x9B\xD7\xA8\xD7\x97\xD7\x99\xD7\x99\xD7\x9D \xD7\x91\xD7\x9C\xD7\x91\xD7\x93 \xD7\x9E\xD7\xAA\xD7\x95\xD7\x9A \xD7\x94\xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Skanuje zainstalowane pakiety scenerii i instaluje z OpenSceneryX pliki potrzebne tylko do nich."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB2\xD0\xB5\xD1\x80\xD0\xBA\xD0\xB0 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBB\xD0\xB5\xD0\xBD\xD0\xBD\xD1\x8B\xD1\x85 \xD1\x81\xD1\x86\xD0\xB5\xD0\xBD\xD0\xB0\xD1\x80\xD0\xBD\xD1\x8B\xD1\x85 \xD0\xBF\xD0\xB0\xD0\xBA\xD0\xB5\xD1\x82\xD0\xBE\xD0\xB2 \xD0\xB8 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB0 \xD1\x82\xD0\xBE\xD0\xBB\xD1\x8C\xD0\xBA\xD0\xBE \xD0\xBD\xD0\xB5\xD0\xBE\xD0\xB1\xD1\x85\xD0\xBE\xD0\xB4\xD0\xB8\xD0\xBC\xD1\x8B\xD1\x85 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xBE\xD0\xB2 \xD0\xB8\xD0\xB7 OpenSceneryX."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Analiza sus paquetes de escenario instalados y \xC3\xBAnicamente instala los archivos necesarios de OpenSceneryX."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Scansione i tuoi pacchetti di scenario installati e installa soltanto i file necessari da OpenSceneryX."
	#tag EndConstant

	#tag Constant, Name = kInstallUpToDate, Type = String, Dynamic = True, Default = \"Your OpenSceneryX install is completely up to date\x2C you may now quit this installer.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Su instalaci\xC3\xB3n de OpenSceneryX est\xC3\xA1 completamente actualizada\x2C ahora puede salir del instalador."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Votre installation OpenSceneryX est \xC3\xA0 jour. Vous pouvez maintenant quitter l\'installeur."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"La vostra instal\xC2\xB7laci\xC3\xB3 de l\'OpenSceneryX est\xC3\xA0 totalment actualitzada\x2C ara podeu sortir de l\'instal\xC2\xB7lador."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"La tua cartella di OpenSceneryX \xC3\xA8 aggiornata\x2C ora puoi chiudere questo installatore."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ihre OpenSceneryX Installation ist jetzt auf dem neuesten Stand\x2C Sie k\xC3\xB6nnen das Programm beenden."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"De OpenSceneryX installatie is volledig up to date\x2C de installer kan worden afgesloten."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x94\xD7\xAA\xD7\xA7\xD7\xA0\xD7\x94 \xD7\xA9\xD7\x9C \xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1 \xD7\xA9\xD7\x9C\xD7\x9A \xD7\x9E\xD7\xA2\xD7\x95\xD7\x93\xD7\x9B\xD7\xA0\xD7\xAA \xD7\x91\xD7\x9E\xD7\x9C\xD7\x95\xD7\x90\xD7\x94\x2C \xD7\x90\xD7\xAA\xD7\x94 \xD7\x99\xD7\x9B\xD7\x95\xD7\x9C \xD7\x9B\xD7\xA2\xD7\xAA \xD7\x9C\xD7\xA1\xD7\x92\xD7\x95\xD7\xA8 \xD7\x90\xD7\xAA \xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\x94\xD7\x96\xD7\x94."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Twoja instalacja OpenSceneryX jest w pe\xC5\x82ni aktualna\x2C mo\xC5\xBCesz zako\xC5\x84czy\xC4\x87 Instalator."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB0 OpenSceneryX  \xD0\xBF\xD0\xBE\xD0\xBB\xD0\xBD\xD0\xBE\xD1\x81\xD1\x82\xD1\x8C\xD1\x8E \xD0\xB7\xD0\xB0\xD0\xB2\xD0\xB5\xD1\x80\xD1\x88\xD0\xB5\xD0\xBD\xD0\xB0\x2C \xD0\xBC\xD0\xBE\xD0\xB6\xD0\xB5\xD1\x82\xD0\xB5 \xD0\xB7\xD0\xB0\xD0\xB2\xD0\xB5\xD1\x80\xD1\x88\xD0\xB8\xD1\x82\xD1\x8C \xD1\x80\xD0\xB0\xD0\xB1\xD0\xBE\xD1\x82\xD1\x83 \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD1\x8B \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8."
	#tag EndConstant

	#tag Constant, Name = kIntroText, Type = String, Dynamic = True, Default = \"Welcome to the OpenSceneryX installer.\r\rThis installer will automatically download the latest version of the OpenSceneryX library for X-Plane\xC2\xAE to your hard disk.\r\rThe library is large and depending on your Internet connection may take some time to download. However\x2C if you already have an earlier version of OpenSceneryX installed\x2C the installer will detect this and only download new and changed files.\r", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Welkom bij de OpenScenery installer.\n\nDeze installer zal automatisch de laatste versie van de OpenSceneryX bibliotheek voor X-Plane naar de harde schijf downloaden.\n\nDe bibliotheek is groot en afhankelijk van de snelheid van je internet verbinding zal het enige tijd duren om te downloaden. Als je al een eerdere versie van de OpenSceneryX hebt geinstalleerd\x2C zal de installer dit zien en alleen nieuwe en veranderde bestanden ophalen."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Willkommen zum OpenSceneryX Installationsprogramm\r\rDas Installationsprogramm l\xC3\xA4dt jeweils automatisch die aktuelle Version der OpenSceneryX Objektbibliothek f\xC3\xBCr X-Plane auf ihre Festplatte.\r\rDie Bibliothek ist sehr umfangreich und je nach Geschwindigkeit Ihres Internetanschlusses kann das Runterladen l\xC3\xA4nger dauern. Wenn Sie jedoch schon eine fr\xC3\xBChere Version von OpenSceneryX installiert haben\x2C dann ber\xC3\xBCcksichtigt dies das Installationsprogramm und l\xC3\xA4dt nur die neuen oder ge\xC3\xA4nderten Dateien herunter."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Bienvenu dans l\'installeur d\'OpenSceneryX\r\rL\'installeur va automatiquement t\xC3\xA9l\xC3\xA9charger la dern\xC3\xA8re version de la librairies d\'OpenSceneryX pour X-Plane sur votre disque dur.\r\rLa librairierepr\xC3\xA9sente un gros volume de donn\xC3\xA9es et en fonction de votre connection Internet\x2C le temps de t\xC3\xA9l\xC3\xA9chargement peut-\xC3\xAAtre assez long.\rToutefois\x2C si vous poss\xC3\xA8dez d\xC3\xA9j\xC3\xA0 une version pr\xC3\xA9c\xC3\xA9dente d\'OpenSceneyX\x2C l\'installeur va la d\xC3\xA9tecter et t\xC3\xA9l\xC3\xA9charger uniquement les nouveraux fichiers."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Benvingut a l\'instal\xC2\xB7lador de l\'OpenSceneryX.\r\rAquest instal\xC2\xB7lador descarregar\xC3\xA0 autom\xC3\xA0ticament la darrera versi\xC3\xB3 de la biblioteca OpenSceneryX per a X-Plane \xC2\xAE al vostre disc dur.\r\rLa biblioteca \xC3\xA9s gran i en funci\xC3\xB3 de la vostra connexi\xC3\xB3 a Internet\x2C la desc\xC3\xA0rrega por trigar una estona. Tanmateix\x2C si ja teniu una versi\xC3\xB3 anterior de l\'OpenSceneryX instal\xC2\xB7lada\x2C l\'instal\xC2\xB7lador ho detectar\xC3\xA0 i nom\xC3\xA9s descarregar\xC3\xA0 els arxius nous i modificats."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x91\xD7\xA8\xD7\x95\xD7\x9B\xD7\x99\xD7\x9D \xD7\x94\xD7\x91\xD7\x90\xD7\x99\xD7\x9D \xD7\x9C\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\xA9\xD7\x9C \xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1.\r\r\xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\x94\xD7\x96\xD7\x94 \xD7\x99\xD7\x95\xD7\xA8\xD7\x99\xD7\x93 \xD7\x91\xD7\x90\xD7\x95\xD7\xA4\xD7\x9F \xD7\x90\xD7\x95\xD7\x98\xD7\x95\xD7\x9E\xD7\x98\xD7\x99 \xD7\x90\xD7\xAA \xD7\x94\xD7\x92\xD7\xA8\xD7\xA1\xD7\x94 \xD7\x94\xD7\x90\xD7\x97\xD7\xA8\xD7\x95\xD7\xA0\xD7\x94 \xD7\xA9\xD7\x9C \xD7\xA1\xD7\xA4\xD7\xA8\xD7\x99\xD7\x99\xD7\xAA \xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1 \xD7\xA2\xD7\x91\xD7\x95\xD7\xA8 \xD7\x90\xD7\xA7\xD7\xA1-\xD7\xA4\xD7\x9C\xD7\x9F\xC2\xAE \xD7\x9C\xD7\x93\xD7\x99\xD7\xA1\xD7\xA7 \xD7\x94\xD7\xA7\xD7\xA9\xD7\x99\xD7\x97 \xD7\xA9\xD7\x9C\xD7\x9A.\r\r\xD7\x94\xD7\xA1\xD7\xA4\xD7\xA8\xD7\x99\xD7\x99\xD7\x94 \xD7\x92\xD7\x93\xD7\x95\xD7\x9C\xD7\x94 \xD7\x95\xD7\xAA\xD7\x9C\xD7\x95\xD7\x99 \xD7\x91\xD7\x9E\xD7\x94\xD7\x99\xD7\xA8\xD7\x95\xD7\xAA \xD7\x94\xD7\x97\xD7\x99\xD7\x91\xD7\x95\xD7\xA8 \xD7\xA9\xD7\x9C\xD7\x9A \xD7\x9C\xD7\x90\xD7\x99\xD7\xA0\xD7\x98\xD7\xA8\xD7\xA0\xD7\x98 \xD7\x94\xD7\x94\xD7\x95\xD7\xA8\xD7\x93\xD7\x94 \xD7\xA2\xD7\x9C\xD7\x95\xD7\x9C\xD7\x94 \xD7\x9C\xD7\xA7\xD7\x97\xD7\xAA \xD7\x96\xD7\x9E\xD7\x9F \xD7\x9E\xD7\x94. \xD7\x90\xD7\x95\xD7\x9C\xD7\x9D\x2C \xD7\x90\xD7\x9D \xD7\x9E\xD7\x95\xD7\xAA\xD7\xA7\xD7\xA0\xD7\xAA \xD7\x90\xD7\xA6\xD7\x9C\xD7\x9A \xD7\x92\xD7\xA8\xD7\xA1\xD7\x94 \xD7\xA7\xD7\x95\xD7\x93\xD7\x9E\xD7\xAA \xD7\xA9\xD7\x9C \xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1\x2C \xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F \xD7\x99\xD7\x96\xD7\x94\xD7\x94 \xD7\x96\xD7\x90\xD7\xAA \xD7\x95\xD7\x99\xD7\x95\xD7\xA8\xD7\x99\xD7\x93 \xD7\xA8\xD7\xA7 \xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D \xD7\x97\xD7\x93\xD7\xA9\xD7\x99\xD7\x9D \xD7\x95\xD7\xA9\xD7\x94\xD7\xA9\xD7\xAA\xD7\xA0\xD7\x95."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Witamy w Instalatorze OpenSceneryX.\r\rInstalator automatycznie pobierze najnowsz\xC4\x85 wersj\xC4\x99 biblioteki OpenSceneryX dla X-Plane\xC2\xAE na Tw\xC3\xB3j twardy dysk.\r\rBiblioteka jest bardzo du\xC5\xBCa i zale\xC5\xBCnie od po\xC5\x82\xC4\x85czenia internetowego mo\xC5\xBCe si\xC4\x99 pobiera\xC4\x87 troch\xC4\x99 czasu. Je\xC5\x9Bli posiadasz zainstalowan\xC4\x85 wcze\xC5\x9Bniejsz\xC4\x85 wersj\xC4\x99 OpenSceneryX\x2C Instalator wykryje to i pobierze tylko nowe i uaktualnione pliki."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x94\xD0\xBE\xD0\xB1\xD1\x80\xD0\xBE \xD0\xBF\xD0\xBE\xD0\xB6\xD0\xB0\xD0\xBB\xD0\xBE\xD0\xB2\xD0\xB0\xD1\x82\xD1\x8C \xD0\xB2 \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD1\x83 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 OpenSceneryX.\r\r\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD0\xB0 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 \xD0\xB0\xD0\xB2\xD1\x82\xD0\xBE\xD0\xBC\xD0\xB0\xD1\x82\xD0\xB8\xD1\x87\xD0\xB5\xD1\x81\xD0\xBA\xD0\xB8 \xD0\xB7\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB7\xD0\xB8\xD1\x82 \xD0\xBF\xD0\xBE\xD1\x81\xD0\xBB\xD0\xB5\xD0\xB4\xD0\xBD\xD1\x8E\xD1\x8E \xD0\xB2\xD0\xB5\xD1\x80\xD1\x81\xD0\xB8\xD1\x8E \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA OpenSceneryX \xD0\xB4\xD0\xBB\xD1\x8F X-Plane\xC2\xAE \xD0\xBD\xD0\xB0 \xD0\xB2\xD0\xB0\xD1\x88 \xD0\xB6\xD0\xB5\xD1\x81\xD1\x82\xD0\xBA\xD0\xB8\xD0\xB9 \xD0\xB4\xD0\xB8\xD1\x81\xD0\xBA.\r\r\xD0\xA0\xD0\xB0\xD0\xB7\xD0\xBC\xD0\xB5\xD1\x80 \xD0\xB1\xD0\xB8\xD0\xB1\xD0\xBB\xD0\xB8\xD0\xBE\xD1\x82\xD0\xB5\xD0\xBA\xD0\xB8 \xD0\xB1\xD0\xBE\xD0\xBB\xD1\x8C\xD1\x88\xD0\xBE\xD0\xB9\x2C \xD0\xB8 \xD1\x81\xD0\xBA\xD0\xBE\xD1\x80\xD0\xBE\xD1\x81\xD1\x82\xD1\x8C \xD0\xB7\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB7\xD0\xBA\xD0\xB8 \xD0\xB7\xD0\xB0\xD0\xB2\xD0\xB8\xD1\x81\xD0\xB8\xD1\x82 \xD0\xBE\xD1\x82 \xD0\xB2\xD0\xB0\xD1\x88\xD0\xB5\xD0\xB3\xD0\xBE \xD0\x98\xD0\xBD\xD1\x82\xD0\xB5\xD1\x80\xD0\xBD\xD0\xB5\xD1\x82-\xD1\x81\xD0\xBE\xD0\xB5\xD0\xB4\xD0\xB8\xD0\xBD\xD0\xB5\xD0\xBD\xD0\xB8\xD1\x8F. \xD0\x9D\xD0\xBE \xD0\xB5\xD1\x81\xD0\xBB\xD0\xB8 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBB\xD0\xB5\xD0\xBD\xD0\xB0 \xD0\xB1\xD0\xBE\xD0\xBB\xD0\xB5\xD0\xB5 \xD1\x80\xD0\xB0\xD0\xBD\xD0\xBD\xD1\x8F\xD1\x8F \xD0\xB2\xD0\xB5\xD1\x80\xD1\x81\xD0\xB8\xD1\x8F OpenSceneryX\x2C \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD0\xB0 \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8 \xD0\xBE\xD0\xBF\xD1\x80\xD0\xB5\xD0\xB4\xD0\xB5\xD0\xBB\xD0\xB8\xD1\x82 \xD0\xB8 \xD0\xB7\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB7\xD0\xB8\xD1\x82 \xD1\x82\xD0\xBE\xD0\xBB\xD1\x8C\xD0\xBA\xD0\xBE \xD0\xBD\xD0\xBE\xD0\xB2\xD1\x8B\xD0\xB5 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD1\x8B."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Bienvenido al instalador de OpenSceneryX.\r\rEste instalador descargar\xC3\xA1 autom\xC3\xA1ticamente a su disco duro la versi\xC3\xB3n m\xC3\xA1s reciente de la librer\xC3\xADa de OpenSceneryX para X-Plane\xC2\xAE.\r\rLa librer\xC3\xADa es grande por lo que la descarga puede tomar alg\xC3\xBAn tiempo\x2C el cual depender\xC3\xA1 de la velocidad de su conexi\xC3\xB3n a Internet. Sin embargo\x2C si usted cuenta con una versi\xC3\xB3n anterior de OpenSceneryX ya instalada\x2C el instalador la detectar\xC3\xA1 y \xC3\xBAnicamente descargar\xC3\xA1 los archivos nuevos o aquellos que hayan cambiado.\r"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Benvenuto nell\xE2\x80\x99Installatore di OpenSceneryX.\n\nQuesto installatore scaricher\xC3\xA0 automaticamente la versione pi\xC3\xB9 recente di OpenSceneryX per X-Plane\xC2\xAE nel tuo hard disk.\n\nLa libreria \xC3\xA8 larga e il tempo per scaricare varia in base alla tua connessione Internet. Comunque\x2C se hai gi\xC3\xA0 una versione passata di OpenSceneryX installata\x2C l\xE2\x80\x99installatore la trover\xC3\xA0 e scaricher\xC3\xA0 i file nuovi e quelli che sono cambiati."
	#tag EndConstant

	#tag Constant, Name = kLicenseText1, Type = String, Dynamic = True, Default = \"This work is licensed under the Creative Commons Attribution-Noncommercial-No Derivative Works 2.0 UK: England and Wales License.", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Deze installer is gelicenseerd onder the Creative Commons Attribution-Noncommercial-No Derivative Works 2.0 UK: England and Wales License."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Diese Software ist lizenziert unter dem Abkommen \"Creative Commons Attribution-Noncommercial-No Derivative Works 2.0 UK: England and Wales License\"."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Aquest treball est\xC3\xA0 sota la llic\xC3\xA8ncia Creative Commons Attribution-Noncommercial-No Derivative Works 2.0 UK: Llic\xC3\xA8ncia Anglesa i Gal\xC2\xB7lesa."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA2\xD7\x91\xD7\x95\xD7\x93\xD7\x94 \xD7\x96\xD7\x95 \xD7\x91\xD7\xA8\xD7\xA9\xD7\x99\xD7\x95\xD7\x9F \xD7\xAA\xD7\x97\xD7\xAA \xD7\x94 - Creative Commons Attribution-Noncommercial-No Derivative Works 2.0 UK: England and Wales License."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Praca ta jest licencjonowana za pomoc\xC4\x85 licencji Creative Commons Attribution-Noncommercial-No Derivative Works 2.0 UK: England and Wales."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9B\xD0\xB8\xD1\x86\xD0\xB5\xD0\xBD\xD0\xB7\xD0\xB8\xD1\x80\xD0\xBE\xD0\xB2\xD0\xB0\xD0\xBD\xD0\xB8\xD0\xB5 \xD0\xBD\xD0\xB0 \xD1\x83\xD1\x81\xD0\xBB\xD0\xBE\xD0\xB2\xD0\xB8\xD1\x8F\xD1\x85 Creative Commons Attribution-Noncommercial-No Derivative Works 2.0 UK: England and Wales License."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Este proyecto se encuentra bajo una Licencia CreativeCommons Reconocimiento-NoComercial-SinObraDerivada 2.0\nEn UK: Licencia para Inglaterra y Gales.\n\n"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Questo lavoro \xC3\xA8 licenziato sotto la Creative Commons Attribution-Noncommercial-No Derivative Works 2.0 UK: Licenza Inghilterra e Galles"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Ce travail est plac\xC3\xA9 sous licence Creative Commons Attribution-Noncommercial-No Derivative Works 2.0 UK: England and Wales License."
	#tag EndConstant

	#tag Constant, Name = kLicenseText2, Type = String, Dynamic = True, Default = \"To view a copy of this license\x2C click here", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Hier klicken um die Lizenzbestimmungen zu lesen"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Om de licentie te lezen\x2C klik hier"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Per veure aquesta llic\xC3\xA8ncia feu clic aqu\xC3\xAD"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x91\xD7\x9B\xD7\x93\xD7\x99 \xD7\x9C\xD7\xA6\xD7\xA4\xD7\x95\xD7\xAA \xD7\x91\xD7\x94\xD7\xA2\xD7\xAA\xD7\xA7 \xD7\xA9\xD7\x9C \xD7\xA8\xD7\xA9\xD7\x99\xD7\x95\xD7\x9F \xD7\x96\xD7\x94\x2C \xD7\x9C\xD7\x97\xD7\xA5 \xD7\x9B\xD7\x90\xD7\x9F"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Aby przeczyta\xC4\x87 kopi\xC4\x99 licencji\x2C kliknij tutaj"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x94\xD0\xBB\xD1\x8F \xD0\xBF\xD1\x80\xD0\xBE\xD1\x81\xD0\xBC\xD0\xBE\xD1\x82\xD1\x80\xD0\xB0 \xD0\xBA\xD0\xBE\xD0\xBF\xD0\xB8\xD0\xB8 \xD0\x9B\xD0\xB8\xD1\x86\xD0\xB5\xD0\xBD\xD0\xB7\xD0\xB8\xD0\xB8\x2C \xD0\xBD\xD0\xB0\xD0\xB6\xD0\xBC\xD0\xB8\xD1\x82\xD0\xB5 \xD0\xB7\xD0\xB4\xD0\xB5\xD1\x81\xD1\x8C"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Para ver una copia de esta licencia\x2C pulse aqu\xC3\xAD"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Per vedere una copia della licenza\x2C premi qui"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Pour voir une copie de cette licence\x2C cliquez ici"
	#tag EndConstant

	#tag Constant, Name = kLicenseText3, Type = String, Dynamic = True, Default = \"Alternatively\x2C send a letter to Creative Commons\x2C 171 Second Street\x2C Suite 300\x2C San Francisco\x2C California\x2C 94105\x2C USA.", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"U kunt ook een brief sturen aan: Creative Commons\x2C 171 Second Street\x2C Suite 300\x2C San Francisco\x2C California\x2C 94105\x2C USA.\n"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alternativ schreiben Sie an: Creative Commons\x2C 171 Second Street\x2C Suite 300\x2C San Francisco\x2C California\x2C 94105\x2C USA."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Alternativament\x2C envieu una carta a Creative Commons\x2C 171 Second Street\x2C Suite 300\x2C San Francisco\x2C Calif\xC3\xB2rnia\x2C 94105\x2C EUA."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x9C\xD7\x97\xD7\x9C\xD7\x95\xD7\xA4\xD7\x99\xD7\x9F\x2C \xD7\xA9\xD7\x9C\xD7\x97 \xD7\x9E\xD7\x9B\xD7\xAA\xD7\x91 \xD7\x9C -  Creative Commons\x2C 171 Second Street\x2C Suite 300\x2C San Francisco\x2C California\x2C 94105\x2C USA."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Alternatywnie\x2C wy\xC5\x9Blij list do:\rCreative Commons\x2C 171 Second Street\x2C Suite 300\x2C San Francisco\x2C California\x2C 94105\x2C USA."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x98\xD0\xBB\xD0\xB8 \xD0\xBF\xD0\xB8\xD1\x81\xD1\x8C\xD0\xBC\xD0\xB5\xD0\xBD\xD0\xBD\xD0\xBE \xD0\xBE\xD0\xB1\xD1\x80\xD0\xB0\xD1\x82\xD0\xB8\xD1\x82\xD0\xB5\xD1\x81\xD1\x8C \xD0\xBF\xD0\xBE \xD0\xB0\xD0\xB4\xD1\x80\xD0\xB5\xD1\x81\xD1\x83: Creative Commons\x2C 171 Second Street\x2C Suite 300\x2C San Francisco\x2C California\x2C 94105\x2C USA."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Alternativamente\x2C env\xC3\xADe una carta a Creative Commons\x2C 444 Castro Street\x2C Suite 900\x2C Mountain View California\x2C 94041\x2C USA."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Alternativamente\x2C manda una lettera a \xE2\x80\x9CCreative Commons\x2C 171 Second Street\x2C Suite 300\x2C San Francisco\x2C California\x2C 94105\x2C USA\xE2\x80\x9D."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vous pouvez \xC3\xA9galement envoyer une lettre \xC3\xA0 Creative Commons\x2C 171 Second Street\x2C Suite 300\x2C San Francisco\x2C Californie\x2C 94105\x2C \xC3\x89tats-Unis."
	#tag EndConstant

	#tag Constant, Name = kManifestDownloaded, Type = String, Dynamic = True, Default = \"The download of the list of files is complete.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"La descarga de la lista de archivos fue completada."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"T\xC3\xA9l\xC3\xA9chargement de la liste de fichiers effectu\xC3\xA9"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"S\'ha completat la desc\xC3\xA0rrega de la llista de fitxers."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Lo scaricamento della lista dei files \xC3\xA8 completato."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alle Dateien wurden korrekt heruntergeladen."
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"De lijst van te downloaden bestanden is klaar."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\x94\xD7\x95\xD7\xA8\xD7\x93\xD7\x94 \xD7\xA9\xD7\x9C \xD7\xA8\xD7\xA9\xD7\x99\xD7\x9E\xD7\xAA \xD7\x94\xD7\xA7\xD7\x91\xD7\xA6\xD7\x99\xD7\x9D \xD7\x94\xD7\x95\xD7\xA9\xD7\x9C\xD7\x9E\xD7\x94."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Pobieranie listy plik\xC3\xB3w zosta\xC5\x82o zako\xC5\x84czone."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x97\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB7\xD0\xBA\xD0\xB0 \xD1\x81\xD0\xBF\xD0\xB8\xD1\x81\xD0\xBA\xD0\xB0 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xBE\xD0\xB2 \xD0\xB7\xD0\xB0\xD0\xB2\xD0\xB5\xD1\x80\xD1\x88\xD0\xB5\xD0\xBD\xD0\xB0."
	#tag EndConstant

	#tag Constant, Name = kNewInstallerAvailable, Type = String, Dynamic = True, Default = \"There is a new version of the installer available\x2C please download it from the OpenSceneryX website\xC2\xA0by clicking the logo at the top of this window.", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Er is een nieuwe versie van de installer beschikbaar\x2C download het van de OpenSceneryX website door op het logo bovenaan dit venster te klikken."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Eine neuere Version des Installationsprogrammes ist verf\xC3\xBCgbar. Bitte laden Sie dieses von der OpenSceneryX Internetseite runter indem Sie auf das Logo oben in diesem Fenster klicken."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Une nouvelle version de l\'isntalleur est disponible.\rT\xC3\xA9l\xC3\xA9charger l\xC3\xA0 sur le site d\'OpenSceneryX en cliquant sur le logo situ\xC3\xA9 en haut de cette fen\xC3\xAAtre."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Hi ha una nova versi\xC3\xB3 disponible de l\'instal\xC2\xB7lador\x2C la podeu descarregar des del lloc web d\'OpenSceneryX fent clic al logotip a la part superior d\'aquesta finestra."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA7\xD7\x99\xD7\x99\xD7\x9E\xD7\xAA \xD7\x92\xD7\xA8\xD7\xA1\xD7\x94 \xD7\x97\xD7\x93\xD7\xA9\xD7\x94 \xD7\xA9\xD7\x9C \xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F\x2C \xD7\x90\xD7\xA0\xD7\x90 \xD7\x94\xD7\x95\xD7\xA8\xD7\x93 \xD7\x90\xD7\x95\xD7\xAA\xD7\x94 \xD7\x9E\xD7\x94\xD7\x90\xD7\xAA\xD7\xA8 \xD7\xA9\xD7\x9C \xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1 \xD7\xA2\xD7\x9C-\xD7\x99\xD7\x93\xD7\x99 \xD7\x9C\xD7\x97\xD7\x99\xD7\xA6\xD7\x94 \xD7\xA2\xD7\x9C \xD7\x94\xD7\x9C\xD7\x95\xD7\x92\xD7\x95 \xD7\x91\xD7\x97\xD7\x9C\xD7\xA7 \xD7\x94\xD7\xA2\xD7\x9C\xD7\x99\xD7\x95\xD7\x9F \xD7\xA9\xD7\x9C \xD7\x97\xD7\x9C\xD7\x95\xD7\x9F \xD7\x96\xD7\x94."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Nowa wersja Instalatora jest dost\xC4\x99pna\x2C pobierz j\xC4\x85 ze strony OpenSceneryX klikaj\xC4\x85c na logo u g\xC3\xB3ry tego okna."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x94\xD0\xBE\xD1\x81\xD1\x82\xD1\x83\xD0\xBF\xD0\xBD\xD0\xB0 \xD0\xBD\xD0\xBE\xD0\xB2\xD0\xB0\xD1\x8F \xD0\xB2\xD0\xB5\xD1\x80\xD1\x81\xD0\xB8\xD1\x8F \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD1\x8B \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8\x2C \xD0\xB4\xD0\xBB\xD1\x8F \xD0\xB7\xD0\xB0\xD0\xB3\xD1\x80\xD1\x83\xD0\xB7\xD0\xBA\xD0\xB8 \xD1\x81 \xD0\xB2\xD0\xB5\xD0\xB1-\xD1\x81\xD0\xB0\xD0\xB9\xD1\x82\xD0\xB0 OpenSceneryX  \xD0\xBD\xD0\xB0\xD0\xB6\xD0\xBC\xD0\xB8\xD1\x82\xD0\xB5 \xD0\xBB\xD0\xBE\xD0\xB3\xD0\xBE\xD1\x82\xD0\xB8\xD0\xBF \xD0\xB2\xD0\xB2\xD0\xB5\xD1\x80\xD1\x85\xD1\x83 \xD0\xBE\xD0\xBA\xD0\xBD\xD0\xB0."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Hay una versi\xC3\xB3n nueva del instalador\x2C por favor desc\xC3\xA1rguela del sitio web de OpenSceneryX pulsando en el logotipo que aparece en la parte superior de esta pantalla."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"C\xE2\x80\x99\xC3\xA8 una nuova versione dell\xE2\x80\x99installatore disponibile\x2C per favore scaricala dal sito di OpenSceneryX premendo sul logo in cima a questa finestra."
	#tag EndConstant

	#tag Constant, Name = kNoFilesToDelete, Type = String, Dynamic = True, Default = \"No files need to be deleted.", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Er hoeven geen bestanden te worden verwijderd."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Es m\xC3\xBCssen keine Dateien gel\xC3\xB6scht werden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Auncun fichier \xC3\xA0 supprimer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"No s\'han de suprimir fitxers."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x90\xD7\xA3 \xD7\xA7\xD7\x95\xD7\x91\xD7\xA5 \xD7\x9C\xD7\x90 \xD7\x94\xD7\x99\xD7\x94 \xD7\xA6\xD7\xA8\xD7\x99\xD7\x9A \xD7\x9C\xD7\x94\xD7\x9E\xD7\x97\xD7\xA7"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"\xC5\xBBadne pliki nie zostan\xC4\x85 skasowane."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD0\xB4\xD0\xB0\xD0\xBB\xD0\xB5\xD0\xBD\xD0\xB8\xD0\xB5 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xBE\xD0\xB2 \xD0\xBD\xD0\xB5 \xD1\x82\xD1\x80\xD0\xB5\xD0\xB1\xD1\x83\xD0\xB5\xD1\x82\xD1\x81\xD1\x8F"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Ning\xC3\xBAn archivo necesita ser borrado."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nessun file deve essere cancellato."
	#tag EndConstant

	#tag Constant, Name = kScanDisabled, Type = String, Dynamic = True, Default = \"Scan Disabled Packages", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"\xC3\x9Cberpr\xC3\xBCfe inaktive Pakete"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Scanner les sc\xC3\xA8nes d\xC3\xA9sactiv\xC3\xA9es"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Buiten werking gezette pakketten scan"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Cerca paquets desactivats"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA1\xD7\xA8\xD7\x95\xD7\xA7 \xD7\x97\xD7\x91\xD7\x99\xD7\x9C\xD7\x95\xD7\xAA \xD7\x9E\xD7\xA0\xD7\x95\xD7\x98\xD7\xA8\xD7\x9C\xD7\x95\xD7\xAA"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Skanuj wy\xC5\x82\xC4\x85czone pakiety"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB2\xD0\xB5\xD1\x80\xD0\xBA\xD0\xB0 \xD0\xBE\xD1\x82\xD0\xBA\xD0\xBB\xD1\x8E\xD1\x87\xD0\xB5\xD0\xBD\xD0\xBD\xD1\x8B\xD1\x85 \xD0\xBF\xD0\xB0\xD0\xBA\xD0\xB5\xD1\x82\xD0\xBE\xD0\xB2"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Analizar Paquetes Desactivados."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Scansione dei Pacchetti Disabilitati"
	#tag EndConstant

	#tag Constant, Name = kScanDisabledHelp, Type = String, Dynamic = True, Default = \"Scan both your \'Custom Scenery\' and \'Custom Scenery (disabled)\' folders\x2C searching for packages that use OpenSceneryX.", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"\xC3\x9Cberpr\xC3\xBCfe die Verzeichnisse \'Custom Scenery\' und \'Custom Scenery (disabled)\'. Suche Pakete die OpenSceneryX verwenden."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Scanner les dossiers \'Custom Scenery\' et \'Custom Scenery (disabled)\'\x2C pour rechercher les fichiers n\xC3\xA9cessaire d\'OpenSceneryX"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Scan van zowel \"Custom Scenery\" als van \"Custom Scenery disabled\" mappen\x2C op zoek naar pakketten welke OpeSceneryX gebruiken."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Escanega les vostres carpetes \xC2\xABCustom Scenery\xC2\xBB i \xC2\xABCustom Scenery (disabled)\xC2\xBB\x2C a la recerca de paquets que fan servir l\'OpenSceneryX."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA1\xD7\xA8\xD7\x95\xD7\xA7 \xD7\x92\xD7\x9D \xD7\x90\xD7\xAA \xD7\xAA\xD7\x99\xD7\xA7\xD7\x99\xD7\x99\xD7\xAA \'\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99 \xD7\x9E\xD7\x95\xD7\xAA\xD7\x90\xD7\x9D \xD7\x90\xD7\x99\xD7\xA9\xD7\x99\xD7\xAA\' \xD7\x95\xD7\x92\xD7\x9D \xD7\x90\xD7\xAA \xD7\xAA\xD7\x99\xD7\xA7\xD7\x99\xD7\x99\xD7\xAA \'\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99 \xD7\x9E\xD7\x95\xD7\xAA\xD7\x90\xD7\x9D \xD7\x90\xD7\x99\xD7\xA9\xD7\x99\xD7\xAA (\xD7\x9E\xD7\xA0\xD7\x95\xD7\x98\xD7\xA8\xD7\x9C)\'\x2C \xD7\x9C\xD7\x97\xD7\x99\xD7\xA4\xD7\x95\xD7\xA9 \xD7\x97\xD7\x91\xD7\x99\xD7\x9C\xD7\x95\xD7\xAA \xD7\xA9\xD7\x9E\xD7\xA9\xD7\xAA\xD7\x9E\xD7\xA9\xD7\x95\xD7\xAA \xD7\x91\xD7\x90\xD7\x95\xD7\xA4\xD7\x9F-\xD7\xA1\xD7\x99\xD7\xA0\xD7\xA8\xD7\x99-\xD7\x90\xD7\x99\xD7\xA7\xD7\xA1."
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Skanuj katalogi \'Custom Scenery\' oraz \'Custom Scenery(wy\xC5\x82\xC4\x85czone)\'\x2C szukaj\xC4\x85c pakiet\xC3\xB3w u\xC5\xBCywajacych OpenSceneryX."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD1\x80\xD0\xBE\xD0\xB2\xD0\xB5\xD1\x80\xD0\xB8\xD1\x82\xD1\x8C \xD0\xBE\xD0\xB1\xD0\xB5 \xD0\xBF\xD0\xB0\xD0\xBF\xD0\xBA\xD0\xB8 \'Custom Scenery\' \xD0\xB8 \'Custom Scenery (disabled)\'\x2C \xD0\xB4\xD0\xBB\xD1\x8F \xD0\xBF\xD0\xBE\xD0\xB8\xD1\x81\xD0\xBA\xD0\xB0 \xD0\xBF\xD0\xB0\xD0\xBA\xD0\xB5\xD1\x82\xD0\xBE\xD0\xB2\x2C \xD0\xB8\xD1\x81\xD0\xBF\xD0\xBE\xD0\xBB\xD1\x8C\xD0\xB7\xD1\x83\xD1\x8E\xD1\x89\xD0\xB8\xD1\x85 OpenSceneryX."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Analizando sus carpetas \"Custom Scenery\" y \"Custom Scenery (desactivado)\"\x2C buscando paquetes que usan OpenSceneryX."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Scansione di entrambe le tue cartelle \'Custom Scenery\xE2\x80\x99 e \xE2\x80\x98Custom Scenery (disabilitati)\xE2\x80\x99\x2C cercando per i pacchetti che usa OpenSceneryX."
	#tag EndConstant

	#tag Constant, Name = kSeasons, Type = String, Dynamic = True, Default = \"Seasons", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Stagioni"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA1\xD0\xB5\xD0\xB7\xD0\xBE\xD0\xBD\xD1\x8B"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Jaargetijden"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Saisons"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Estaciones"
	#tag EndConstant

	#tag Constant, Name = kSeasonsDescription, Type = String, Dynamic = True, Default = \"Some OpenSceneryX items have seasonal variants. Choose which method should be used to select the season. Plugins must be separately installed.", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Alcuni oggetti OpenSceneryX hanno varianti stagionali. Scegli quale metodo deve essere usato per selezionare la stagione. Il Plugins deve essere installato separatamente. "
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9D\xD0\xB5\xD0\xBA\xD0\xBE\xD1\x82\xD0\xBE\xD1\x80\xD1\x8B\xD0\xB5 \xD1\x8D\xD0\xBB\xD0\xB5\xD0\xBC\xD0\xB5\xD0\xBD\xD1\x82\xD1\x8B OpenSceneryX \xD0\xB8\xD0\xBC\xD0\xB5\xD1\x8E\xD1\x82 \xD1\x81\xD0\xB5\xD0\xB7\xD0\xBE\xD0\xBD\xD0\xBD\xD1\x8B\xD0\xB5 \xD0\xB2\xD0\xB0\xD1\x80\xD0\xB8\xD0\xB0\xD0\xBD\xD1\x82\xD1\x8B. \xD0\x92\xD1\x8B\xD0\xB1\xD0\xB5\xD1\x80\xD0\xB8\xD1\x82\xD0\xB5\x2C \xD0\xBA\xD0\xB0\xD0\xBA\xD0\xBE\xD0\xB9 \xD0\xBC\xD0\xB5\xD1\x82\xD0\xBE\xD0\xB4 \xD1\x81\xD0\xBB\xD0\xB5\xD0\xB4\xD1\x83\xD0\xB5\xD1\x82 \xD0\xB8\xD1\x81\xD0\xBF\xD0\xBE\xD0\xBB\xD1\x8C\xD0\xB7\xD0\xBE\xD0\xB2\xD0\xB0\xD1\x82\xD1\x8C \xD0\xB4\xD0\xBB\xD1\x8F \xD0\xB2\xD1\x8B\xD0\xB1\xD0\xBE\xD1\x80\xD0\xB0 \xD0\xB2\xD1\x80\xD0\xB5\xD0\xBC\xD0\xB5\xD0\xBD\xD0\xB8 \xD0\xB3\xD0\xBE\xD0\xB4\xD0\xB0. \xD0\x9F\xD0\xBB\xD0\xB0\xD0\xB3\xD0\xB8\xD0\xBD\xD1\x8B \xD0\xB4\xD0\xBE\xD0\xBB\xD0\xB6\xD0\xBD\xD1\x8B \xD0\xB1\xD1\x8B\xD1\x82\xD1\x8C \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBB\xD0\xB5\xD0\xBD\xD1\x8B \xD0\xBE\xD1\x82\xD0\xB4\xD0\xB5\xD0\xBB\xD1\x8C\xD0\xBD\xD0\xBE. "
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Sommige OpenSceneryX onderdelen bevatten jaargetijde afhankelijke varianten. Kies welke methode moet worden gebruikt om het jaargetijde te kiezen. Plugins moeten afzonderlijk worden ge\xC3\xAFnstalleerd."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Certains \xC3\xA9l\xC3\xA9ments OpenSceneryX ont des variantes saisonni\xC3\xA8res. Choisissez la m\xC3\xA9thode \xC3\xA0 utiliser pour s\xC3\xA9lectionner la saison. Les plugins doivent \xC3\xAAtre install\xC3\xA9s s\xC3\xA9par\xC3\xA9ment."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Algunos objetos de OpenSceneryX tienen variantes de estaciones. Selecciona cual m\xC3\xA9todo se debe usar para seleccionar la estaci\xC3\xB3n. Los Plugins deben ser instalados por separado."
	#tag EndConstant

	#tag Constant, Name = kSeasonsDisable, Type = String, Dynamic = True, Default = \"Disable OpenSceneryX Seasons", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Disabilita Stagioni OpenSceneryX "
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9E\xD1\x82\xD0\xBA\xD0\xBB\xD1\x8E\xD1\x87\xD0\xB8\xD1\x82\xD1\x8C \xD0\xA1\xD0\xB5\xD0\xB7\xD0\xBE\xD0\xBD\xD1\x8B \xD0\xB2 OpenScenery"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Schakel OpenSceneryX jaargetijden uit"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"D\xC3\xA9sactiver les saisons OpenSceneryX"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Deshabilitar las estaciones de OpenSceneryX"
	#tag EndConstant

	#tag Constant, Name = kSeasonsFourSeasons, Type = String, Dynamic = True, Default = \"Four Seasons Plugin", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Plugin Quattro Stagioni"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD0\xBB\xD0\xB0\xD0\xB3\xD0\xB8\xD0\xBD Four Seasons "
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Vier jaargetijden Plugin"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Plugin 4 saisons"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Plugin Cuatro Estaciones"
	#tag EndConstant

	#tag Constant, Name = kSeasonsFourSeasonsMoreInfoLink, Type = String, Dynamic = True, Default = \"More about the Four Seasons Plugin", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Di pi\xC3\xB9 sul Plugin Quattro Stagioni"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD0\xB7\xD0\xBD\xD0\xB0\xD1\x82\xD1\x8C \xD0\xB1\xD0\xBE\xD0\xBB\xD1\x8C\xD1\x88\xD0\xB5 \xD0\xBE \xD0\xBF\xD0\xBB\xD0\xB0\xD0\xB3\xD0\xB8\xD0\xBD\xD0\xB5 Four Seasons"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Meer over de vier jaargetijden Plugin"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Plus \xC3\xA0 propos du plugin 4 saisons"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"M\xC3\xA1s informaci\xC3\xB3n sobre el Plugin Cuatro Estaciones"
	#tag EndConstant

	#tag Constant, Name = kSeasonsTerraMaxx, Type = String, Dynamic = True, Default = \"TerraMaxx Plugin", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Plugin TerraMaxx"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD0\xBB\xD0\xB0\xD0\xB3\xD0\xB8\xD0\xBD TerraMaxx "
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"TerraMaxx Plugin"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Plugin TerraMaxx"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Plugin TerraMaxx"
	#tag EndConstant

	#tag Constant, Name = kSeasonsTerraMaxxMoreInfoLink, Type = String, Dynamic = True, Default = \"More about the TerraMaxx Plugin", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Di pi\xC3\xB9 sul Plugin TerraMaxx"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD0\xB7\xD0\xBD\xD0\xB0\xD1\x82\xD1\x8C \xD0\xB1\xD0\xBE\xD0\xBB\xD1\x8C\xD1\x88\xD0\xB5 \xD0\xBE \xD0\xBF\xD0\xBB\xD0\xB0\xD0\xB3\xD0\xB8\xD0\xBD\xD0\xB5 TerraMaxx "
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Meer over de TerraMaxx Plugin"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Plus \xC3\xA0 propos du plugin TerraMaxx"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"M\xC3\xA1s informaci\xC3\xB3n sobre el Plugin TerraMaxx\n"
	#tag EndConstant

	#tag Constant, Name = kSeasonsXAmbience, Type = String, Dynamic = True, Default = \"xAmbience Plugin", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Plugin xAmbience"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD0\xBB\xD0\xB0\xD0\xB3\xD0\xB8\xD0\xBD xAmbience "
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"xAmbience Plugin"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Plugin xAmbience"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Plugin xAmbience"
	#tag EndConstant

	#tag Constant, Name = kSeasonsXAmbienceMoreInfoLink, Type = String, Dynamic = True, Default = \"More about the xAmbience Plugin", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Di pi\xC3\xB9 sul Plugin xAmbience"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD0\xB7\xD0\xBD\xD0\xB0\xD1\x82\xD1\x8C \xD0\xB1\xD0\xBE\xD0\xBB\xD1\x8C\xD1\x88\xD0\xB5 \xD0\xBE \xD0\xBF\xD0\xBB\xD0\xB0\xD0\xB3\xD0\xB8\xD0\xBD\xD0\xB5 xAmbience "
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Meer over de xAmbience Plugin"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Plus \xC3\xA0 propos du plugin xAmbience"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"M\xC3\xA1s informaci\xC3\xB3n sobre el Plugin xAmbience"
	#tag EndConstant

	#tag Constant, Name = kSeasonsXPlane, Type = String, Dynamic = True, Default = \"X-Plane\xC2\xAE Default", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"X-Plane\xC2\xAE Predefinito"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x91\xD0\xB0\xD0\xB7\xD0\xBE\xD0\xB2\xD1\x8B\xD0\xB9 X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"X-Plane Standaard"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"X-Plane\xC2\xAE Default"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"X-Plane\xC2\xAE por defecto"
	#tag EndConstant

	#tag Constant, Name = kSeparator, Type = String, Dynamic = False, Default = \"----", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSet, Type = String, Dynamic = True, Default = \"Set\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Asignar..."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"R\xC3\xA9glages\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Tria\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Imposta\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Einstellungen\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Stel..."
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA7\xD7\x91\xD7\xA2"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Ustaw..."
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x92\xD1\x8B\xD0\xB1\xD1\x80\xD0\xB0\xD1\x82\xD1\x8C..."
	#tag EndConstant

	#tag Constant, Name = kStageInstall, Type = String, Dynamic = True, Default = \"Install", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Installeer"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Installation"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Installer"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Instal\xC2\xB7la"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\xAA\xD7\xA7\xD7\x9F"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Instaluj"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA3\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xB8\xD1\x82\xD1\x8C"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Instalar"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Installa"
	#tag EndConstant

	#tag Constant, Name = kStageInstallerVersion, Type = String, Dynamic = True, Default = \"Installer Version", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Installer versie"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Version des Installationsprogramms"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Version de l\'installeur"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Versi\xC3\xB3 de l\'instal\xC2\xB7lador"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x92\xD7\xA8\xD7\xA1\xD7\xAA \xD7\x94\xD7\x9E\xD7\xAA\xD7\xA7\xD7\x99\xD7\x9F"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Wersja Instalatora"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x92\xD0\xB5\xD1\x80\xD1\x81\xD0\xB8\xD1\x8F \xD0\xBF\xD1\x80\xD0\xBE\xD0\xB3\xD1\x80\xD0\xB0\xD0\xBC\xD0\xBC\xD1\x8B \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Versi\xC3\xB3n del Instalador"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Versione dell\xE2\x80\x99Installatore"
	#tag EndConstant

	#tag Constant, Name = kStageIntroduction, Type = String, Dynamic = True, Default = \"Introduction", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Introductie"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Einf\xC3\xBChrung"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Introduction"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Introducci\xC3\xB3"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\xA7\xD7\x93\xD7\x9E\xD7\x94"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Wprowadzenie"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x92\xD0\xB2\xD0\xB5\xD0\xB4\xD0\xB5\xD0\xBD\xD0\xB8\xD0\xB5"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Introducci\xC3\xB3n"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Introduzione"
	#tag EndConstant

	#tag Constant, Name = kStageLicense, Type = String, Dynamic = True, Default = \"License", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Licentie"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Lizenzbestimmungen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"License"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Llic\xC3\xA8ncia"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA8\xD7\xA9\xD7\x99\xD7\x95\xD7\x9F"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Licencja"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9B\xD0\xB8\xD1\x86\xD0\xB5\xD0\xBD\xD0\xB7\xD0\xB8\xD1\x8F"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Licencia"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Licenza"
	#tag EndConstant

	#tag Constant, Name = kStageLocalScan, Type = String, Dynamic = True, Default = \"Compare Local To Remote", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Vergelijk lokaal met server"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Vergleiche die lokalen Dateien"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Comparer les fichiers locaux au serveur"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Compara Local i Remot"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\x94\xD7\xA9\xD7\x95\xD7\x95\xD7\x94 \xD7\x9E\xD7\xA7\xD7\x95\xD7\x9E\xD7\x99 \xD7\x9C\xD7\x9E\xD7\xA8\xD7\x95\xD7\x97\xD7\xA7"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Por\xC3\xB3wnaj lokalne do zdalnych"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA1\xD1\x80\xD0\xB0\xD0\xB2\xD0\xBD\xD0\xB5\xD0\xBD\xD0\xB8\xD0\xB5 \xD1\x84\xD0\xB0\xD0\xB9\xD0\xBB\xD0\xBE\xD0\xB2"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Comparar Local con Remoto"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Compara i file locali con quelli remoti"
	#tag EndConstant

	#tag Constant, Name = kStageSettings, Type = String, Dynamic = True, Default = \"Settings", Scope = Private
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Impostazioni"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9D\xD0\xB0\xD1\x81\xD1\x82\xD1\x80\xD0\xBE\xD0\xB9\xD0\xBA\xD0\xB8"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Instellingen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"R\xC3\xA9glages"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Ajustes"
	#tag EndConstant

	#tag Constant, Name = kStageSummary, Type = String, Dynamic = True, Default = \"Summary", Scope = Public
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Samenvatting"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Zusammenfassung"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"R\xC3\xA9sum\xC3\xA9"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Resum"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA1\xD7\x9B\xD7\x95\xD7\x9D"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Podsumowanie"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x97\xD0\xB0\xD0\xB2\xD0\xB5\xD1\x80\xD1\x88\xD0\xB5\xD0\xBD\xD0\xB8\xD0\xB5"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Resumen"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Riassunto"
	#tag EndConstant

	#tag Constant, Name = kTypeOfInstall, Type = String, Dynamic = True, Default = \"Type of Install", Scope = Public
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Art der Installation"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Type d\'installation"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Installatie manier"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Tipus d\'instal\xC2\xB7laci\xC3\xB3"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xA1\xD7\x95\xD7\x92 \xD7\x94\xD7\x94\xD7\xAA\xD7\xA7\xD7\xA0\xD7\x94"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Typ instalacji"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\xA2\xD0\xB8\xD0\xBF \xD1\x83\xD1\x81\xD1\x82\xD0\xB0\xD0\xBD\xD0\xBE\xD0\xB2\xD0\xBA\xD0\xB8"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Tipo de instalaci\xC3\xB3n"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Tipo di Installazione"
	#tag EndConstant

	#tag Constant, Name = kUseSteam, Type = String, Dynamic = True, Default = \"Use Steam", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Usa Steam"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x98\xD1\x81\xD0\xBF\xD0\xBE\xD0\xBB\xD1\x8C\xD0\xB7\xD0\xBE\xD0\xB2\xD0\xB0\xD1\x82\xD1\x8C Steam"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Gebruik Steam"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Utiliser Steam"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Usar Steam"
	#tag EndConstant

	#tag Constant, Name = kXPlaneFolder, Type = String, Dynamic = True, Default = \"X-Plane\xC2\xAE Folder", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Carpeta X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Dossier X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Carpeta de l\'X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Cartella di X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"X-Plane\xC2\xAE Verzeichnis"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"X-Plane\xC2\xAE Map"
		#Tag Instance, Platform = Any, Language = he, Definition  = \"\xD7\xAA\xD7\x99\xD7\xA7\xD7\x99\xD7\x99\xD7\xAA \xD7\x90\xD7\xA7\xD7\xA1-\xD7\xA4\xD7\x9C\xD7\x9F\xC2\xAE"
		#Tag Instance, Platform = Any, Language = pl, Definition  = \"Katalog X-Plane\xC2\xAE"
		#Tag Instance, Platform = Any, Language = ru, Definition  = \"\xD0\x9F\xD0\xB0\xD0\xBF\xD0\xBA\xD0\xB0 X-Plane\xC2\xAE"
	#tag EndConstant


#tag EndWindowCode

#tag Events cnvBG
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #If TargetMacOS Then
		    // Dark mode is detected properly on macOS
		    If IsDarkMode Then
		      g.ForeColor = &c000000
		    Else
		      g.ForeColor = &cFFFFFF
		    End If
		  #ElseIf TargetLinux
		    // White with 50% opacity to handle both dark and light themes
		    g.ForeColor = &cFFFFFF88
		  #Else
		    // White with 100% opacity for the moment on Windows
		    g.ForeColor = &cFFFFFF
		  #EndIf
		  
		  g.FillRect(0, 0, g.Width, g.Height)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvComplete
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Draw the image into the middle of the canvas
		  g.drawPicture(imgGreenTick, me.width / 2 - imgGreenTick.width / 2, me.height / 2 - imgGreenTick.height / 2, imgGreenTick.width, imgGreenTick.height)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkStaticAircraft
	#tag Event
		Sub Action()
		  coreStaticAircraftChanged
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkHDForests
	#tag Event
		Sub Action()
		  coreHDForestsChanged
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnViewLicense
	#tag Event
		Sub Action()
		  wndLicense.show()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetXPlaneFolder
	#tag Event
		Sub Action()
		  dim i as integer
		  
		  if (App.getXPlaneFolder(false)) then
		    setupOSXFolder()
		    
		    // Set the current panel as having been completed
		    setPanelCompleted(ppnlMain.value)
		    
		    // Set all subsequent panels as not being completed
		    for i = ppnlMain.value + 1 to ppnlMain.PanelCount - 1
		      setPanelCompleted(i, false)
		    next
		    
		    txtXplaneFolder.text = App.pXPlaneFolder.nativePath
		    enableContinue()
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnUseSteam
	#tag Event
		Sub Action()
		  Dim i As Integer
		  
		  #If TargetMacOS
		    ' Mac Steam location is in the ApplicationData path
		    Dim appDataPath As String = SpecialFolder.ApplicationData.nativePath
		    Dim steamPaths() As String = App.kSteamMacDefaultPaths.Split(EndOfLine.OSX)
		  #ElseIf TargetWindows
		    ' Windows Steam location is in the Registry
		    Dim regItem As New RegistryItem("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Valve\Steam", False)
		    Dim appDataPath As String = regItem.Value("InstallPath")
		    Dim steamPaths() As String = App.kSteamWindowsDefaultPaths.Split(EndOfLine.OSX)
		  #ElseIf TargetLinux
		    ' Linux Steam location is in the user's folder
		    Dim appDataPath As String = "~/.steam"
		    Dim steamPaths() As String = App.kSteamLinuxDefaultPaths.Split(EndOfLine.OSX)
		  #EndIf
		  
		  Dim pathCount As Integer = steamPaths.Ubound
		  For i  = 0 To pathCount
		    steamPaths(i) = appDataPath + steamPaths(i)
		    Dim folder As FolderItem = New FolderItem(steamPaths(i), FolderItem.PathTypeShell)
		    
		    If (folder.exists And folder.Child("Custom Scenery").exists) Then
		      App.pXPlaneFolder = folder
		      App.pPreferences.value(App.kPreferenceXPlanePath) = App.pXPlaneFolder.nativePath
		      
		      setupOSXFolder
		      
		      // Set the current panel as having been completed
		      setPanelCompleted(ppnlMain.value)
		      
		      // Set all subsequent panels as not being completed
		      for i = ppnlMain.value + 1 to ppnlMain.PanelCount - 1
		        setPanelCompleted(i, false)
		      Next
		      
		      txtXplaneFolder.text = App.pXPlaneFolder.nativePath
		      enableContinue(1)
		      
		      Return
		    End If
		  Next
		  
		  ' If we get here then none of the possible Steam X-Plane paths exist
		  MsgBox(App.processParameterizedString(App.kErrorXPlaneSteamFolderNotFound, Array(Join(steamPaths, ", "))))
		  
		  Exception err As RegistryAccessErrorException
		    ' The registry item (Windows) was not found - i.e. Steam not installed
		    MsgBox(App.kErrorSteamNotFound)
		    
		  Exception err As UnsupportedFormatException
		    ' Thrown if the path passed to the FolderItem is invalid
		    MsgBox(App.processParameterizedString(App.kErrorXPlaneSteamFolderNotFound, Array(Join(steamPaths, ", "))))
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rdoBackupLibraryInvisible
	#tag Event
		Sub Action()
		  backupLibraryChanged()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rdoBackupLibraryVisible
	#tag Event
		Sub Action()
		  backupLibraryChanged()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rdoBackupLibraryDisable
	#tag Event
		Sub Action()
		  backupLibraryChanged()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtBackupLibraryMoreInfoLink
	#tag Event
		Sub Open()
		  me.mousecursor = system.cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  ShowURL(App.kURLBackupLibrary)
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events popSeasons
	#tag Event
		Sub Change()
		  seasonsChanged
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  #If TargetLinux Or TargetWindows
		    If (Me.height < 30) Then Me.height = 30
		  #EndIf
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtSeasonsFourSeasonsMoreInfoLink
	#tag Event
		Sub Open()
		  me.mousecursor = system.cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  ShowURL(App.kURLSeasonsFourSeasons)
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events txtSeasonsTerraMaxxMoreInfoLink
	#tag Event
		Sub Open()
		  me.mousecursor = system.cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  ShowURL(App.kURLSeasonsTerramaxx)
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events txtSeasonsXAmbienceMoreInfoLink
	#tag Event
		Sub Open()
		  me.mousecursor = system.cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  ShowURL(App.kURLSeasonsXAmbience)
		  
		End Function
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
#tag Events btnContinue
	#tag Event
		Sub Action()
		  continueClicked()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnBack
	#tag Event
		Sub Action()
		  backClicked()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rdoInstallTypeFull
	#tag Event
		Sub Action()
		  installTypeChanged()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rdoInstallTypeMinimal
	#tag Event
		Sub Action()
		  installTypeChanged()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkDeleteUnused
	#tag Event
		Sub Action()
		  deleteUnusedChanged()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkScanDisabled
	#tag Event
		Sub Action()
		  scanDisabledChanged()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events thrUpdateFolderStructure
	#tag Event
		Sub Run()
		  tmrUpdateFolderStructure.Mode = Timer.ModeMultiple
		  
		  While (pPendingFiles.Count > 0)
		    App.YieldToNextThread
		    If Not pSockFileWorking and pPendingFiles.Count > 0 Then
		      downloadNextFile
		    end if
		  wend
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrUpdateFolderStructure
	#tag Event
		Sub Action()
		  If (thrUpdateFolderStructure.State = Thread.Running And pPendingFiles.Count > 0) Then
		    dim currentFile as integer = prgBarOverall.maximum - pPendingFiles.count
		    dim filePath as String = pPendingFiles.item(1)
		    
		    showMessage(txtInstallBodyText2, kDownloadingFiles + " ", Array(filePath, str(currentFile + 1), str(prgBarOverall.maximum)))
		    
		    prgBarOverall.value = currentFile
		    prgBarOverall.visible = true
		    txtOverallPercent.text = str(round((prgBarOverall.maximum - pPendingFiles.count) * 100 / prgBarOverall.maximum)) + "%"
		    txtOverallPercent.visible = true
		    prgBarFile.visible = true
		    txtFilePercent.visible = true
		  else
		    showMessage(txtInstallBodyText2, kDownloadedFiles + " " + kDone, Array(str(pPendingFiles.count)))
		    setPanelCompleted(ppnlMain.value)
		    prgBarOverall.visible = false
		    prgBarFile.visible = false
		    txtFilePercent.visible = false
		    txtOverallPercent.visible = false
		    selectPanel(6)
		    enableContinue(1)
		    enableBack(0)
		    
		    me.Mode = Timer.ModeOff
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sockVersion
	#tag Event
		Sub PageReceived(URL as Text, HTTPStatus as Integer, Content as xojo.Core.MemoryBlock)
		  // Finished connection with server
		  prgwCheckInstaller.visible = False
		  showMessage(txtInstallerVersionBodyText1, kCheckingInstallerVersion + " " + kDone)
		  
		  If (HTTPStatus = 200) Then
		    Dim serverVersion As New LooseVersion(App.mbToString(Content))
		    Dim appVersion As New LooseVersion(App.shortVersion)
		    
		    If appVersion < serverVersion Then
		      showMessage(txtInstallerVersionBodyText2, kNewInstallerAvailable)
		    Else
		      showMessage(txtInstallerVersionBodyText2, kInstallerVersionUpToDate)
		      setPanelCompleted(ppnlMain.value)
		      enableContinue
		    End If
		  Else
		    // Error from server, continue anyway
		    showMessage(txtInstallerVersionBodyText2, kCouldntCheckInstallerVersion)
		    setPanelCompleted(ppnlMain.value)
		    enableContinue
		  End If
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error(err as RuntimeException)
		  showMessage(txtInstallerVersionBodyText2, kCouldntCheckInstallerVersion)
		  setPanelCompleted(ppnlMain.value)
		  enableContinue
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sockManifest
	#tag Event
		Sub Error(err as RuntimeException)
		  prgwLocalScan2.visible = False
		  showMessage(txtLocalScanBodyText2, kError, Array(str(err.Reason)))
		End Sub
	#tag EndEvent
	#tag Event
		Sub FileReceived(URL as Text, HTTPStatus as Integer, File as xojo.IO.FolderItem)
		  If (HTTPStatus = 200) Then
		    Dim zar As ZipArchive = New ZipArchive
		    Dim f As FolderItem, e As ZipEntry
		    Dim classicFile As New FolderItem(File.Path, FolderItem.PathTypeNative)
		    
		    If Not zar.Open(classicFile, False) Then
		      showMessage(txtLocalScanBodyText2, kErrorManifest + " (0)")
		      prgwLocalScan2.visible = False
		      Return
		    End
		    
		    e = zar.Entry(1)
		    f = e.MakeDestination(GetTemporaryFolderItem.parent, False)
		    
		    If Not e.Extract(f) Then
		      showMessage(txtLocalScanBodyText2, kErrorManifest + " (1) " + e.ErrorMessage)
		      prgwLocalScan2.visible = False
		      Return
		    End
		    
		    If Not zar.Close Then
		      showMessage(txtLocalScanBodyText2, kErrorManifest + " (2)")
		      prgwLocalScan2.visible = False
		      Return
		    End
		    
		    File.delete
		    
		    prgwLocalScan2.visible = False
		    
		    '!!!! Remove these lines
		    'dim g as FolderItem = new FolderItem("/Users/austin/Desktop/testmanifest.xml", FolderItem.PathTypeShell)
		    'dim tis as TextInputStream = g.openAsTextFile
		    '!!!
		    Dim tis As TextInputStream = f.openAsTextFile
		    
		    If pServerManifest.gatherManifestFromXMLString(tis.readAll) Then
		      f.delete
		      showMessage(txtLocalScanBodyText2, kDownloadingManifest + " " + kDone)
		      checkFolderStructure
		    Else
		      showMessage(txtLocalScanBodyText2, kErrorManifest + " (3)")
		    End If
		    
		  Else
		    showMessage(txtLocalScanBodyText2, kErrorManifest + " (4)")
		    prgwLocalScan2.visible = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sockFile
	#tag Event
		Sub Error(err as RuntimeException)
		  pSockFileWorking = False
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub FileReceived(URL as Text, HTTPStatus as Integer, File as xojo.IO.FolderItem)
		  If (HTTPStatus = 200) Then
		    Dim filePath As String = pPendingFiles.item(1)
		    Dim zar As ZipArchive = New ZipArchive
		    Dim f As FolderItem
		    Dim e As ZipEntry
		    Dim classicFile As New FolderItem(File.Path, FolderItem.PathTypeNative)
		    
		    pPendingFiles.remove(1)
		    
		    Dim destinationFolderItem As FolderItem = pLocalManifest.getLocalFolderItem(filePath)
		    If (destinationFolderItem.exists) Then destinationFolderItem.delete
		    
		    If Not zar.Open(classicFile, False) Then
		      showMessage(txtInstallBodyText2, kError, Array(zar.ErrorMessage))
		      Return
		    End
		    
		    e = zar.Entry(1)
		    
		    f = e.MakeDestination(classicFile.parent, False)
		    
		    If Not e.Extract(f) Then
		      showMessage(txtInstallBodyText2, kExtractionFailed, Array(e.RawPath, e.ErrorMessage))
		      Return
		    End
		    
		    If Not zar.Close Then
		      showMessage(txtInstallBodyText2, kError, Array(zar.ErrorMessage))
		      Return
		    End
		    
		    f.copyFileTo(destinationFolderItem)
		    f.delete
		    classicFile.delete
		    
		  Else
		    showMessage(txtInstallBodyText2, kErrorHTTP, Array(Str(httpStatus)))
		    'prgBarFile.visible = false
		    'txtProgress.visible = false
		  End If
		  
		  pSockFileWorking = False
		  
		  Exception err As NilObjectException
		    // Will throw exception if we weren't able to create the folder structure
		    tmrUpdateFolderStructure.Enabled = False
		    showMessage(txtInstallBodyText2, kErrorWritingFile)
		    
		End Sub
	#tag EndEvent
	#tag Event
		Sub ReceiveProgress(BytesReceived as Int64, TotalBytes as Int64, NewData as xojo.Core.MemoryBlock)
		  prgBarFile.maximum = TotalBytes
		  prgBarFile.value = BytesReceived
		  txtFilePercent.Text = Str(Round((BytesReceived / TotalBytes) * 100)) + "%"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events thrLocalScan
	#tag Event
		Sub Run()
		  tmrLocalScan.Mode = Timer.ModeMultiple
		  
		  // Tidy up previous problems
		  preProcessLocalFolderItem(pOsxFolderItem)
		  
		  // Scan local files
		  pLocalManifest.gatherManifestFromLocalFolderItem(pOsxFolderItem)
		  
		  // Scan DSFs (if option selected)
		  If (App.pPreferences.hasKey(App.kPreferenceInstallType) And App.pPreferences.value(App.kPreferenceInstallType) = App.kPreferenceInstallTypeMinimal) Then
		    pDSFManifest.gatherManifestFromDSFFiles(App.pXPlaneFolder, chkScanDisabled.value)
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrLocalScan
	#tag Event
		Sub Action()
		  If (thrLocalScan.State <> Thread.Running) Then
		    Me.Mode = Timer.ModeOff
		    
		    // Local Scan Done
		    prgwLocalScan1.visible = False
		    showMessage(txtLocalScanBodyText1, kCollectingLocalFileInformation + " " + kDone)
		    
		    // Starting Download Manifest
		    prgwLocalScan2.visible = True
		    showMessage(txtLocalScanBodyText2, kDownloadingManifest)
		    
		    // Really the next stuff should go into another thread
		    If pServerManifest = Nil Then
		      // Download the server manifest
		      pServerManifest = New FolderManifest
		      
		      Dim temporaryFile As FolderItem = GetTemporaryFolderItem
		      
		      If (App.StageCode = 3) Then
		        sockManifest.send("GET", App.kURLManifest, New Xojo.IO.FolderItem(temporaryFile.NativePath.ToText))
		      Else
		        sockManifest.send("GET", App.kURLDevManifest, New Xojo.IO.FolderItem(temporaryFile.NativePath.ToText))
		      End If
		    Else
		      // We had already downloaded the server manifest
		      prgwLocalScan2.visible = False
		      showMessage(txtLocalScanBodyText2, kDownloadingManifest + " " + kDone)
		      
		      // Starting checking folder structure
		      checkFolderStructure
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPaypal
	#tag Event
		Sub Action()
		  Dim url As String = ""
		  
		  Dim business As String = "austin@opensceneryx.com"
		  Dim country As String = "GB"
		  Dim curr As String = "GBP"
		  
		  url = "https://www.paypal.com/cgi-bin/webscr" + _
		  "?cmd=" + "_donations" + _
		  "&business=" + business + _
		  "&lc=" + country + _
		  "&currency_code=" + curr + _
		  "&bn=" + "PP%2dDonationsBF"
		  
		  ShowURL(url)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
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
		Name="FullScreen"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
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
		Name="pSockFileWorking"
		Group="Behavior"
		InitialValue="false"
		Type="boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior

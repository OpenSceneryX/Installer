#tag ClassProtected Class AutoHeightPushButtonInherits PushButton	#tag Event		Sub Open()		  #if TargetLinux		    if (me.height < 24) then me.height = 24		  #endif		  		  open		  		End Sub	#tag EndEvent	#tag Hook, Flags = &h0		Event Open()	#tag EndHook	#tag Note, Name = Untitled	#tag EndNote	#tag ViewBehavior		#tag ViewProperty			Name="AutoDeactivate"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Bold"			Visible=true			Group="Font"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="ButtonStyle"			Visible=true			Group="Appearance"			InitialValue="0"			Type="ButtonFrameStyle"			EditorType="Enum"			InheritedFrom="PushButton"			#tag EnumValues				"0 - Push"				"1 - Gradient"				"2 - Rounded"				"3 - Rescessed"				"4 - Textured"				"5 - Rounded Textured"				"6 - Square"				"7 - Bevel"				"8 - Round"				"9 - Help"			#tag EndEnumValues		#tag EndViewProperty		#tag ViewProperty			Name="Cancel"			Visible=true			Group="Appearance"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Caption"			Visible=true			Group="Appearance"			InitialValue="Untitled"			Type="String"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Default"			Visible=true			Group="Appearance"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Enabled"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Height"			Visible=true			Group="Position"			InitialValue="20"			Type="Integer"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="HelpTag"			Visible=true			Group="Appearance"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			Type="Integer"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="InitialParent"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Italic"			Visible=true			Group="Font"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			Type="Integer"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="LockBottom"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="LockLeft"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="LockRight"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="LockTop"			Visible=true			Group="Position"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			Type="String"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="TabIndex"			Visible=true			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="TabPanelIndex"			Group="Position"			InitialValue="0"			Type="Integer"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="TabStop"			Visible=true			Group="Position"			InitialValue="True"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="TextFont"			Visible=true			Group="Font"			InitialValue="System"			Type="String"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="TextSize"			Visible=true			Group="Font"			InitialValue="0"			Type="Single"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="TextUnit"			Visible=true			Group="Font"			InitialValue="0"			Type="FontUnits"			EditorType="Enum"			InheritedFrom="PushButton"			#tag EnumValues				"0 - Default"				"1 - Pixel"				"2 - Point"				"3 - Inch"				"4 - Millimeter"			#tag EndEnumValues		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			Type="Integer"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Underline"			Visible=true			Group="Font"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Visible"			Visible=true			Group="Appearance"			InitialValue="True"			Type="Boolean"			InheritedFrom="PushButton"		#tag EndViewProperty		#tag ViewProperty			Name="Width"			Visible=true			Group="Position"			InitialValue="80"			Type="Integer"			InheritedFrom="PushButton"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass
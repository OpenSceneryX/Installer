#tag Class
Protected Class ZLibStreamException
Inherits RuntimeException
	#tag Method, Flags = &h0
		Sub Constructor(fromStream as ZLibStream, errorCode as Integer)
		  mStream = fromStream
		  mErrorCode = errorCode
		  dim msg as String
		  if mStream <> nil then
		    break
		    msg = mStream.Message()
		  else
		    break
		    msg = "zlib missing"
		    System.DebugLog "ZLibStreamException: zlib missing"
		  end if
		  if errorCode <> 0 then
		    if msg <> "" then
		      msg = msg + ", "
		    end if
		    msg = msg + "Code "+Str(errorCode,"-#")
		  end if
		  me.Message = msg
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mErrorCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStream As ZLibStream
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Reason"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Message"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorNumber"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

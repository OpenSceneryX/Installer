#tag Class
Protected Class ZipBinaryStreamReader
Implements IStreamReader, Readable
	#tag Method, Flags = &h0
		Sub Constructor(binstream as BinaryStream, size as Int64, prefix as String, suffix as String)
		  // the constructor
		  me.theStream = binstream
		  me.prefixStr = prefix
		  me.prefixLen = LenB(prefix)
		  me.suffixStr = suffix
		  me.suffixLen = LenB(suffix)
		  me.streamLen = size
		  me.leftToRead = me.prefixLen + me.streamLen + me.suffixLen
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EOF() As Boolean
		  // Part of the Readable interface.
		  
		  return Remaining() = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorValue() As Integer
		  return me.LastError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function fetch(amt_ as UInt32) As String
		  dim amt, n as UInt32, s as String
		  amt = amt_
		  do
		    if me.prefixLen > 0 then
		      n = Min(me.prefixLen, amt)
		      amt = amt - n
		      me.prefixLen = me.prefixLen - n
		      if me.prefixLen > 0 then
		        s = s + LeftB(me.prefixStr, n)
		        me.prefixStr = MidB(me.prefixStr, n+1)
		      else
		        s = s + me.prefixStr
		      end
		    elseif me.streamLen > 0 then
		      n = Min(me.streamLen, amt)
		      amt = amt - n
		      me.streamLen = me.streamLen - n
		      if LenB(s) = 0 then
		        s = me.theStream.Read(n)
		      else
		        s = s + me.theStream.Read(n)
		      end
		    elseif me.suffixLen > 0 then
		      n = Min(me.suffixLen, amt)
		      amt = amt - n
		      me.suffixLen = me.suffixLen - n
		      if me.suffixLen > 0 then
		        s = s + LeftB(me.suffixStr, n)
		        me.suffixStr = MidB(me.suffixStr, n+1)
		      else
		        s = s + me.suffixStr
		      end
		    end
		  loop until amt = 0
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  dim i as Integer
		  i = me.errCode
		  return me.errCode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(Count As Integer) As String
		  return Read (Count, nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(Count As Integer, encoding As TextEncoding = Nil) As String
		  // Part of the Readable interface.
		  
		  #pragma unused encoding
		  
		  dim n as Int64
		  n = Count
		  if n > me.leftToRead then
		    n = me.leftToRead
		    if n = 0 then
		      me.errCode = -39 // EOF
		    end
		  end
		  if n > 0 then
		    me.leftToRead = me.leftToRead - n
		    return fetch(n)
		  end
		  Exception exc as RuntimeException
		    me.errCode = -1 // undefined error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadError() As Boolean
		  // Part of the Readable interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Remaining() As Int64
		  return me.leftToRead
		End Function
	#tag EndMethod


	#tag Note, Name = About
		See the notes in the class "ZipArchive" for more information
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected errCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected leftToRead As Int64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected prefixLen As UInt32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected prefixStr As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected streamLen As Int64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected suffixLen As UInt32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected suffixStr As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected theStream As BinaryStream
	#tag EndProperty


	#tag ViewBehavior
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
	#tag EndViewBehavior
End Class
#tag EndClass

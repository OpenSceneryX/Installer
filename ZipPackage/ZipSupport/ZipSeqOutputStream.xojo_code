#tag Class
Protected Class ZipSeqOutputStream
Inherits BinaryStream
	#tag Method, Flags = &h1
		Protected Sub Close()
		  raiseEvent Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1001
		Protected Sub Constructor()
		  // You need to subclass this class and call this constructor from its constructor
		  
		  super.Constructor("")
		  mCurrLength = 0
		  mBuffer16 = new MemoryBlock (2)
		  mBuffer16.LittleEndian = true
		  mBuffer32 = new MemoryBlock (4)
		  mBuffer32.LittleEndian = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub myWrite(d as MemoryBlock)
		  dim abort as Boolean
		  raiseEvent Write (d, abort)
		  if abort then
		    mError = true
		  else
		    mCurrLength = mCurrLength + d.Size
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub notAllowed()
		  // These functions may not be called in this class as it's only meant to accept sequential writing calls
		  break
		  dim exc as new RuntimeException
		  exc.Message = "Internal error (calling unsupported method in ZipSeqOutputStream)"
		  raise exc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SeqStreamHadError() As Boolean
		  return mError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SeqStreamLength() As UInt64
		  return mCurrLength
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Write(s as String)
		  myWrite s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WriteUInt16(i as UInt16)
		  mBuffer16.UInt16Value(0) = i
		  myWrite mBuffer16
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WriteUInt32(i as UInt32)
		  mBuffer32.UInt32Value(0) = i
		  myWrite mBuffer32
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Write(data as MemoryBlock, ByRef abort as Boolean)
	#tag EndHook


	#tag Note, Name = About
		This class is specially made for the ZipArchive class and its functions.
		It makes a few assumptions (endianness, and which functions will
		be called), making it not suitable for general use but only for use
		with the ZipArchive.OpenForSequentialWriting method.
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mBuffer16 As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBuffer32 As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mCurrLength As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mError As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Length"
			Group="Behavior"
			Type="UInt64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Position"
			Group="Behavior"
			Type="UInt64"
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
			Name="LittleEndian"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastErrorCode"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseIOExceptions"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

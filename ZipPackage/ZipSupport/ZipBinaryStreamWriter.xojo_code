#tag Class
Protected Class ZipBinaryStreamWriter
Implements IStreamWriter
	#tag Method, Flags = &h0
		Function BytesWritten() As Integer
		  return me.written
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(binstream as BinaryStream, discardLeadingBytes as Integer)
		  // the constructor
		  me.binstream = binstream
		  me.discardLeadingBytes = discardLeadingBytes
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CRC() As Integer
		  return me.crc_
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableCRCCalculation()
		  me.calcCRC = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorValue() As Integer
		  return me.LastError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(dataIn As String)
		  dim dataOut as String
		  dim l as Integer
		  
		  dataOut = dataIn
		  
		  if me.calcCRC then
		    me.crc_ = ZipConfig.CRC32 (me.crc_, dataIn)
		  end
		  
		  l = LenB(dataOut)
		  if me.discardLeadingBytes > 0 then
		    if l >= me.discardLeadingBytes then
		      binstream.Write MidB(dataOut, me.discardLeadingBytes+1)
		      me.written = me.written + l - me.discardLeadingBytes
		      me.discardLeadingBytes = 0
		    else
		      me.discardLeadingBytes = me.discardLeadingBytes - l
		    end
		  else
		    binstream.Write dataOut
		    me.written = me.written + l
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteFromZLib(buf as Ptr, len as UInt32, ByRef hint as Variant) As Boolean
		  // Fits the delegate ZLibStream.WriteProc
		  
		  #pragma unused hint
		  
		  // Note: If MAX_WBITS_RAW is used in ZLibDeflator.Constructor, then this is not needed:
		  if written = 0 and me.discardLeadingBytes = 2 then
		    // make sure the header is as expected
		    if buf.Byte(0) <> ZLibStream.Header1 or buf.Byte(1) <> ZLibStream.Header2 then
		      break
		      raise new UnsupportedFormatException
		    end
		  end
		  
		  dim mb as MemoryBlock = buf
		  Write mb.StringValue (0, len)
		  return true
		End Function
	#tag EndMethod


	#tag Note, Name = About
		
		See the notes in the class "ZipArchive" for more information
	#tag EndNote


	#tag Property, Flags = &h1
		Protected binstream As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected calcCRC As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected crc_ As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected discardLeadingBytes As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected written As Integer
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

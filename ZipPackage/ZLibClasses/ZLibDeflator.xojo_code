#tag Class
Protected Class ZLibDeflator
Inherits ZLibStream
Implements IStreamWriter
	#tag Method, Flags = &h0
		Sub Constructor(writer as WriteProc, level as Integer = DEFAULT_COMPRESSION)
		  super.Constructor(writer)
		  
		  soft declare function deflateInit2_ lib libz_path (stream as Ptr, level as Integer, method as Integer, windowBits as Integer, memLevel as Integer, strategy as Integer, version as CString, stream_size as Integer) as Int32
		  
		  // See http://stackoverflow.com/a/38148423/43615
		  
		  const MAX_WBITS = 15 ' includes 2 byte prefix for "compression method and window size" and adds Adler checksum (4 byte Big Endian)
		  const MAX_WBITS_RAW = -15 ' without the prefix and Adler checksum
		  const DEF_MEM_LEVEL = 8
		  const Z_DEFAULT_STRATEGY = 0
		  
		  dim err as Integer
		  
		  err = deflateInit2_ (mStream, level, Z_DEFLATED, MAX_WBITS, DEF_MEM_LEVEL, Z_DEFAULT_STRATEGY, Version(), mStream.Size)
		  
		  if err <> 0 then
		    raise new ZLibStreamException (me, err)
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CRC() As Integer
		  return me.mCRC
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Deflate(input as Ptr, len as UInt32, flush as FlushCode, ByRef hint as Variant) As Boolean
		  soft declare function deflate lib libz_path (stream as Ptr, flush as Integer) as Int32
		  
		  if mCalcCRC and len > 0 then
		    mCRC = ZLibStream.CRC32(mCRC, input, len)
		  end
		  
		  me.z_next_in = input
		  me.z_avail_in = len
		  
		  dim result as Integer
		  do
		    me.z_next_out = mBuffer
		    me.z_avail_out = mBuffer.Size
		    
		    result = deflate (mStream, Integer(flush))
		    if result = Z_STREAM_ERROR then
		      raise new ZLibStreamException (me, result)
		    end
		    
		    dim written as UInt32 = mBuffer.Size - me.z_avail_out
		    if written > 0 then
		      if not mWriter.Invoke (mBuffer, written, hint) then
		        // cancelled
		        return false
		      end
		    end
		  loop until me.z_avail_out <> 0
		  
		  if me.z_avail_in <> 0 then
		    // Oops - not all input was consumed. This should never ever happen
		    raise new ZLibStreamException (me, 101)
		  end
		  
		  if flush = FlushCode.FINISH and result <> Z_STREAM_END then
		    // Oops - stream was not completed. This should never ever happen
		    raise new ZLibStreamException (me, 102)
		  end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  if IsZLibAvailable(false) then
		    soft declare sub deflateEnd lib libz_path (stream as Ptr)
		    
		    deflateEnd mStream
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableCRCCalculation()
		  mCalcCRC = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Finish()
		  dim v as Variant
		  call Deflate (nil, 0, FlushCode.FINISH, v)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  // Part of the IStreamWriter interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  soft declare sub deflateReset lib libz_path (stream as Ptr)
		  
		  deflateReset mStream
		  
		  super.Reset
		  
		  mCRC = 0
		  mCalcCRC = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(data as MemoryBlock)
		  dim v as Variant
		  call Deflate (data, data.Size, FlushCode.NO_FLUSH, v)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(data as String)
		  dim mb as MemoryBlock = data
		  Write mb
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This class is used to compress data into zlib compression format
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mCalcCRC As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCRC As UInt32
	#tag EndProperty


	#tag Constant, Name = BEST_COMPRESSION, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = BEST_SPEED, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DEFAULT_COMPRESSION, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NO_COMPRESSION, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


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

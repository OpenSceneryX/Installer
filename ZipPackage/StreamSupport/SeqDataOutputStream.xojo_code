#tag Interface
Protected Interface SeqDataOutputStream
	#tag Method, Flags = &h8
		Sub ClearError()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h8
		Function Close() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h8
		Function Flush() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h8
		Sub GetErrorDescription(ByRef code as Integer, ByRef msg as String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h8
		Function Open() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PreAllocate(count as UInt64)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h8
		Function Skip(count as UInt64) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h8
		Function Write(data as String) As Boolean
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		
		This Interface defines functions for sequentially writing data to
		binary streams.
		
		While it currently only defines one string-writing function, it could
		well be extended to support writing of all of RB's data types, such as
		WriteBoolean, WritePString, etc., just like the ones that the RB class
		BinaryStream contains.
	#tag EndNote

	#tag Note, Name = Documentation
		
		Open () as Boolean
		
		  If output stream goes to a file, the file will be created if it does not exist.
		
		  Shall be called once before any Write... calls. Shall return TRUE if
		  writing can continue, or FALSE if the output stream can't be written
		  to at all.
		
		Close () as Boolean
		
		  Shall be called after all Write... calls have been performed. Allows
		  the called to close the stream. The called should make a final check
		  that the former writes were successful and return FALSE if it turns
		  out that there was an error. Should return TRUE if it is assumed that
		  all data was written successfully.
		
		Write (data as String) as Boolean
		
		  Writes the string to the output stream. Returns FALSE if the write is
		  known to be unsuccessful, otherwise TRUE.
		
		  This means that the caller can't be 100% sure that the write was
		  successful, but he should stop sendin more data as soon as this
		  function returns FALSE.
		
		Skip (count as Integer) as Boolean
		
		  Similar to Write(), this will advance by the given amount of bytes
		  in the output stream, writing zeros or just changing the position
		  without overwriting any data. This means that in the case of a random
		  access file being the output of the stream, the skipped part may
		  still contain formerly written random data. The file must be extended
		  include the added amount, though.
		  
		  The returned Boolean value follows the same rules as in Write()
		
		Flush () as Boolean
		
		  Writes any outstanding data and checks that all data has been written
		  successfully - similar to Close, but without closing the stream.
		
		GetErrorDescription (ByRef code as Integer, ByRef msg as String)
		
		  If an error had occured since the call to Open, the called shall set
		  'code' to a non-zero value, and the 'msg' string to a descriptive
		  message that could be shown to a user (for debugging, mostly). It is
		  recommended to set 'code' to -1 to flag a "unspecific error". If no
		  error condition exists, 'code' shall be set to 0 and 'msg' to an empty
		  string.
		
		ClearError ()
		
		  Sets the error state to "no error"
	#tag EndNote


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
End Interface
#tag EndInterface

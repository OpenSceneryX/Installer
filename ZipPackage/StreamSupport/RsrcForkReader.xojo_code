#tag Class
Protected Class RsrcForkReader
Implements SeqDataInputStream
	#tag Method, Flags = &h21
		Private Function addPtr(mb as MemoryBlock, ofs as Integer) As MemoryBlock
		  dim helper as new MemoryBlock(8)
		  helper.Ptr(0) = mb
		  #if Target64Bit
		    helper.UInt64Value(0) = helper.UInt64Value(0)+ofs
		  #else
		    helper.UInt32Value(0) = helper.UInt32Value(0)+ofs
		  #endif
		  return helper.Ptr(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearError()
		  me.errCode = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  #if TargetMacOS
		    
		    dim res as Integer
		    
		    Declare Function FSCloseFork Lib CarbonLibName (refNum as Integer) as Integer
		    
		    if me.refnum <> 0 then
		      res = FSCloseFork(me.refnum) // we can quite safely ignore the result
		      me.refnum = 0
		    end
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem)
		  me.f = f
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  me.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EOF() As Boolean
		  return me.bytesRead >= me.length or me.refnum = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetErrorDescription(ByRef code As Integer, ByRef msg As String)
		  code = me.errCode
		  if me.errCode <> 0 then
		    msg = "open or read error ("+Str(me.errCode)+")"
		  else
		    msg = ""
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HadError() As Boolean
		  return me.errCode <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open() As Boolean
		  #if TargetMacOS
		    
		    Declare Sub FSGetResourceForkName Lib CarbonLibName (resourceForkName as Ptr)
		    Declare Function FSOpenFork Lib CarbonLibName (FSRef as Ptr, forkNameLength as Integer, forkName as Ptr, permissions as Byte, ByRef forkRefNum as Int16) as Integer
		    Declare Function FSCloseFork Lib CarbonLibName (refNum as Integer) as Integer
		    declare function FSGetForkSize Lib CarbonLibName (forkRefNum as Integer, ByRef v as Int64) as Integer
		    
		    if me.refnum <> 0 then
		      return true
		    end
		    
		    me.ClearError
		    me.refnum = 0
		    me.length = 0
		    me.bytesRead = 0
		    
		    dim rsrcName as new MemoryBlock(512)
		    FSGetResourceForkName (rsrcName)
		    
		    dim res as Integer
		    dim fsref as MemoryBlock
		    fsref = TTsFolderItem.FSRefOfFolderItem (f)
		    if fsref <> nil then
		      dim fileRef as Int16
		      res = FSOpenFork(fsref, rsrcName.Int16Value(0), addPtr(rsrcName,2), 0, fileRef)
		      if res = 0 then
		        dim len as Int64
		        res = FSGetForkSize (fileRef, len)
		        if res = 0 then
		          me.length = len
		          me.refnum = fileRef
		          return true
		        end
		        res = FSCloseFork(fileRef)
		      end
		    end
		    
		    me.errCode = res
		    return false
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(count As Integer) As String
		  #if TargetMacOS
		    
		    dim res, act, req as Integer
		    dim mb as MemoryBlock
		    
		    declare function FSReadFork Lib CarbonLibName (forkRefNum as Integer, positionMode as Integer, positionOffset as Int64, requestCount as Integer, buffer as Ptr, ByRef actualCount as Integer) as Integer
		    const fsAtMark = 0
		    const fsFromStart = 1
		    const fsFromLEOF = 2
		    const fsFromMark = 3
		    
		    // don't read if there has been an error before
		    if me.errCode <> 0 then
		      return ""
		    end
		    
		    if me.refnum = 0 then
		      raise new RuntimeException // did you forget to call Open()?
		    end
		    
		    // make sure we do not read more than what's left in the file
		    req = count
		    if me.bytesRead + req > me.length then
		      req = me.length - me.bytesRead
		    end
		    if req <= 0 then
		      return "" // EOF -- we've reached the end of file
		    end
		    
		    mb = new MemoryBlock(req) // a buffer to read the data into temporarily
		    if mb = nil then
		      raise new OutOfMemoryException
		    end
		    mb.LittleEndian = false
		    
		    res = FSReadFork (me.refnum, fsFromMark, 0, req, mb, act)
		    
		    if res = 0 and act <> req then
		      res = -1 // something went very wrong here, maybe due to a bug in this class
		    end
		    
		    if res < 0 then
		      me.errCode = res
		      return ""
		    end
		    
		    me.bytesRead = me.bytesRead + act
		    return mb.StringValue(0,act)
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Skip(count As UInt64) As Boolean
		  #if TargetMacOS
		    
		    dim res, req as Integer
		    
		    declare function FSSetForkPosition Lib CarbonLibName (forkRefNum as Integer, positionMode as Integer, positionOffset as Int64) as Integer
		    
		    // don't continue if there has been an error before
		    if me.errCode <> 0 then
		      return false
		    end
		    
		    if me.refnum = 0 then
		      raise new RuntimeException // did you forget to call Open()?
		    end
		    
		    // make sure we do not get behind the end of file
		    req =  count
		    if me.bytesRead + req > me.length then
		      // we would be behind the EOF - seek to EOF and return as failure
		      res = FSSetForkPosition(me.refnum, 1, me.length) // seeks from start of file
		      me.bytesRead = me.length
		      return false
		    end
		    
		    me.bytesRead = me.bytesRead + req
		    res = FSSetForkPosition(me.refnum, 1, me.bytesRead) // seeks from start of file
		    
		    if res < 0 then
		      me.errCode = res
		      return false
		    end
		    
		    return true
		    
		  #endif
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected bytesRead As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected errCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected f As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected length As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected refnum As Integer
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

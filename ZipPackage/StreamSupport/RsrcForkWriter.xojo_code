#tag Class
Protected Class RsrcForkWriter
Implements SeqDataOutputStream
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
		Function Close() As Boolean
		  #if TargetMacOS
		    
		    dim res as Integer
		    
		    Declare Function FSCloseFork Lib CarbonLibName (refNum as Integer) as Integer
		    
		    if me.refnum <> 0 then
		      res = FSCloseFork(me.refnum)
		      me.refnum = 0
		    end
		    
		    return me.errCode = 0 and res = 0
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem)
		  me.f = f
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  if me.Close then
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Flush() As Boolean
		  if me.refnum = 0 then
		    raise new RuntimeException // did you forget to call Open()?
		  end
		  return me.errCode = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetErrorDescription(ByRef code As Integer, ByRef msg As String)
		  code = me.errCode
		  if me.errCode <> 0 then
		    msg = "open or write error"
		  else
		    msg = ""
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Open() As Boolean
		  #if TargetMacOS
		    
		    Declare Sub FSGetResourceForkName Lib CarbonLibName (resourceForkName as Ptr)
		    Declare Function FSOpenFork Lib CarbonLibName (FSRef as Ptr, forkNameLength as Integer, forkName as Ptr, permissions as Byte, ByRef forkRefNum as Int16) as Integer
		    Declare Function FSCloseFork Lib CarbonLibName (refNum as Integer) as Integer
		    declare function FSSetForkSize Lib CarbonLibName (forkRefNum as Integer, posMode as Integer, v as Int64) as Integer
		    const fsAtMark = 0
		    const fsFromStart = 1
		    const fsFromLEOF = 2
		    const fsFromMark = 3
		    
		    if me.refnum <> 0 then
		      return true
		    end
		    
		    me.ClearError
		    me.refnum = 0
		    
		    dim rsrcName as new MemoryBlock(512)
		    FSGetResourceForkName (rsrcName)
		    
		    dim res as Integer
		    dim fsref as MemoryBlock
		    fsref = TTsFolderItem.FSRefOfFolderItem (f)
		    if fsref <> nil then
		      dim fileRef as Int16
		      res = FSOpenFork(fsref, rsrcName.Int16Value(0), addPtr(rsrcName,2), 0, fileRef)
		      if res = 0 then
		        res = FSSetForkSize(fileRef, fsFromStart, 0)
		        if res = 0 then
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
		Sub PreAllocate(count as UInt64)
		  // here we could pre-allocate the length of the file
		  
		  #pragma unused count
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Skip(count As UInt64) As Boolean
		  #if TargetMacOS
		    
		    dim res as Integer, pos as Int64
		    
		    declare function FSSetForkPosition Lib CarbonLibName (forkRefNum as Integer, positionMode as Integer, positionOffset as Int64) as Integer
		    declare function FSGetForkPosition Lib CarbonLibName (forkRefNum as Integer, ByRef positionOffset as Int64) as Integer
		    
		    if me.errCode <> 0 then
		      return false
		    end
		    
		    if me.refnum = 0 then
		      raise new RuntimeException // did you forget to call Open()?
		    end
		    
		    res = FSGetForkPosition(me.refnum, pos)
		    if res = 0 then
		      res = FSSetForkPosition(me.refnum, 1, pos +  count)
		      if res = 0 then
		        return true
		      end
		    end
		    
		    me.errCode = res
		    return false
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Write(data As String) As Boolean
		  #if TargetMacOS
		    
		    dim res, act, req as Integer
		    dim mb as MemoryBlock
		    
		    Declare Function FSWriteFork Lib CarbonLibName (refNum as Integer, posMode as Integer, posOfs as Int64, req as Integer, buffPtr as Ptr, ByRef count as Integer) as Integer
		    const fsAtMark = 0
		    const fsFromStart = 1
		    const fsFromLEOF = 2
		    const fsFromMark = 3
		    
		    // don't write if there has been an error before
		    if me.errCode <> 0 then
		      return false
		    end
		    
		    if me.refnum = 0 then
		      raise new RuntimeException // did you forget to call Open()?
		    end
		    
		    req = LenB(data)
		    
		    mb = new MemoryBlock(req) // a temp buffer to write the data from
		    if mb = nil then
		      raise new OutOfMemoryException
		    end
		    mb.StringValue(0,req) = data
		    
		    res = FSWriteFork (me.refnum, fsFromMark, 0, req, mb, act)
		    
		    if res = 0 and act <> req then
		      res = -1 // something went very wrong here, maybe due to a bug in this class
		    end
		    
		    if res < 0 then
		      me.errCode = res
		      return false
		    end
		    
		    return true
		    
		  #endif
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected errCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected f As FolderItem
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

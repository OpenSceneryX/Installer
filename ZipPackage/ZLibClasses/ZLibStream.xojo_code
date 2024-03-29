#tag Class
Protected Class ZLibStream
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  // You can not use this class directly - you need to use ZLibInflator or ZLibDeflator!
		  
		  mStream = NewZStream()
		  
		  call IsZLibAvailable(true) // raises exception if zlib not available
		  
		  mBuffer = new MemoryBlock (&h10000) // This size is arbitrary. Feel free to change it
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(writer as WriteProc)
		  me.Constructor()
		  mWriter = writer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CRC32(mb as MemoryBlock) As UInt32
		  return crc32 (crc32(0,nil,0), mb, mb.Size)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CRC32(crc as UInt32, buf as Ptr, len as UInt32) As UInt32
		  call IsZLibAvailable(true)
		  
		  soft declare function crc32x lib libz_path alias "crc32" (crc as UInt32, buf as Ptr, len as UInt32) as UInt32
		  
		  return crc32x (crc, buf, len)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function IsZLibAvailable(raiseExceptionIfNotAvail as Boolean = false) As Boolean
		  if gLibAvailable then return true
		  
		  if not gLibChecked then
		    gLibChecked = true
		    gLibAvailable = System.IsFunctionAvailable ("zlibVersion", libz_path)
		    if not gLibAvailable then
		      System.DebugLog ("ZLibStream fatal error: zlib library is missing at "+libz_path)
		    end
		  end if
		  if not gLibAvailable and raiseExceptionIfNotAvail then
		    raise new ZLibStreamException (nil, -1)
		  end if
		  return gLibAvailable
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Message() As String
		  #if Target32Bit
		    return mStream.CString(24)
		  #elseif TargetMacOS or TargetLinux
		    return mStream.CString(48)
		  #else // -> TargetWindows and Target64Bit
		    return mStream.CString(32)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function NewZStream() As MemoryBlock
		  #if Target32Bit
		    return new MemoryBlock (z_stream_s_32.Size)
		  #elseif TargetMacOS or TargetLinux
		    return new MemoryBlock (z_stream_s_64.Size)
		  #else // -> TargetWindows and Target64Bit
		    return new MemoryBlock (z_stream_s_Win64.Size)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Reset()
		  me.z_avail_in = 0
		  me.z_avail_out = 0
		  me.z_total_in = 0
		  me.z_total_out = 0
		  me.z_next_in = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Version() As String
		  // Returns the version of the used zlib code.
		  // Returns an empty string if the zlib library (DLL) is not available
		  
		  if IsZLibAvailable(false) then
		    soft declare function zlibVersion lib libz_path () as CString
		    return zLibVersion
		  end if
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Function WriteProc(buf as Ptr, len as UInt32, ByRef hint as Variant) As Boolean
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Sub _SelfTest()
		  // does some tests to verify that it works
		  
		  #if RBVersion < 2016.0
		    const kTargetHasGUI = TargetHasGUI
		  #else
		    const kTargetHasGUI = TargetDesktop
		  #endif
		  
		  if IsZLibAvailable(false) then
		    
		    System.DebugLog "ZLib version: " + Version
		    
		    dim zd as new ZLibDeflator (AddressOf _SelfTestWriter, 9)
		    dim zi as new ZLibInflator (AddressOf _SelfTestWriter)
		    
		    dim v as Variant
		    dim sin as MemoryBlock
		    
		    // Compress using Deflate() in two parts:
		    sin = "abcd"
		    if not zd.Deflate (sin, sin.Size, ZLibStream.FlushCode.NO_FLUSH, v) then
		      #if kTargetHasGUI
		        MsgBox "Deflate 1 failed"
		      #else
		        break
		      #endif
		    end
		    sin = "ef"
		    if not zd.Deflate (sin, sin.Size, ZLibStream.FlushCode.FINISH, v) then
		      #if kTargetHasGUI
		        MsgBox "Deflate 2 failed"
		      #else
		        break
		      #endif
		    end
		    
		    // Uncompress using Inflate() in two parts:
		    dim l as UInt32, f as Boolean
		    dim compressedData as String = v.StringValue
		    sin = compressedData.LeftB(5)
		    v = ""
		    if not zi.Inflate (sin, sin.Size, l, f, v) or f then
		      #if kTargetHasGUI
		        MsgBox "Inflate 1 failed"
		      #else
		        break
		      #endif
		    end
		    if v <> "ab" then
		      #if kTargetHasGUI
		        MsgBox "Inflate 1 - wrong data"
		      #else
		        break
		      #endif
		    end
		    // second and last part...
		    sin = compressedData.MidB(6)
		    if not zi.Inflate (sin, sin.Size, l, f, v) or not f then
		      #if kTargetHasGUI
		        MsgBox "Inflate 2 failed"
		      #else
		        break
		      #endif
		    end
		    if v <> "abcdef" then
		      #if kTargetHasGUI
		        MsgBox "Inflate 2 - wrong data"
		      #else
		        break
		      #endif
		    end
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function _SelfTestWriter(buf as Ptr, len as UInt32, ByRef hint as Variant) As Boolean
		  dim s as String = hint
		  dim mb as MemoryBlock = buf
		  s = s + mb.StringValue(0,len)
		  hint = s
		  return true
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is a base class for ZLibDeflator and ZLibInflator, to perform zlib
		compression and decompression.
		
		For docs on the used zlib functions see: http://www.zlib.net/manual.html
		
	#tag EndNote

	#tag Note, Name = Read here for MS Windows
		While Mac OS X and Linux already have the necessary zlib-library installed,
		you will need to get it separately for use with Windows.
		
		--- When building a 32 bit application ---
		
		Get the DLL from here: http://www.zlib.net/ (download the "zlib compiled DLL")
		Then copy the zlib1.dll file to your app's "Libs" folder or next to the .exe file.
		
		--- When building a 64 bit application ---
		
		Get a 64 bit version of the zlib DLL for Windows and place it into your app's "Libs" folder
		or next to the .exe file. It should be named "zlib1.dll".
		
		You can build your own following these instructions:
		http://stackoverflow.com/questions/24118729/vs2013-c-link-compiled-zlib-dll-to-x64-processes
		
		Or download a pre-built version from my server:
		http://files.tempel.org/zlib/Windows_64bit/
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private Shared gLibAvailable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared gLibChecked As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mBuffer As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mStream As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mWriter As WriteProc
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  #if Target32Bit
			    return mStream.UInt32Value(4)
			  #else
			    return mStream.UInt32Value(8)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target32Bit
			    mStream.UInt32Value(4) = value
			  #else
			    mStream.UInt32Value(8) = value
			  #endif
			End Set
		#tag EndSetter
		Protected z_avail_in As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  #if Target32Bit
			    return mStream.UInt32Value(16)
			  #elseif TargetMacOS or TargetLinux
			    return UInt32(mStream.UInt32Value(32))
			  #else // -> TargetWindows and Target64Bit
			    return mStream.UInt32Value(24)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target32Bit
			    mStream.UInt32Value(16) = value
			  #elseif TargetMacOS or TargetLinux
			    mStream.UInt32Value(32) = value
			  #else // -> TargetWindows and Target64Bit
			    mStream.UInt32Value(24) = value
			  #endif
			End Set
		#tag EndSetter
		Protected z_avail_out As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  return mStream.Ptr(0)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mStream.Ptr(0) = value
			End Set
		#tag EndSetter
		Protected z_next_in As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  #if Target32Bit
			    return mStream.Ptr(12)
			  #elseif TargetMacOS or TargetLinux
			    return mStream.Ptr(24)
			  #else // -> TargetWindows and Target64Bit
			    return mStream.Ptr(16)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target32Bit
			    mStream.Ptr(12) = value
			  #elseif TargetMacOS or TargetLinux
			    mStream.Ptr(24) = value
			  #else // -> TargetWindows and Target64Bit
			    mStream.Ptr(16) = value
			  #endif
			End Set
		#tag EndSetter
		Protected z_next_out As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  #if Target32Bit
			    return mStream.UInt32Value(8)
			  #elseif TargetMacOS or TargetLinux
			    return CType (mStream.UInt64Value(16), UInt32)
			  #else // -> TargetWindows and Target64Bit
			    return mStream.UInt32Value(12)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target32Bit
			    mStream.UInt32Value(8) = value
			  #elseif TargetMacOS or TargetLinux
			    mStream.UInt64Value(16) = value
			  #else // -> TargetWindows and Target64Bit
			    mStream.UInt32Value(12) = value
			  #endif
			End Set
		#tag EndSetter
		Protected z_total_in As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  #if Target32Bit
			    return mStream.UInt32Value(20)
			  #elseif TargetMacOS or TargetLinux
			    return CType (mStream.UInt64Value(40), UInt32)
			  #else // -> TargetWindows and Target64Bit
			    return mStream.UInt32Value(28)
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target32Bit
			    mStream.UInt32Value(20) = value
			  #elseif TargetMacOS or TargetLinux
			    mStream.UInt64Value(40) = value
			  #else // -> TargetWindows and Target64Bit
			    mStream.UInt32Value(28) = value
			  #endif
			End Set
		#tag EndSetter
		Protected z_total_out As UInt32
	#tag EndComputedProperty


	#tag Constant, Name = Header1, Type = Double, Dynamic = False, Default = \"&h78", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Header2, Type = Double, Dynamic = False, Default = \"&h9C", Scope = Public
	#tag EndConstant

	#tag Constant, Name = libz_path, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"zlib1.dll"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"/usr/lib/libz.dylib"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"libz.so.1"
	#tag EndConstant

	#tag Constant, Name = Z_DATA_ERROR, Type = Double, Dynamic = False, Default = \"-3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Z_DEFLATED, Type = Double, Dynamic = False, Default = \"8", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Z_NEED_DICT, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Z_STREAM_END, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Z_STREAM_ERROR, Type = Double, Dynamic = False, Default = \"-2", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = z_stream_s_32, Flags = &h1, CompatibilityFlags = Target32Bit, Attributes = \"StructureAlignment \x3D 1"
		next_in as Ptr
		  avail_in as UInt32
		  total_in as UInt32
		  next_out as Ptr
		  avail_out as UInt32
		  total_out as UInt32
		  msg as CString
		  state as Ptr
		  zalloc as Ptr
		  zfree as Ptr
		  opaque as UInt32
		  data_type as UInt32
		  adler as UInt32
		reserved as UInt32
	#tag EndStructure

	#tag Structure, Name = z_stream_s_64, Flags = &h1, CompatibilityFlags = Target64Bit, Attributes = \"StructureAlignment \x3D 1"
		next_in as UInt64
		  avail_in as UInt32
		  pad1 as Int32
		  total_in as UInt64
		  next_out as UInt64
		  avail_out as UInt32
		  pad2 as Int32
		  total_out as UInt64
		  msg as UInt64
		  state as UInt64
		  zalloc as UInt64
		  zfree as UInt64
		  opaque as UInt64
		  data_type as UInt32
		  pad3 as Int32
		  adler as UInt64
		reserved as UInt64
	#tag EndStructure

	#tag Structure, Name = z_stream_s_Win64, Flags = &h1, CompatibilityFlags = Target64Bit, Attributes = \"StructureAlignment \x3D 1"
		next_in as UInt64
		  avail_in as UInt32
		  total_in as UInt32
		  next_out as UInt64
		  avail_out as UInt32
		  total_out as UInt32
		  msg as UInt64
		  state as UInt64
		  zalloc as UInt64
		  zfree as UInt64
		  opaque as UInt64
		  data_type as UInt32
		  adler as UInt32
		  reserved as UInt32
		padding as Int32
	#tag EndStructure


	#tag Enum, Name = FlushCode, Type = Integer, Flags = &h0
		NO_FLUSH
		  PARTIAL_FLUSH
		  SYNC_FLUSH
		  FULL_FLUSH
		  FINISH
		BLOCK
	#tag EndEnum


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

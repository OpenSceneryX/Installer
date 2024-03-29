#tag Class
Protected Class TTsFolderItem
Inherits FolderItem
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  super.Constructor
		  mNeedsUpdate = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(source As FolderItem)
		  super.Constructor (source)
		  mNeedsUpdate = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor(Path As String, pathMode As Integer=0)
		  super.Constructor (Path, pathMode)
		  mNeedsUpdate = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor(original As TTsFolderItem)
		  super.Constructor (original)
		  me.updateFrom original
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSymlink(to_path as String)
		  #if TargetMacOS or TargetLinux
		    if mNeedsUpdate then me.update
		    declare function symlink lib SystemLib (link as CString, path as CString) as Integer
		    dim res as Integer
		    res = symlink (to_path, mPath)
		    if res <> 0 then
		      dim n as Integer = errno()
		      break
		      LastErrorCode = n // Boo! This doesn't even work. So we have no way to set the LastErrorCode, unfortunately, until RS fixes this (feedback ID #11511)
		    else
		      LastErrorCode = 0
		    end
		    mNeedsUpdate = true
		  #else
		    LastErrorCode = 12368 // this is just a randomly chosen error code
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete()
		  // TTsFolderItem.Delete deletes symlinks, not their targets
		  if IsSymlink then // invokes me.update() if necessary
		    soft declare function unlink lib SystemLib (path as CString) as Integer
		    try
		      call unlink (mPath)
		    catch
		      break // oops!
		    end
		  else
		    super.Delete
		  end
		  mNeedsUpdate = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function errno() As Integer
		  #if TargetMacOS
		    declare function __error lib SystemLib () as Ptr
		    dim mb as MemoryBlock = __error()
		    return mb.Int32Value(0)
		  #elseif TargetLinux
		    declare function __errno_location lib SystemLib () as Ptr
		    dim mb as MemoryBlock = __errno_location()
		    return mb.Int32Value(0)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Exists() As Boolean
		  #if not (TargetLinux or TargetMacOS)
		    return FolderItem(self).Exists
		  #else
		    // Due to a bug in RB/Xojo we cannot rely on FolderItem.Exists to work with Symlinks, so we'll do our own test
		    // See <feedback://showreport?report_id=27683>
		    if mNeedsUpdate then
		      self.update ' checks for existence and sets mNeedsUpdate to false when it exists
		      return not mNeedsUpdate 
		    else
		      // now mPath contains the POSIX path to the file
		      #if TargetMacOS
		        // check for existence of the file using the stat function
		        declare function stat lib SystemLib (path as CString, dataOut as Ptr) as Integer
		        static stat as new MemoryBlock(512)
		        dim good as Boolean = stat (mPath, stat) = 0
		        return good
		      #else // Linux
		        // check for existence of the file using the lxstat function
		        #if Target32Bit
		          declare function __lxstat lib SystemLib (stat_ver as Integer, path as CString, ByRef dataOut as unix_stat_struct_linux_32) as Integer
		          dim stat as unix_stat_struct_linux_32
		          dim good as Boolean = __lxstat (3, mPath, stat) = 0
		        #else
		          declare function __lxstat lib SystemLib (stat_ver as Integer, path as CString, ByRef dataOut as unix_stat_struct_linux_64) as Integer
		          dim stat as unix_stat_struct_linux_64
		          dim good as Boolean = __lxstat (3, mPath, stat) = 0
		        #endif
		        return good
		      #endif
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FSRefMakePath(ref as MemoryBlock) As String
		  #if TargetMacOS
		    declare function FSRefMakePath lib CarbonLibName (ref as Ptr, path as Ptr, maxSize as Integer) as Integer
		    
		    if ref = nil then
		      break
		      return ""
		    end
		    
		    dim mb as new MemoryBlock(PATH_MAX)
		    dim err as Integer
		    
		    err = FSRefMakePath (ref, mb, mb.Size)
		    if err = 0 then
		      return mb.CString(0).DefineEncoding(Encodings.UTF8)
		    end
		  #else
		    // Must not call from Windows or Linux!
		    break
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function FSRefOfFolderItem(f as FolderItem) As MemoryBlock
		  // returns NIL if the FolderItem does not exist
		  
		  // Must not call any more
		  break
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetMacType(f as FolderItem) As String
		  // Note: If you do not need support for the old 4-letter MacType codes, and if you do not like
		  // getting the deprecation warning here, simply set the kUseMacType constant to FALSE
		  #If kUseMacType Then
		    
		    Return f.MacType
		    
		  #else
		    
		    #pragma unused f
		    Static NullType As String = New MemoryBlock(4)
		    return NullType
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsMacAlias() As Boolean
		  if mNeedsUpdate then me.update
		  return mIsAlias
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSymlink() As Boolean
		  if mNeedsUpdate then me.update
		  return mIsSymlink
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Length() As UInt64
		  #if TargetLinux
		    if mNeedsUpdate then me.update
		    return mLength
		  #else
		    return FolderItem(me).Length
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NativePath(f as FolderItem) As String
		  // Returns a POSIX path (such as "/usr/bin/ls") on OS X and Linux.
		  #if RBVersion >= 2013
		    return f.NativePath
		  #elseif TargetMacOS
		    dim ref as MemoryBlock = FSRefOfFolderItem(f)
		    dim path as String
		    if ref <> nil then
		      path = FSRefMakePath (ref)
		    end
		    if path = "" then
		      // file does not exist - create the path from the parent and the name
		      path = NativePath (f.Parent)
		      if path <> "" then
		        path = path + "/" + f.Name
		      end if
		    end
		    return path
		  #else
		    return f.AbsolutePath.ConvertEncoding(Encodings.UTF8)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SameFolderItem(f1 as FolderItem, f2 as FolderItem) As Boolean
		  if f1 = f2 then
		    return true
		  elseif (f1 = nil) or (f2 = nil) then
		    return false
		  end
		  
		  #if RBVersion >= 2013
		    return StrComp (f1.NativePath, f2.NativePath, 0) = 0
		  #else
		    return StrComp (f1.AbsolutePath, f2.AbsolutePath, 0) = 0
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub SetMacType(f as FolderItem, t as String)
		  // Note: If you do not need support for the old 4-letter MacType codes, and if you do not like
		  // getting the deprecation warning here, simply set the kUseMacType constant to FALSE
		  #if kUseMacType then
		    
		    f.MacType = t
		    
		  #else
		    
		    #pragma unused f
		    #pragma unused t
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetUnixPermissions(perm as UInt16)
		  perm = Bitwise.BitAnd (perm, &o7777) // mask out the upper 4 bits of the "st_mode" (UnixStatMode)
		  
		  #if TargetMacOS or TargetLinux
		    soft declare function lchmod lib SystemLib (path as CString, flags as Integer) as Integer
		    declare function chmod lib SystemLib (path as CString, flags as Integer) as Integer
		    
		    static has_lchmod as Boolean = true // initially, we assume that it exists (which it doesn't on OSX 10.4)
		    
		    dim res as Integer
		    
		    if has_lchmod then
		      try
		        res = lchmod (mPath, perm)
		      catch
		        break
		        has_lchmod = false
		      end
		    end
		    if not has_lchmod then
		      // fall back to "chmod", which is the same as lchmod as long as it's not a symlink it operates on
		      if IsSymlink then
		        // ignore this case, meaning we won't change the permissions on a symlink on OSX 10.4.x
		      else
		        res = chmod (mPath, perm)
		      end
		    end
		    if res <> 0 then
		      LastErrorCode = errno()
		    else
		      LastErrorCode = 0
		    end
		    mNeedsUpdate = true
		  #else
		    LastErrorCode = 12367 // this is just a randomly chosen error code
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnixPath() As String
		  if mNeedsUpdate then me.update
		  return mPath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnixPermissions() As UInt16
		  return Bitwise.BitAnd (me.UnixStatMode, &o7777) // blank out the upper 4 bits of the st_mode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function UnixPermissions(f as FolderItem, ByRef perm as Integer) As Integer
		  #pragma unused f
		  #pragma unused perm
		  
		  // obsolete - use UnixStatMode instead
		  '#if TargetMacOS
		  'dim ref as MemoryBlock = FSRefOfFolderItem(f) // need to keep the ref until we've made the calls!
		  'dim pb, info as MemoryBlock, err as Integer
		  'declare function PBGetCatalogInfoSync lib CarbonLibName (paramBlock as Ptr) as short
		  'info = new MemoryBlock(144) // FSCatalogInfo
		  'pb = new MemoryBlock(72) // FSRefParam
		  'pb.Ptr(28) = ref
		  'pb.UInt32Value(32) = &H0400 // FSCatalogInfoBitmap: permissions
		  'pb.Ptr(36) = info
		  'err = PBGetCatalogInfoSync(pb)
		  'if err = 0 then
		  'perm = info.UInt16Value(56+8+2)
		  'else
		  'break
		  'perm = 0
		  'end
		  'return err
		  '#endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnixStatMode() As UInt16
		  // contains permissions, amoung other infos
		  if mNeedsUpdate then me.update
		  return mMode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub update()
		  LastErrorCode = 0
		  mPath = NativePath(me)
		  
		  // detect symlinks (Linux, OSX only)
		  #if TargetMacOS
		    
		    #if false
		      // Oddly, 64 builds do not use the 64 bit struct's order but the the old order, so this doesn't work in 64 bit builds:
		      'declare function lstat lib SystemLib (path as CString, ByRef dataOut as unix_stat_struct_osx) as Integer
		      'dim stat as unix_stat_struct_osx
		      '#if Target64Bit
		      'if stat.Size <> 144 then raise new RuntimeException
		      '#endif
		      'if lstat (mPath, stat) <> 0 then
		      '// file does not exist
		      'LastErrorCode = errno()
		      '// leave mNeedsUpdate=true so we get the other info once the file got created
		      'return
		      'end
		      'mMode = stat.Mode
		    #else
		      // Instead, we use a simpler method:
		      dim stat as new MemoryBlock(144)
		      declare function lstat lib SystemLib (path as CString, dataOut as Ptr) as Integer
		      if lstat (mPath, stat) <> 0 then
		        // file does not exist
		        LastErrorCode = errno()
		        // leave mNeedsUpdate=true so we get the other info once the file got created
		        return
		      end
		      mMode = stat.UInt16Value(8)
		    #endif
		    
		    mIsSymlink = (mMode and &o0170000) = &o0120000
		  #elseif TargetLinux
		    #if Target32Bit
		      declare function __lxstat lib SystemLib (stat_ver as Integer, path as CString, ByRef dataOut as unix_stat_struct_linux_32) as Integer
		      dim stat as unix_stat_struct_linux_32
		      if __lxstat (3, mPath, stat) <> 0 then
		        // file does not exist
		        LastErrorCode = errno()
		        // leave mNeedsUpdate=true so we get the other info once the file got created
		        return
		      end
		      mMode = stat.Mode
		      mLength = stat.fsize // needed to work around a bug in RB (2010r1) that gives wrong Length for symlinks
		      mIsSymlink = (mMode and &o0170000) = &o0120000
		    #else
		      declare function __lxstat lib SystemLib (stat_ver as Integer, path as CString, ByRef dataOut as unix_stat_struct_linux_64) as Integer
		      dim stat as unix_stat_struct_linux_64
		      if __lxstat (3, mPath, stat) <> 0 then
		        // file does not exist
		        LastErrorCode = errno()
		        // leave mNeedsUpdate=true so we get the other info once the file got created
		        return
		      end
		      mMode = stat.Mode
		      mLength = stat.fsize // needed to work around a bug in RB (2010r1) that gives wrong Length for symlinks
		      mIsSymlink = (mMode and &o0170000) = &o0120000
		    #endif
		  #else
		    if not FolderItem(self).Exists then
		      // leave mNeedsUpdate=true so we get the other info once the file got created
		      return
		    end if
		  #endif
		  
		  if not mIsSymlink then
		    mIsAlias = me.Alias
		  end
		  
		  mNeedsUpdate = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub updateFrom(f as TTsFolderItem)
		  break // Hey you - double check that this code copies every propery! Then you may remove the break here
		  mIsAlias = f.mIsAlias
		  mIsSymlink = f.mIsSymlink
		  mLength = f.mLength
		  mNeedsUpdate = f.mNeedsUpdate
		  mMode = f.mMode
		  mPath = f.mPath
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function UpdateUnixPermissions(f as FolderItem, perm_and as Integer, perm_or as Integer) As Integer
		  #pragma unused f
		  #pragma unused perm_or
		  #pragma unused perm_and
		  
		  // obsolete - use UnixStatMode instead
		  '#if TargetMacOS
		  '
		  'Dim pb, info as MemoryBlock, err as Integer
		  '
		  'Declare Function PBSetCatalogInfoSync Lib CarbonLibName (paramBlock as Ptr) as Short
		  'Declare Function PBGetCatalogInfoSync Lib CarbonLibName (paramBlock as Ptr) as Short
		  '
		  'dim ref as MemoryBlock = FSRefOfFolderItem(f) // need to keep the ref until we've made the calls!
		  '
		  'info = new MemoryBlock(144) // FSCatalogInfo
		  '
		  'pb = new MemoryBlock(72) // FSRefParam
		  'pb.Ptr(28) = ref
		  'pb.UInt32Value(32) = &H0400 // FSCatalogInfoBitmap: permissions
		  'pb.Ptr(36) = info
		  '
		  'err = PBGetCatalogInfoSync(pb) // it's a field of 16 bytes, so we need to read them first
		  'if err = 0 then
		  'dim perm_current as Integer = BitwiseAnd(perm_and, info.UInt16Value(56+8+2))
		  'info.UInt16Value(56+8+2) = BitwiseOr(perm_or, perm_current)
		  'err = PBSetCatalogInfoSync(pb)
		  'else
		  '// fails on symlinks!
		  'break
		  'end
		  '
		  'return err
		  '#endif
		End Function
	#tag EndMethod


	#tag Note, Name = Figuring out the struct sizes
		// Save as "stat_sizes.c", compile with "cc stat_sizes.c", run with "./a.out":
		#include <stddef.h>
		#include <stdio.h>
		#include <stdlib.h>
		#include <sys/stat.h>
		typedef struct stat thestruct;    /* change "struct stat" to the struct type you want to explore */
		#define member_size(type, member) sizeof(((type *)0)->member)
		#define check(member) printf(#member": %ld, %ld\n", (long) offsetof(thestruct, member), member_size(thestruct, member))
		int main(void) {
		    printf("sizeof(thestruct): %ld\n", (long) sizeof(thestruct));
		    check(st_dev);    /* change this and following lines to list all the struct members */
		    check(st_ino);
		    check(st_nlink);
		    check(st_mode);
		    check(st_uid);
		    check(st_gid);
		    check(st_rdev);
		    check(st_size);
		    check(st_blksize);
		    check(st_blocks);
		    check(st_atime);
		    check(st_mtime);
		    check(st_ctime);
		    return 0;
		}
		/* Output on Linux 64 bit:
		sizeof(thestruct): 144
		st_dev: 0, 8
		st_ino: 8, 8
		st_nlink: 16, 8
		st_mode: 24, 4
		st_uid: 28, 4
		st_gid: 32, 4
		st_rdev: 40, 8
		st_size: 48, 8
		st_blksize: 56, 8
		st_blocks: 64, 8
		st_atime: 72, 8
		st_mtime: 88, 8
		st_ctime: 104, 8
		*/
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mIsAlias As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsSymlink As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLength As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMode As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNeedsUpdate As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPath As String
	#tag EndProperty


	#tag Constant, Name = kFSVolInfoNone, Type = Double, Dynamic = False, Default = \"&h0000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUseMacType, Type = Boolean, Dynamic = False, Default = \"False", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = unix_stat_struct_linux_32, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		dev as Int64
		  res1 as UInt32
		  ino as UInt32
		  mode as UInt32
		  nlink as UInt32
		  uid as UInt32
		  gid as UInt32
		  rdev as UInt64
		  res2 as UInt32
		  fsize as UInt32
		  blksize as UInt32
		  blocks as UInt32
		  atime as UInt32
		  atimesec as UInt32
		  mtime as UInt32
		  mtimesec as UInt32
		  ctime as UInt32
		  ctimesec as UInt32
		res3 as UInt64
	#tag EndStructure

	#tag Structure, Name = unix_stat_struct_linux_64, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		dev as Int64
		  ino as UInt64
		  nlink as UInt64
		  mode as UInt32
		  uid as UInt32
		  gid as UInt32
		  res1 as UInt32
		  rdev as UInt64
		  fsize as UInt64
		  blksize as UInt64
		  blocks as UInt64
		  atime as UInt64
		  atimesec as UInt64
		  mtime as UInt64
		  mtimesec as UInt64
		  ctime as UInt64
		  ctimesec as UInt64
		res3 as String*24
	#tag EndStructure

	#tag Structure, Name = unix_stat_struct_osx, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target64Bit)), Attributes = \"StructureAlignment \x3D 16"
		dev as Int32
		  mode as UInt16
		  nlink as UInt16
		  ino as UInt64
		  uid as UInt32
		  gid as UInt32
		  rdev as UInt32
		  atime as UInt64
		  atimesec as UInt64
		  mtime as UInt64
		  mtimesec as UInt64
		  ctime as UInt64
		  ctimesec as UInt64
		  birthtime as UInt64
		  birthtimesec as UInt64
		  fsize as UInt64
		  blocks as UInt64
		  blksize as UInt32
		  flags as UInt32
		  gen as UInt32
		  lspare as UInt32
		  qspare1 as UInt64
		qspare2 as UInt64
	#tag EndStructure

	#tag Structure, Name = unix_stat_struct_osx, Flags = &h0, CompatibilityFlags = (TargetDesktop and (Target32Bit)), Attributes = \"StructureAlignment \x3D 1"
		dev as Int32
		  ino as UInt32
		  mode as UInt16
		  nlink as UInt16
		  uid as UInt32
		  gid as UInt32
		  rdev as UInt32
		  atime as UInt32
		  atimesec as UInt32
		  mtime as UInt32
		  mtimesec as UInt32
		  ctime as UInt32
		  ctimesec as UInt32
		  fsize as UInt64
		  blocks as UInt64
		  blksize as UInt32
		  flags as UInt32
		  gen as UInt32
		  lspare as UInt32
		  qspare1 as UInt64
		qspare2 as UInt64
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="IsFolder"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsAlias"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NativePath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Length"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Uint64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExtensionVisible"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Locked"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Exists"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsReadable"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsWriteable"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShellPath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="URLPath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Group"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Owner"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

#tag Class
Protected Class ZipEntry
Inherits ZipEntryBase
	#tag Method, Flags = &h0
		Sub ApplyMacBinaryInformation(f as FolderItem, mbHdr as MemoryBlock)
		  // You may use this function after calling Extract(outputStream as BinaryStream)
		  //   in order to update your extracted file's Type, Creator and other Finder information.
		  //  This call has even a little effect under Windows OS: If the MacBinary header
		  //   specifies that the item was invisible (hidden), or read-only, these attributes
		  //   will be applied under Windows to the file, too.
		  //
		  // Parameters:
		  //   f: the file or folder you want the MB information applied to
		  //   mbHdr: the MacBinary header. Retrieve it by calling GetMacBinaryHeader(mbHdr)
		  //
		  // Preconditions:
		  // - f.Exists = true
		  // - mbHdr <> nil
		  
		  if not f.Exists or mbHdr = nil then
		    return
		  end
		  
		  mbHdr.LittleEndian = false
		  
		  // !TT 21Jun05 - Fixed setting of creation date. For some strange reason one cannot modify the TotalSeconds property of f.CreationDate directly but must use an interim Date object for this
		  if mbHdr.UInt32Value(95) <> 0 then
		    dim date1, date2 as Date
		    date1 = new Date
		    date2 = new Date
		    date1.TotalSeconds = z_ulongToDouble(mbHdr.UInt32Value(91)) // creation date
		    date2.TotalSeconds = z_ulongToDouble(mbHdr.UInt32Value(95)) // modification date
		    try
		      #pragma BreakOnExceptions off
		      f.CreationDate = date1
		      #pragma BreakOnExceptions default
		    catch exc as RuntimeException
		      ' On Linux, Xojo raises an UnsupportedOperationException here, so let's silently ignore it
		    end
		    f.ModificationDate = date2
		  end
		  
		  z_adjustMacFilename mbHdr.PString(1), mbHdr.Byte(106), f
		  
		  #if TargetMacOS
		    
		    if not f.Directory and mbHdr.UInt64Value(65) <> 0 then
		      TTsFolderItem.SetMacType f, mbHdr.StringValue(65,4)
		    end
		    
		    ///////////////////////////
		    // apply FInfo + FXInfo
		    
		    declare Function FSGetCatalogInfo Lib CarbonLibName (ref as Ptr, whichInfo as Integer, catInfo as Ptr, name as Ptr, spec as Ptr, parent as Ptr) as Integer
		    declare Function FSSetCatalogInfo Lib CarbonLibName (ref as Ptr, whichInfo as Integer, catInfo as Ptr) as Integer
		    
		    dim res as Integer
		    dim fsref, catInfo as MemoryBlock
		    fsref = TTsFolderItem.FSRefOfFolderItem (f)
		    catInfo = new MemoryBlock(144)
		    if catInfo = nil then
		      raise new OutOfMemoryException
		    end
		    res = FSGetCatalogInfo (fsref, &H1800, catInfo, nil, nil, nil) // whichInfo: FXInfo, FInfo
		    if res <> 0 then
		      break
		    else
		      dim v as Integer
		      v = BitwiseAnd(&HFF-&H11,mbHdr.Byte(73)) // FInfo.fdFlags (hi), but clear "hasBeenInited" and "nameLocked" flags
		      v = Bitwise.ShiftLeft (v, 8) + mbHdr.Byte(101) // FInfo.fdFlags (lo)
		      catInfo.UInt16Value(32+8) = v // FInfo.fdFlags (PPC- and Intel-savvy)
		      catInfo.UInt16Value(84+8) = mbHdr.UInt16Value(106) // FXInfo.fdScript, fdXFlags
		      res = FSSetCatalogInfo (fsref, &H1800, catInfo) // whichInfo: FXInfo, FInfo
		    end
		    
		    //
		    ///////////////////////////
		    
		  #else
		    
		    f.Visible = BitwiseAnd(mbHdr.Byte(73),&H40) = 0
		    
		  #endif
		  
		  if mbHdr.Byte(81) <> 0 and not f.Directory then
		    if me.lockFiles then
		      f.Locked = true //Note: this one must come last, or changes to other properties may not work
		    end if
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanExtract() As Boolean
		  dim i as Integer
		  i = CompressionMethod()
		  return (i = 0 or i = 8) and not IsEncrypted() and not IsDirectory()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Comment() As String
		  // Returns the optional comment about the entry. Returns empty string if no comment available
		  
		  return me.sysEncComment
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompressedSize() As UInt32
		  return me.header.UInt32Value(20)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompressionMethod() As Integer
		  // common values:
		  // 0: stored (not compressed - can always be read)
		  // 1: shrunk (not supported)
		  // 6: imploded (not supported)
		  // 8: deflated (supported through e-CryptIt Engine plugin)
		  
		  return me.header.UInt16Value(10)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  // private because you're not supposed to use "new ZipEntry".
		  // Instead, create a new ZipEntry by using one of the ZipArchive.Add... methods
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableFileLocking(enabled as Boolean)
		  // Since v1.1 of this Zip package, items marked as "protected" in the archive
		  // will not be locked any more by default when extracted.
		  // To have such items locked at extraction, call this function with "true" as
		  // the "enabled" parameter.
		  
		  me.lockFiles = enabled
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableMacBinary1Detection(enabled as Boolean)
		  // By default, the outdated "MacBinary I" format will not be detected. Some zip and MB encoding
		  // tools on other platforms may create incorrect or those outdated MB-headers.
		  // If you enabable this mode, they're more likely to be detected as being MB-headers.
		  // This feature comes with a risk, however: Normal files, that are not MB-encoded, might
		  // mistakenly believed to be MB-encoded, in seldom cases. For that reason, enable this
		  // feature only in cases where you believe you need it, but not be default!
		  //
		  // To use this feature, you must call this function before you attempt to extract the item.
		  // To be more safe, you should only enable this feature if the item's file name ends with
		  // ".bin", since this is usually the case for MB encoded files of this problematic kind.
		  
		  me.supportMB1 = enabled
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorMessage() As String
		  // Returns a description about the latest error as an english phrase
		  //
		  // Functions calls that could cause such an error:
		  // - Extract()
		  // - Verify()
		  // - SetPath() (the one returning a Boolean result)
		  // - ExtraField()
		  
		  return me.errmsg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExternalFileAttributes() As Integer
		  // retrieves "external file attributes", a 4 byte field
		  //
		  // On Unix, this field contains the permissions in the upper 8 bits; on DOS/Windows, the lowest
		  // byte contains the File Attribues (read only, hidden, system, volume label, etc.)
		  //
		  // Call SetExternalFileAttributes() to change the value.
		  //
		  // Default for newly created items depends on "OSMadeBy" for the item:
		  //  if 3 (unix), the file's permissions are copied, provided this code runs on a Mac or Linux machine (but not Windows),
		  //  otherwise this field is set to 0.
		  // However, the lowest byte (bit 0) can contain the value 1 to tell ZipIt 2.2.2 that the file name is UTF-8 encoded
		  
		  return me.header.UInt32Value(38)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Extract(removeMacBinaryHeader as Boolean) As MemoryBlock
		  // Returns the file data as a String (or MemoryBlock, which can be assigned to each other)
		  
		  dim dataOut as new StringWriter
		  dim mbHdr as MemoryBlock
		  dim ok as Boolean
		  
		  ok = Extract (removeMacBinaryHeader, dataOut, nil, mbHdr)
		  
		  if ok then
		    return  dataOut.WrittenData
		  end
		  
		  exception err as RuntimeException
		    me.errmsg = "Internal error (exception)"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Extract(decodeMacBinary as Boolean, dataOut as SeqDataOutputStream, rsrcOut as SeqDataOutputStream, ByRef mbHdr as MemoryBlock) As Boolean
		  // Writes the data of this entry to one or two streams.
		  // If decodeMacBinary is FALSE or if the data is not MacBinary encoded, then all data is written to the
		  //   dataOut stream, and rsrcOut is not used.
		  // If decodeMacBinary is TRUE and if the data is MacBinary encoded, the two forks are streamed to dataOut
		  //   and rsrcOut, respectively. If either of the two stream parameters is nil, their fork will be skipped;
		  //   mbHdr will be set to a MemoryBlock of size 128 containing the MacBinary header. This works even
		  //   on folders which have a MacBinary header.
		  // The streams will be opened and closed by this function as needed.
		  // Returns TRUE if the extraction was successful. FALSE might mean a bad CRC or other data or writing errors.
		  
		  dim mb as MemoryBlock, ok as Boolean
		  
		  mbHdr = nil
		  
		  if dataOut = nil and rsrcOut = nil and decodeMacBinary = false then
		    // this makes no sense -> alert the programmer
		    raise new RuntimeException
		  end
		  
		  dim aborted as Boolean
		  ok = z_unzip(dataOut, rsrcOut, decodeMacBinary, me.isFolder, mb, false, aborted)
		  
		  mbHdr = mb
		  
		  return ok
		  
		  exception err as RuntimeException
		    me.errmsg = "Internal error (exception)"
		    return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Extract(destination as FolderItem) As Boolean
		  // Same as Extract(destination as FolderItem, decodeMacBinary as Boolean),
		  //   but with the difference that decodeMacBinary is always TRUE, which
		  //   leads to properly extracted files on Mac OS system, and will extract
		  //   the data fork only of files in MacBinary format on Windows systems,
		  //   meaning that the (on Windows useless) Resource fork will be discarded
		  //   on Windows systems, which is usually what people want.
		  
		  return Extract (destination, true, true, false, false)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Extract(fdest as FolderItem, decodeMacBinary as Boolean, makeExecutable as Boolean, keepBadFiles as Boolean, ignoreBadMacMetadata as Boolean) As Boolean
		  // Stores the data of this entry in a file or creates a folder.
		  // If the destination item already exists, it will be replaced, unless there's a folder<->file conflict
		  //   or if the file, containing folder or volume is write protected (locked)
		  // Sets the modification (but not creation) date to the information from the archive entry.
		  // If the entry contains Type&Creator information, the destination file will get them assigned,
		  //   otherwise T&C will be set depending on the file's extension. (Mac OS only)
		  // If the entry contains an explicit Macintosh file name, the destination will receive this name
		  //   if the passed destination.Name was identical to the archive entry's DOS name. (Mac OS only)
		  // If the entry is stored in MacBinary format and decodeMacBinary is TRUE, it will be automatically
		  //   split into its data and resource fork - on Mac OS both will be written to the destination file,
		  //   on Windows only the data fork will be written, while the resource fork will be ignored.
		  // If 'makeExecutable' is true, extracted files that are not marked as text files and which do not
		  //   contain unix file permissions, will be made executable on Mac OS systems so that Mac OS
		  //   Packages become executable (Stuffit Expander does this, too). If this parameter is false,
		  //   files will be made executable only if unix permissions are included (this is how the unix
		  //   command line tools "zip" and "unzip" do it). Using "false" may speed up extraction a little,
		  //   that's why you have the choice here: if you know that the archive you are extracting has been
		  //   created with this software (v1.2) or the cmdline "zip" tool, the correct permissions will
		  //   automatically be set, then set 'makeExecutable' to "false"; but if the file may contain executable
		  //   files and has been created by some other tools such as ZipIt, you might want to set this parm
		  //   to true to make sure the files remain executable after extraction.
		  // Returns TRUE if it was successful. FALSE might mean a bad CRC or other data errors,
		  //   including a write failure due to a locked or full volume or existing and locked file
		  
		  dim dataFork, rsrcFork as SeqDataOutputStream, d as Date, ok as Boolean, type, crea, name as String
		  dim mbHdr as MemoryBlock, bs as BinaryStream
		  dim zdest as TTsFolderItem
		  
		  if fdest = nil and not keepBadFiles then
		    me.errmsg = "No destination given"
		    return false
		  end
		  
		  dim attr as Integer = me.ExternalFileAttributes // The low byte usually contains the DOS File Attribute, the high word the permissions
		  dim st_mode as UInt16 = Bitwise.ShiftRight(attr, 16)
		  dim isSymlink as Boolean = Bitwise.BitAnd(st_mode,&o170000) = &o120000
		  
		  if fdest <> nil then
		    
		    zdest = new TTsFolderItem(fdest)
		    
		    if me.isFolder then
		      
		      //
		      // we extract a folder
		      //
		      if not zdest.exists then
		        zdest.CreateAsFolder
		      end
		      if not zdest.exists then
		        me.errmsg = "Folder creation failed"
		        return false
		      end
		      if not zdest.Directory then
		        break
		        me.errmsg = "Archive entry is a folder but a file exists at the destination already. Won't replace that."
		        return false
		      end
		      
		    else
		      
		      //
		      // we extract a file
		      //
		      
		      if zdest.Directory then
		        break
		        me.errmsg = "Archive entry is a file but a folder exists at the destination already. Won't replace that."
		        return false
		      end
		      
		      zdest.Delete // delete the existing regular file or symlink or alias
		      if zdest.Exists then
		        break
		        me.errmsg = "A file exists already at the destination which can't be deleted"
		        return false
		      end
		      
		      if isSymlink then
		        // We need to create a symlink here
		        dataFork = new StringWriter()
		      else
		        // we write a regular file
		        #if RBVersion >= 2012
		          bs = BinaryStream.Create (zdest)
		        #else
		          bs = zdest.CreateBinaryFile("")
		        #endif
		        if bs = nil then
		          me.errmsg = "Creating destination file failed"
		          return false
		        end
		        bs.Close
		        
		        #if TargetMacOS
		          // new files default to "????" - let's change them to zeros
		          type = new MemoryBlock(4)
		          TTsFolderItem.SetMacType zdest, type
		        #endif
		        
		        // create a data fork writer
		        dataFork = new FileWriter(zdest)
		        
		        // create a rsrc fork writer in case we're on the Mac and it shall be extracted from the entry data
		        #if TargetMacOS
		          if decodeMacBinary then
		            rsrcFork = new RsrcForkWriter(zdest)
		          end
		        #endif
		      end
		      
		    end if ' me.isFolder else
		  end if ' fdest <> nil
		  
		  // perform the extraction
		  dim aborted as Boolean
		  ok = z_unzip(dataFork, rsrcFork, decodeMacBinary, me.isFolder, mbHdr, ignoreBadMacMetadata, aborted)
		  
		  if zdest <> nil then
		    
		    if not ok and (aborted or not keepBadFiles) then
		      
		      zdest.Delete
		      
		    else
		      
		      if isSymlink then
		        zdest.CreateSymlink (StringWriter(dataFork).WrittenData)
		      end
		      
		      // update modification time/date
		      d = me.Time()
		      if d <> nil then
		        try
		          #pragma BreakOnExceptions off
		          zdest.CreationDate = d
		          #pragma BreakOnExceptions default
		        catch exc as RuntimeException
		          ' On Linux, Xojo raises an UnsupportedOperationException here, so let's silently ignore it
		        end
		        zdest.ModificationDate = d
		      end
		      
		      #if TargetMacOS
		        // update Type and Creator
		        // Note: if type is set to "slnk" (creator to "rhap"), the file becomes a Symlink
		        if isSymlink then
		          // no messing with symlinks!
		        elseif mbHdr <> nil then
		          // use the Type and Creator from the stored file's MacBinary header
		          ApplyMacBinaryInformation(zdest, mbHdr)
		        elseif me.extra <> nil and me.extra.GetTypeCreatorName(type, crea, name) then
		          // use the information from the archive entry's Extra Field
		          TTsFolderItem.SetMacType zdest, type
		          if name <> "" then
		            z_adjustMacFilename name, 0, zdest
		          end
		        end
		      #endif
		      
		      dim os as Integer = me.OSMadeBy
		      dim isWinOrUnix as Boolean = (os = 0 or os = 3 or os = 11) // 0 -> PKZip, 3 -> Info-Zip, 7 -> ZipIt, 11 -> NTFS (Info-Zip for NT)
		      
		      // update Unix permissions
		      if isWinOrUnix and (Bitwise.BitAnd (attr, 2) <> 0) then // DOS hidden attribute
		        zdest.Visible = false
		      end
		      if Bitwise.BitAnd (st_mode,&o7777) <> 0 and (isWinOrUnix or os = 7) then
		        // attributes field appears to contain unix permissions
		        zdest.SetUnixPermissions (st_mode)
		      elseif makeExecutable and not me.isFolder and not me.IsTextFile() then
		        // set the "executable" permission on all binary files to make apps runnable that are Mac OS Packages
		        zdest.SetUnixPermissions (Bitwise.BitOr (zdest.UnixPermissions, &o111))
		      end
		      
		    end
		    
		  end
		  
		  return ok
		  
		  Exception err as RuntimeException
		    me.errmsg = "Internal error (exception)"
		    return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtraField() As ZipExtraField
		  // Returns the Extra Field from the Local Header, which may be different from the one in
		  // the Central Directory Header -- If they differ, this one is always the one with all the infos,
		  // while the other one may leave out some information (see the Zip Archive specs).
		  // Accessing this one is a bit slower, however, since it must still be read from the archive,
		  // while the Extra Field in the Local Header is already cached in memory.
		  //
		  // If an error occured, nil will be returned, otherwise a valid object is returned, even if the Extra Field is empty
		  
		  dim lastpos, NameLen, ExtraFieldLen, i as Integer
		  dim zipStream as BinaryStream
		  dim extra as ZipExtraField
		  
		  zipStream = me.d.zipStream
		  
		  if zipStream = nil then
		    me.errmsg = "Archive is closed"
		    return nil
		  end
		  
		  lastpos = zipStream.Position
		  zipStream.Position = me.header.UInt32Value(42)
		  
		  i = zipStream.ReadInt32 // 50 4B 03 04   File Header Signature
		  if i <> &h04034B50 then
		    zipStream.Position = lastpos
		    me.errmsg = "Invalid Local File Header signature (archive appears to be severely corrupted)"
		    return nil
		  end
		  
		  zipStream.Position = zipStream.Position+22
		  
		  NameLen = zipStream.ReadInt16 // Filename Length
		  ExtraFieldLen =  zipStream.ReadInt16 // Extra Field Length
		  zipStream.Position = zipStream.Position + NameLen
		  
		  extra = new ZipExtraField(me.d, zipStream.Read(ExtraFieldLen))
		  extra.Lock
		  
		  zipStream.Position = lastpos
		  
		  return extra
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtraFieldInCentralDir() As ZipExtraField
		  // Returns the Extra Field from the Central Directory Header, which may be different from
		  // the one in the Local Header -- If they differ, this one may leave out some information,
		  // while the other one contains all the infos (see the Zip Archive specs).
		  // Accessing this one is faster, however, since it's already cached in memory, while
		  // the Extra Field in the Local Header must still be read from the archive.
		  
		  if not me.extra.IsLocked then
		    // this would be an internal error - this obj must have been locked when it was passed to ZipEntry
		    raise new RuntimeException
		  end
		  
		  return me.extra // must not be nil any more (since v1.1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMacBinaryHeader(ByRef mbHdr as MemoryBlock) As Boolean
		  // Returns TRUE if the item is stored in MacBinary format. Will
		  //   also return the 128 Byte long MacBinary header in this case.
		  // Returns FALSE otherwise, along with setting "mbHdr" to nil.
		  //
		  // The Type and Creator can be retrieved as follows:
		  //   MacType = mbHdr.StringValue(65,4)
		  //   MacCreator = mbHdr.StringValue(69,4)
		  //   DataForkSize = mbHdr.UInt32Value(83)
		  //   RsrcForkSize = mbHdr.UInt32Value(87)
		  //
		  // You may also call ApplyMacBinaryInformation() to apply Type, Creator and
		  //   other file/folder attributes from the MacBinary header to a file or folder.
		  //
		  // For more information on the MacBinary format, see:
		  //   http://www.lazerware.com/formats/
		  
		  dim mb as MemoryBlock
		  
		  mbHdr = nil
		  
		  dim aborted as Boolean
		  if not z_unzip(nil, nil, true, true, mb, false, aborted) then
		    return false
		  end
		  
		  me.errmsg = ""
		  mbHdr = mb
		  return mbHdr <> nil
		  
		  Exception err as RuntimeException
		    me.errmsg = "Internal error (exception)"
		    return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetPath(names() as String)
		  // returns the file name and path in an array split by the directory separators
		  
		  dim i as Integer
		  
		  redim names(Ubound(me.path))
		  for i = 0 to Ubound(me.path)
		    names(i) = me.path(i)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDirectory() As Boolean
		  return me.isFolder
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEncrypted() As Boolean
		  return BitwiseAnd(me.header.UInt16Value(8),1) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsTextFile() As Boolean
		  // This information is currently (24Apr03) not used inside the Zip package.
		  // That means: if a text file is extracted, no changes to the end-of-line chars
		  // will be made.
		  
		  return BitwiseAnd(me.header.UInt16Value(36),1) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeDestination(root as FolderItem, followAliases as Boolean) As FolderItem
		  // Creates a FolderItem object for the original path given by the archive entry.
		  // Will create intermittent folders if necessary.
		  //
		  // Caution: "nil" may be returned if followAliases=false and an Alias exists at that place already,
		  // or when a file exists where a folder is desired by the destination path
		  
		  dim dest as FolderItem, i as Integer
		  dest = root
		  for i = 0 to Ubound(me.path)
		    dest = MakeDestinationChild(dest, me.path(i), followAliases)
		  next
		  return dest
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeDestinationChild(dir as FolderItem, pathItem as String, followAliases as Boolean) As FolderItem
		  dim dest as FolderItem, s as String
		  dest = dir
		  s = me.d.decodeFromZip(me.d.encodeForZip(pathItem))
		  if s = ".." then
		    dest = dest.Parent
		  elseif s <> "" then
		    if not dest.exists then
		      dest.CreateAsFolder
		    end
		    if followAliases then
		      dest = dest.Child(s)
		    else
		      dest = dest.TrueChild(s)
		    end
		  end
		  return dest
		  Exception exc as RuntimeException
		    return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  // returns the file name without any path in front of it
		  return me.path(Ubound(me.path))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OSMadeBy() As Integer
		  // Read: "OS made by"
		  //
		  // Returns the code of the OS that this entry is using for file name encoding and
		  // text file end-of-line format.
		  // See the "PKZIP format.txt" or any "appnote.txt" on the web for the codes
		  //
		  // Call SetOSMadeBy() to change the value. Default for newly created items is 0
		  // (This default can be changed using ZipArchive.SetDefaultOSMadeBy)
		  
		  return me.header.Byte(5)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawPath() As String
		  // Returns the path as it appears in the Zipfile's directory.
		  //
		  // It always uses "/" as directory separators, even on Mac OS Classic!
		  //
		  // So be careful: This name may not be the original file's path, because
		  //   if the original name contained invalid DOS chars, such as "/",
		  //   then this returns a cleaned up name!
		  
		  return me.sysEncName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SameRawPath(rawPath as String) As Boolean
		  // Use this function if you want to see if a given path is equal to
		  // the one of this entry. Do not get the path using RawPath()
		  // and then compare yourself, because that might fail with
		  // non-ASCII characters in file names that are unicode encoded
		  // (this is because there are several different ways to encode
		  // the same non-ASCII character, and it happens under Mac OS
		  // that exactly this will happen: "ä" <> "ä"). This function takes
		  // care of this problem.
		  
		  return me.d.encodeForZip(rawPath) = me.zipEncName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetComment(comment as String)
		  // Sets the entry's comment that'll be stored in the archive
		  // when the directory is written (by ZipArchive.Close or
		  // ZipArchive.Flush)
		  
		  me.sysEncComment = comment
		  
		  me.zipEncComment = me.d.encodeForZip(me.sysEncComment)
		  me.d.dirty = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetExternalFileAttributes(attr as Integer)
		  // Sets the 4-byte Attributes field
		  //
		  // On Unix, this field contains the permissions in the upper 8 bits; on DOS/Windows, the lowest
		  // byte contains the File Attribues (read only, hidden, system, volume label, etc.)
		  //
		  // Call ExternalFileAttributes() to inquire about the current value
		  
		  me.header.UInt32Value(38) = attr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetExtraFieldInCentralDir(extraField as ZipExtraField)
		  // Sets a new Extra Field for the Central Directory only. Use this function
		  // if you want to add an Extra Field that differs between the two Headers.
		  // To achieve this, first create the "long" Extra Field and provide it when
		  // you add the file to the archive. After that, call this function to set
		  // the Extra Field in the Central Dir Header.
		  
		  dim ef as ZipExtraField
		  
		  ef = extraField
		  if ef = nil then
		    ef = new ZipExtraField(me.d, "")
		  end
		  ef.Lock
		  me.extra = ef
		  me.header.UInt16Value(30) = LenB(ef.AsData())
		  me.d.dirty = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetOSMadeBy(code as Integer)
		  // See the "PKZIP format.txt" or any "appnote.txt" on the web for the codes
		  //
		  // Call OSMadeBy() to inquire about the current value
		  
		  me.header.Byte(5) = code
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTextFileFlag(isText as Boolean)
		  // If you set the "text file" flag, note that the text should use CR+LF end-of-line (EOL)
		  // delimiters because the items are marked to be in MS-DOS format, where these
		  // EOLs are used for text files. Otherwise, tools that extract such items might not be
		  // able to  convert the line endings properly.
		  
		  if isText then
		    me.header.UInt16Value(36) = BitwiseOr(me.header.UInt16Value(36), 1)
		  else
		    me.header.UInt16Value(36) = BitwiseAnd(me.header.UInt16Value(36), 65535-1)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Size() As UInt32
		  return me.header.UInt32Value(24)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Time() As Date
		  // Returns the time stamp of the entry,
		  //   returns nil if the time was not specified in the archive
		  
		  dim d as Date, tim, dat as Integer
		  
		  tim = me.header.UInt16Value(12)
		  dat = me.header.UInt16Value(14)
		  
		  if tim = 0 and dat = 0 then
		    return nil
		  end
		  
		  d = new Date
		  
		  // convert date/time from DOS format
		  d.Year = (dat and &H0FE00) \ &H0200 +1980
		  d.Month =  (dat and &H1E0) \ &H20
		  d.Day = (dat and 31)
		  d.Hour = (tim and &HF800) \ &H800
		  d.Minute = (tim and &H7E0) \ &H20
		  d.Second = 2 * (tim and &H1F)
		  
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UTCOffsetInMinutes() As Integer
		  // Returns the offset of the current time to UTC (GMT) in minutes.
		  // supports Mac OS, Windows and Linux
		  //
		  // Note that the offset is not always an even multiple of 60,  but
		  // there are also half hour offsets, even one 5:45h offset
		  
		  // This 6th version by Thomas Tempelmann (rb@tempel.org) on 13 Feb 2008
		  //  (13 Feb 2008: Linux fix by Ed Lazor)
		  //
		  // Using code from various authors found on the RB NUG mailing list
		  //
		  // Latest version can be found here: http://www.tempel.org/rb/#gmt
		  
		  dim offset as integer
		  
		  #if TargetLinux or TargetMachO then
		    #if TargetMachO then
		      declare function localtime_r lib "/usr/lib/libc.dylib" (time_in as Ptr, time_out as Ptr) as Ptr
		      declare function time lib "/usr/lib/libc.dylib" (tloc_ptr as Integer) as Integer
		    #else
		      // 13 Feb 2008: as suggested by Ed Lazor, now we use a "soft" declare and simplify the lib name:
		      Soft Declare Function localtime_r Lib "libc" (time_in as Ptr, time_out as Ptr) as Ptr
		      Soft Declare Function time Lib "libc" (tloc_ptr as Integer) as Integer
		    #endif
		    dim time_in, time_out as MemoryBlock
		    time_in =  new MemoryBlock(4)
		    time_out =  new MemoryBlock(44) // we assume that "int" is 4 byte on any supported Linux system
		    time_in.Int32Value(0) = time (0) // Bugfix TT 21Apr06: need to pass current local time to get summer time offsets correctly
		    if not TargetLinux or System.IsFunctionAvailable("localtime_r" , "libc") then
		      call localtime_r (time_in, time_out)
		    end
		    offset = time_out.Long (36) \ 60
		  #elseif TargetMacOS then
		    Declare Sub ReadLocation lib CarbonLibName (location As ptr)
		    dim info as memoryBlock
		    dim byteOffset as integer
		    info = new MemoryBlock(12)
		    ReadLocation info
		    if info.LittleEndian then
		      byteOffset = 8
		    else
		      byteOffset = 11
		    end
		    offset = info.Int16Value(9) * 256 + info.byte(byteOffset)
		    offset = offset \ 60
		  #elseif TargetWin32 then
		    Declare Function GetTimeZoneInformation Lib "Kernel32" ( tzInfoPointer as Ptr ) as Integer
		    // returns one of
		    // TIME_ZONE_ID_UNKNOWN 0
		    //      -- Note: e.g. New Delhi (GMT+5:30) and Newfoundland (-3:30) return this value 0
		    // TIME_ZONE_ID_STANDARD 1
		    // TIME_ZONE_ID_DAYLIGHT 2
		    dim info as memoryBlock
		    dim result, bias, dayLightbias as integer
		    info = new MemoryBlock(172)
		    result = GetTimeZoneInformation(info)
		    bias = info.Int32Value(0)
		    // note about bias: the original code I found in the NUG archives used Long(84) and switched to Long(0)
		    // only for result=1 and result=2, but my tests found that Long(0) is also the right value for result=0
		    if result = 2 then
		      daylightBias = info.Int32Value(168)
		    end if
		    offset = - (bias + dayLightbias)
		  #else
		    this target is not supported yet - see if there's a new version at <www.tempel.org/rb/>
		  #endif
		  
		  return offset
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Verify() As Boolean
		  // Checks the integrity of the data by uncompressing it and verifying its CRC
		  // Returns TRUE if data is valid.
		  
		  dim mb as MemoryBlock
		  dim aborted as Boolean
		  
		  return z_unzip(nil, nil, false, false, mb, false, aborted)
		  
		  exception err as RuntimeException
		    me.errmsg = "Internal error (exception)"
		    return false
		End Function
	#tag EndMethod


	#tag Note, Name = About
		
		See the notes in the class "ZipArchive" for more information
	#tag EndNote

	#tag Note, Name = Important
		
		----------------------------------
		Important note about adding Set... functions here
		----------------------------------
		  
		We must not provide methods that allow the change of any ZipEntry
		  properties other than the comment (comments are stored only in the dir)
		  here, because altering any other properties would only be stored in
		  the Central Directory structure, but not in the Local File Header,
		  causing header mismatches.
		
		So, if one wants to alter the name or the Extra Field of an item in the
		  archive, the entire archived file needs to be rewritten (appended)
		  with the current implemention of these classes. To overcome this
		  limitation, one would have to move any data behind the modified
		  entry, which can be quite inefficient with larger archives. Instead,
		  the way to go is to Remove the original entry, then generate a new
		  one and copy the compressed data over. The only exception is when
		  the replacement will be the same size or smaller than the original.
		  In case it's smaller, ZipArchive.Compact should be called afterwards.
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="z_hasDittoName"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass

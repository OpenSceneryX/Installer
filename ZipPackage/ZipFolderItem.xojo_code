#tag Class
Protected Class ZipFolderItem
Inherits ZipFolderItemBase
	#tag Method, Flags = &h0
		Function Child(name as String) As ZipFolderItem
		  // Returns the child item with the given name.
		  // Returns nil if no item with that name exists
		  
		  name = zar.CleanName (name)
		  return mChildrenDict.Lookup (name, nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Children() As ZipFolderItem()
		  // Returns a copy of the childrens array
		  // Not only prevents this accidental modifications to this class' properties
		  // but it also allows to use the "for each ... in item.Children" while modifying
		  // the children array (Delete, Add) without running into problems due to
		  // the very same array being modified in the loop.
		  
		  dim chs() as ZipFolderItem
		  redim chs(mChildrenArray.Ubound)
		  
		  for i as Integer = 0 to mChildrenArray.Ubound
		    chs(i) = mChildrenArray(i)
		  next
		  
		  return chs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  return mChildrenArray.Ubound+1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateEmptyFolder(name as String) As ZipFolderItem
		  // Adds a folder to the archive, replacing any existing folder
		  //   (and erasing its entire contents).
		  //
		  // If this function returns nil, an error had occured and the folder
		  //   is not added.
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  
		  super.resetError
		  
		  dim zar as ZipArchive = me.zar
		  dim rawPath as String
		  if super.prepareStore (name, rawPath) then
		    dim e_idx as Integer = zar.z_zip (nil, 0, nil, 0, nil, rawPath+"/", new Date, nil, false)
		    if e_idx > 0 then
		      dim item as ZipFolderItem = me.createChild (name)
		      item.setEntry zar.Entry(e_idx)
		      return item
		    else
		      mErrMsg = zar.ErrorMessage
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Delete() As Boolean
		  // Delete this item and, if it's a folder, all its contents
		  //
		  // Note: To really erase the deleted items from the zip file, you need to call
		  // ZipArchive.Compact once at the end after you've deleted all your items.
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  
		  super.resetError
		  
		  return me.remove()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteChild(name as String) As Boolean
		  // Deletes _all_ versions of the named child, and all its children and theirs, and so on.
		  //
		  // Note: To really erase the deleted items from the zip file, you need to call
		  // ZipArchive.Compact once at the end after you've deleted all your items.
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  
		  super.resetError
		  
		  dim item as ZipFolderItem = me.Child(name)
		  if item <> nil then
		    return item.remove()
		  end if
		  
		  mErrMsg = "item not found: "+name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Directory() As Boolean
		  // Returns true if the item is a folder, false if the item is a file
		  
		  return mIsFolder
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Entry() As ZipEntry
		  // May be nil, i.e. for folders that have no own entry inside the Archive
		  
		  return mEntry
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractInto(destination as FolderItem) As Boolean
		  // Extracts this ZipFolderItem, including all contents, to the given destination.
		  //
		  // Note that if there are already files and folders at the destination, then those
		  // won't be deleted unless they get replaced by those from this archive.
		  // This means that if you want to do a "clean" extraction, i.e. a full "replace",
		  // where no old files are left at the destination, you have to delete the destination
		  // first.
		  //
		  // If this object is a folder or the root object (from ZipArchive.Tree), then all its
		  // contents will be written to a folder identified by 'destination'. If 'destination'
		  // does not exist yet, it will be created as a folder. If it exists already and is
		  // a folder, the items will be extracted to that folder. If it exists and is NOT a
		  // folder, this is an error and 'false' is returned from this function.
		  //
		  // If this is not a folder but a file, then destination must either be a file
		  // (then this file will be replaced with the extracted contents of this item)
		  // or not exist. If the 'destination' exists as a folder, this is an error and
		  // 'false' is returned from this function.
		  //
		  // If extraction succeeded, true is returned.
		  //
		  // You may call the Total... functions to learn how many items and bytes
		  // will be extracted.
		  
		  super.resetError
		  
		  if not me.Directory then
		    
		    //
		    // Extract a single file
		    //
		    
		    if not Entry.Extract (destination) then
		      mErrMsg = Entry.ErrorMessage
		      return false
		    end
		    
		  else
		    
		    //
		    // Extract folder contents
		    //
		    
		    if destination.Exists then
		      if not destination.Directory then
		        mErrMsg = "destination exists but is not a folder as required: "+TTsFolderItem.NativePath(destination)
		        return false
		      end
		    else
		      destination.CreateAsFolder
		    end
		    
		    for each child as ZipFolderItem in me.Children
		      if not child.ExtractInto (destination.Child(child.Name)) then
		        return false
		      end
		    next
		    
		    // Finally, update all this folders' attributes (date, permissions etc.)
		    dim e as ZipEntry = me.Entry
		    if e <> nil then
		      if not e.Extract(destination) then
		        mErrMsg = Entry.ErrorMessage
		        return false
		      end
		    end
		    
		  end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractToString(ByRef data as String) As Boolean
		  // Extracts this ZipFolderItem, provided it's a file and not a directory, into a String
		  //
		  // If extraction succeeded, true is returned.
		  
		  super.resetError
		  
		  if me.Directory then
		    mErrMsg = "can only extract files into strings, not dirs: "+me.RawPath
		    return false
		  end
		  
		  dim mb as MemoryBlock = Entry().Extract(true)
		  if mb = nil then
		    mErrMsg = Entry().ErrorMessage
		    return false
		  end
		  
		  data = mb
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasChild(name as String) As Boolean
		  // Returns true if this item has a child with the given name
		  
		  name = zar.CleanName (name)
		  return mChildrenDict.HasKey (name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasChildren() As Boolean
		  // Returns whether this item has actual children (=true) or is empty (=false).
		  
		  return mChildrenArray.Ubound >= 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(index as Integer) As ZipFolderItem
		  // index is zero-based
		  
		  if index >= 0 and index <= mChildrenArray.Ubound then
		    return mChildrenArray(index)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastErrorMessage() As String
		  // Returns a description about the latest error as an english phrase
		  //
		  // Function calls that could cause such an error:
		  // - CreateEmptyFolder()
		  // - Delete()
		  // - DeleteChild()
		  // - ExtractInto()
		  // - StoreFile()
		  // - StoreFolderContents()
		  // - StoreFolderItem()
		  
		  return mErrMsg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Length() As Int64
		  // Returns the original (extracted) size of the item (does not include Mac Resource length)
		  
		  if mEntry <> nil and not mEntry.IsDirectory then
		    return mEntry.Size
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ModificationDate() As Date
		  if mEntry <> nil then
		    return mEntry.Time
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  return mName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parent() As ZipFolderItem
		  if mParent <> nil then
		    return ZipFolderItem(mParent.Value)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Path() As String()
		  dim p() as String
		  if mEntry <> nil then
		    mEntry.GetPath(p)
		  else
		    dim item as ZipFolderItem = me
		    while item.mParent <> nil
		      p.Insert 0, item.mName
		      item = item.Parent
		    wend
		  end if
		  return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PreviousVersions() As ZipEntry()
		  // We must not return the array reference, but a copy
		  dim a() as ZipEntry
		  redim a(mPrevInstances.Ubound)
		  for i as Integer = 0 to mPrevInstances.Ubound
		    a(i) = mPrevInstances(i)
		  next
		  return a
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawPath() As String
		  return Join(path,"/")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StoreFile(inputFile as FolderItem, name as String = "", useMacBinary as Integer = ZipArchive.MacBinaryNever, mayCompress as Boolean = true) As ZipFolderItem
		  // Adds a file to the archive, replacing any existing file of the same name.
		  //   You can optionally provide a different name.
		  //   If 'name' is empty or not specified, then the name of 'inputFile' is used.
		  //
		  // If this function returns nil, an error had occured and the file is not added.
		  //   (ZipArchive.ErrorMessage() will then provide a descriptive msg).
		  //   Otherwise, the just created item is returned.
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  // - 'inputFile' is not a folder (inputFile.Directory must be 'false')
		  // - The file's size must be below 2GB (2^31) - a ZIP limitation
		  
		  super.resetError
		  
		  if inputFile.Directory then
		    // You are not supposed to pass folders to this method
		    raise new RuntimeException
		  end
		  
		  if name = "" then
		    name = inputFile.Name
		  end
		  
		  dim zar as ZipArchive = me.zar
		  dim rawPath as String
		  if super.prepareStore (name, rawPath) then
		    dim e_idx as Integer
		    e_idx = zar.z_addItem (new TTsFolderItem(inputFile), rawPath, useMacBinary, false, mayCompress)
		    if e_idx > 0 then
		      dim item as ZipFolderItem = me.createChild (name)
		      item.setEntry zar.Entry(e_idx)
		      return item
		    else
		      mErrMsg = zar.ErrorMessage
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StoreFolderContents(folder as FolderItem, includeInvisibles as Boolean = true, useMacBinary as Integer = ZipArchive.MacBinaryNever, aliasHandling as ZipArchive.MacAliasHandling = ZipArchive.MacAliasHandling.StoreAll, mayCompress as Boolean = true) As Boolean
		  // Stores (and compresses) the contents of the given folder in the archive,
		  //   replacing any existing files or folders (including their entire contents).
		  //
		  // All items are stored under their original name.
		  //
		  // To store or follow aliases, pass any of the ZipArchive.MacAliasHandling enum
		  //   values. Note that you can not have Aliases to folders followed because this
		  //   could lead to infinite loops (a safety check for this could be added but has
		  //   not yet). Note that even if useMacBinary is false, it will be temporarily
		  //   enabled for storing aliases.
		  //
		  // If this function returns false, an error had occured and no items are added.
		  //   (ZipArchive.ErrorMessage() will then provide a descriptive msg).
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  // - All files' sizes must be below 2GB (2^31) - a ZIP limitation
		  
		  super.resetError
		  
		  dim zar as ZipArchive = me.zar
		  
		  if folder = nil then raise new NilObjectException
		  
		  // Get all affected items
		  dim files(), folders() as TTsFolderItem
		  zar.z_getAffectedFolderContents (folder, aliasHandling, includeInvisibles, files, folders)
		  
		  // Remove all existing items of those we want to store
		  if mChildrenArray.Ubound >= 0 then
		    if not super.prepareStore (files) or not super.prepareStore (folders) then
		      return false
		    end
		  end if
		  
		  // Add the items to the archive
		  dim rawPath as String = Join(me.Path,"/")
		  dim firstIdx as Integer = zar.EntryCount+1
		  if zar.z_addFolderContents(folder, rawPath+"/", aliasHandling, useMacBinary, includeInvisibles, false, mayCompress, files, folders) <> 0 then
		    mErrMsg = zar.ErrorMessage
		    return false
		  end
		  
		  // Update the list of children of this object
		  dim lastIdx as Integer = zar.EntryCount
		  dim root as ZipFolderItemBase = super.treeRoot()
		  for idx as Integer = firstIdx to lastIdx
		    dim e as ZipEntry = zar.Entry(idx)
		    dim path() as String
		    e.GetPath path
		    dim item as ZipFolderItemBase = root.findItem (path, path.Ubound, true)
		    item.setEntry e
		  next
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StoreFolderItem(fileOrFolder as FolderItem, includeInvisibles as Boolean = true, useMacBinary as Integer = ZipArchive.MacBinaryNever, aliasHandling as ZipArchive.MacAliasHandling = ZipArchive.MacAliasHandling.StoreAll, mayCompress as Boolean = true) As ZipFolderItem
		  // Stores (and compresses) a file or folder with all its contents in the archive,
		  //   replacing any existing file or folder (including its entire contents).
		  //
		  // All items are stored under their original name.
		  //
		  // To store or follow aliases, pass any of the ZipArchive.MacAliasHandling enum
		  //   values. Note that you can not have Aliases to folders followed because this
		  //   could lead to infinite loops (a safety check for this could be added but has
		  //   not yet). Note that even if useMacBinary is false, it will be temporarily
		  //   enabled for storing aliases.
		  //
		  // If this function returns nil, an error had occured and no items are added.
		  //   (ZipArchive.ErrorMessage() will then provide a descriptive msg).
		  //   Otherwise, the just created folder item is returned.
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  // - All files' sizes must be below 2GB (2^31) - a ZIP limitation
		  
		  super.resetError
		  
		  if fileOrFolder.Directory then
		    dim folder as ZipFolderItem
		    folder = me.CreateEmptyFolder (fileOrFolder.Name)
		    if folder = nil then
		      return nil
		    end
		    if fileOrFolder.Count > 0 then
		      if not folder.StoreFolderContents (fileOrFolder, includeInvisibles, useMacBinary, aliasHandling, mayCompress) then
		        // Oops, contents were not completely added - let's remove the top folder again as well:
		        dim tmpMsg as String = mErrMsg // preserve error msg so remove() below won't overwrite it
		        call folder.remove()
		        mErrMsg = tmpMsg
		        return nil
		      end
		    end
		    return folder
		  else
		    return me.StoreFile (fileOrFolder, "", useMacBinary, mayCompress)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StoreStringAsFile(data as String, name as String, fileDate as Date = nil, mayCompress as Boolean = true) As ZipFolderItem
		  // Adds a file to the archive, replacing any existing file of the given name.
		  //   The file's content is provided as a String here, so you can add items
		  //   to the Zip file that you've got in a variable instead of in a file on disk.
		  //
		  // If this function returns nil, an error had occured and the file is not added.
		  //   (ZipArchive.ErrorMessage() will then provide a descriptive msg).
		  //   Otherwise, the just created item is returned.
		  //
		  // Preconditions:
		  // - Archive is open (Open has been called, but not Close)
		  // - Archive was opened for writing
		  
		  super.resetError
		  
		  if name = "" then
		    // name must not be empty
		    raise new RuntimeException
		  end
		  
		  // If no date is specified, take "now" as the file's timestamp
		  if fileDate = nil then
		    fileDate = new Date
		  end
		  
		  dim zar as ZipArchive = me.zar
		  dim rawPath as String
		  if super.prepareStore (name, rawPath) then
		    dim e_idx as Integer
		    e_idx = zar.AddItemByStreams (new StringReader (data), data.LenB, nil, 0, nil, rawPath, nil, fileDate, mayCompress)
		    if e_idx > 0 then
		      dim item as ZipFolderItem = me.createChild (name)
		      item.setEntry zar.Entry(e_idx)
		      return item
		    else
		      mErrMsg = zar.ErrorMessage
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TotalCompressedBytes() As Int64
		  // Returns the amount of bytes for this item (and its contents)
		  // used in the archive (not exactly, it's just the sum of all items'
		  // compressed sizes, without the housekeeping data for the zip
		  // file).
		  // Use can use this for a progress bar's total amount if you show
		  // the current sum of extracted bytes in the progress bar.
		  
		  if mIsFolder then
		    dim total as Int64 = 0
		    for each item as ZipFolderItem in mChildrenArray
		      total = total + item.TotalCompressedBytes // (leads to a recursion)
		    next
		    return total
		  elseif mEntry <> nil then
		    return mEntry.CompressedSize
		  else
		    super.checkRegistration
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TotalItemCount() As Integer
		  // Returns the amount of files and folders contained in this item.
		  // If this item is not a folder, it'll return 1. If it's a folder, it'll
		  // count this folder along with all items inside it.
		  
		  dim total as Integer
		  if mParent <> nil then
		    total = 1
		  end
		  if mIsFolder then
		    for each item as ZipFolderItem in mChildrenArray
		      total = total + item.TotalItemCount // (leads to a recursion)
		    next
		  else
		    super.checkRegistration
		  end
		  return total
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TotalItemLength() As Int64
		  // Returns the amount of bytes used by this item (and its folder contents,
		  // if any) if it were extracted to disk.
		  // So you could precalculate the amount needed on disk before extracting the
		  // data, and also use it for a progress bar's total amount.
		  //
		  // Note, however, that this only calculates the sum of bytes off the file(s),
		  // while other space needed on disk, e.g. to store the meta data of the files
		  // i.e. create the directory entry on disk) will not be incorporated. Which means,
		  // if the value returned here is _exactly_ what's reported to be free on a disk,
		  // extraction will probably still fail. It's safer to assume that you'll need at least
		  // 1-32KB extra space per file on disk, at least, depending on the type and size
		  // of the disk format (if you want to learn more on this, just ask me).
		  
		  if mIsFolder then
		    dim total as Int64 = 0
		    for each item as ZipFolderItem in mChildrenArray
		      total = total + item.TotalItemLength // (leads to a recursion)
		    next
		    return total
		  elseif mEntry <> nil then
		    return mEntry.Size
		  else
		    super.checkRegistration
		  end
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Looking for Rename & Move?
		Due to the fact that the archive is just a seqential collection of file data, with their
		names (and other directory data) in between, renaming (this includes move to a
		different folder, with is effectively nothing else than renaming the file, as it always
		includes its entire folder path in the name) is not an easy task: If the new name is
		longer than the older path, then there is usually no room to insert the additional
		characters into the file. Instead, the file data inside the archive would then need to be
		copied to a large enough unused area inside the archive, or be appended to its end,
		create a gap inside the archive (when can be removed by calling ZipArchive.Compact).
		
		For that reason, I rather not even offer rename and move functions because they
		could cause unexpected inefficiencies using the archive. Instead, you should plan to
		use a zip archive by figuring all names and folders before adding the files into the
		archive, in order to avoid renames thereafter.
		
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
End Class
#tag EndClass

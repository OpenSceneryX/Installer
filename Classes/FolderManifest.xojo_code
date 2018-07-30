#tag Class
Protected Class FolderManifest
	#tag Method, Flags = &h0
		Sub Constructor()
		  pManifest = new Dictionary
		  
		  // These files are always excluded when intersecting manifests.  i.e. we always want these files to be considered for download
		  pIntersectionExclusions.Append("/ReadMe.html")
		  pIntersectionExclusions.Append("/doc/all.css")
		  pIntersectionExclusions.Append("/doc/cc_logo.png")
		  pIntersectionExclusions.Append("/doc/ie7.css")
		  pIntersectionExclusions.Append("/doc/ReleaseNotes.html")
		  pIntersectionExclusions.Append("/doc/versioninfo.js")
		  pIntersectionExclusions.Append("/placeholders/invisible/")
		  
		  // These files are ignored when getting the differences between manifests. Generally, locally created files should be included here.
		  pDifferenceExclusions.Append("/opensceneryx/placeholder.fac")
		  pDifferenceExclusions.Append("/opensceneryx/placeholder.for")
		  pDifferenceExclusions.Append("/opensceneryx/placeholder.lin")
		  pDifferenceExclusions.Append("/opensceneryx/placeholder.obj")
		  pDifferenceExclusions.Append("/opensceneryx/placeholder.png")
		  pDifferenceExclusions.Append("/opensceneryx/placeholder.pol")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub doGatherManifestFromDSFFiles(containingFolderItem as FolderItem)
		  dim i, j as Integer
		  dim count as Integer = containingFolderItem.Count
		  dim dsfReader as DSFReader
		  
		  for i = count downto 1
		    dim folderItem as FolderItem = containingFolderItem.TrueItem(i)
		    
		    if folderItem <> nil then
		      // Ignore any files or folders starting '.'
		      if (folderItem.name.left(1) = ".") then continue
		      
		      if folderItem.Directory then
		        // Recursive call
		        doGatherManifestFromDSFFiles(folderItem)
		      elseif (lowercase(folderItem.name.right(3)) = "dsf") then
		        // Gather the information from the file
		        dsfReader = new DSFReader(folderItem)
		        dim result as integer = dsfReader.load()
		        
		        if (dsfReader.load() <> DSFReader.kResultSuccess) then continue
		        
		        dim paths() as String = dsfReader.getPaths()
		        for j = 0 to ubound(paths)
		          // In this manifest, we don't attempt to fetch the file information, just store the path as the value
		          dim path as string = paths(j)
		          'path.Encoding = Encodings.UTF8
		          pManifest.Value(normaliseFilePath(path)) = path
		        next
		      end if
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub doGatherManifestFromFolderItem(containingFolderItem as FolderItem)
		  Dim i As Integer
		  dim count as Integer = containingFolderItem.Count
		  dim md5 as MD5Digest = new MD5Digest()
		  
		  For i = count DownTo 1
		    App.YieldToNextThread
		    
		    dim folderItem as FolderItem = containingFolderItem.TrueItem(i)
		    
		    if folderItem <> nil then
		      // Ignore any files or folders starting '.'
		      if (folderItem.name.left(1) = ".") then continue
		      
		      if folderItem.Directory then
		        doGatherManifestFromFolderItem(folderItem)
		      else
		        // Gather the information from the file
		        md5.clear()
		        md5.process(folderItem.OpenAsTextFile.ReadAll)
		        dim fileInformation as Dictionary = new Dictionary()
		        fileInformation.value("size") = folderItem.Length
		        fileInformation.value("digest") = binToHex(md5.value, "")
		        
		        dim rootPath as String = pRootFolderItem.nativePath
		        if (rootPath.right(1) <> App.kPathSeparator) then
		          rootPath = rootPath + App.kPathSeparator
		        end if
		        
		        dim relativePath as String = folderItem.nativePath
		        
		        relativePath = relativePath.mid(rootPath.len)
		        pManifest.Value(normaliseFilePath(relativePath)) = fileInformation
		      end if
		    End If
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub gatherManifestFromDSFFiles(xPlaneFolderItem as FolderItem, includeDisabled as boolean)
		  dim folderItem as FolderItem
		  
		  pManifest.clear
		  
		  folderItem = xPlaneFolderItem.child("Custom Scenery")
		  doGatherManifestFromDSFFiles(folderItem)
		  
		  if (includeDisabled) then
		    folderItem = xPlaneFolderItem.child("Custom Scenery (disabled)")
		    doGatherManifestFromDSFFiles(folderItem)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub gatherManifestFromLocalFolderItem(folderItem as FolderItem)
		  pManifest.clear
		  pRootFolderItem = folderItem
		  doGatherManifestFromFolderItem(folderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub gatherManifestFromXMLFile(xmlFile as FolderItem)
		  pManifest.clear
		  dim result as Boolean = pManifest.loadXML(xmlFile)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function gatherManifestFromXMLString(xml as String) As boolean
		  pManifest.clear
		  return pManifest.loadXML(xml)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub getDifferences(newManifest as FolderManifest, ByRef changedFiles as Collection, ByRef deletedFiles as Collection)
		  dim i as Integer
		  
		  // First iterate our dictionary looking for items not in the new dictionary
		  dim keys() as Variant = pManifest.keys()
		  
		  for i = 0 to ubound(keys)
		    dim key as variant = keys(i)
		    
		    if pDifferenceExclusions.IndexOf(key) <> -1 then
		      continue
		    end if
		    
		    if newManifest.pManifest.hasKey(key) then
		      dim newValue as Dictionary = newManifest.pManifest.value(key)
		      dim oldValue as Dictionary = pManifest.value(key)
		      if (newValue.value("size") <> oldValue.value("size") or newValue.value("digest") <> oldValue.value("digest")) then
		        // The files are different in some way
		        changedFiles.add(key)
		      end if
		    else
		      // If the key is in our manifest but not in the new one, the file has been deleted
		      deletedFiles.add(key)
		    end if
		  next
		  
		  
		  // Next iterate the new dictionary, adding any items not in ours
		  keys = newManifest.pManifest.keys()
		  
		  for i = 0 to ubound(keys)
		    dim key as variant = keys(i)
		    
		    if pDifferenceExclusions.IndexOf(key) <> -1 then
		      continue
		    end if
		    
		    if not pManifest.hasKey(key) then
		      // The key is in the new manifest but not ours
		      changedFiles.add(key)
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getLocalFolderItem(normalisedFilePath as String) As FolderItem
		  dim parts() as String = normalisedFilePath.split("/")
		  dim result as FolderItem = pRootFolderItem
		  dim i as Integer
		  
		  if uBound(parts) > 0 then
		    for i = 1 to uBound(parts)
		      dim fi as FolderItem = result.child(parts(i))
		      if (not fi.exists() and i < uBound(parts)) then fi.createAsFolder()
		      result = fi
		    next
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub intersect(newManifest as FolderManifest)
		  // We reduce our manifest to only those items that are in the passed manifest
		  
		  dim i as Integer
		  
		  // Iterate our dictionary looking for items not in the new dictionary
		  dim keys() as Variant = pManifest.keys()
		  
		  for i = 0 to ubound(keys)
		    dim key as variant = keys(i)
		    
		    // If it's not in the exclusion list and it's not in the new dictionary, remove it from our dictionary
		    if pIntersectionExclusions.IndexOf(key) = -1 and not newManifest.pManifest.hasKey(key) then
		      pManifest.remove(key)
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub save(folderItem as FolderItem)
		  dim result as Boolean = pManifest.saveXML(folderItem, false)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private pDifferenceExclusions() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pIntersectionExclusions() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pManifest As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pRootFolderItem As FolderItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
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

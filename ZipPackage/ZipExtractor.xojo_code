#tag Class
Protected Class ZipExtractor
	#tag Method, Flags = &h0
		Function ExtractAllSilently(zipFile as FolderItem, destFolder as FolderItem) As Boolean
		  // Extracts all files from a zip archive into a folder
		  // Returns true if it was successfuly.
		  // If it failed, you can call LastErrMsg or LastErrMsgs to
		  // get information about what went wrong.
		  
		  dim e as ZipEntry
		  dim i as Integer
		  dim ok as Boolean
		  dim totalBytes as Double
		  dim f as FolderItem
		  dim zar as ZipArchive
		  
		  redim me.p_errMsg(-1)
		  
		  zar = new ZipArchive
		  if not zar.Open(zipFile, false) then
		    me.p_errMsg.Append zipFile.ShellPath : zar.ErrorMessage
		  else
		    
		    //
		    // Calculate the sum of all bytes of all files to extract
		    //
		    // This information is, however, currently not used further.
		    // Feel free to alter this code to use the information,
		    // e.g. to display a progress bar to the user.
		    //
		    
		    totalBytes = 0
		    for i = 1 to zar.EntryCount
		      e = zar.Entry(i)
		      totalBytes = totalBytes + e.Size
		    next
		    me.p_totalBytes = totalBytes
		    
		    //
		    // Now extract all files into that folder
		    //
		    
		    for i = 1 to zar.EntryCount
		      e = zar.Entry(i)
		      
		      // optional check to support older or incorrectly created MacBinary headers:
		      'if me.decodeMacBinary and Right(e.RawPath(),4) = ".bin" then
		      'e.EnableMacBinary1Detection(true)
		      'end
		      
		      if e.IsDirectory then
		        // we skip the folders for now - folders get created automatically anyway,
		        // so this skipping only speeds it up a little for now
		      else
		        f = e.MakeDestination(destFolder,false)
		        if not e.Extract(f, true, true, false, false) then
		          me.p_errMsg.Append e.RawPath : e.ErrorMessage
		        end
		      end
		      
		    next
		    
		    //
		    // Now update all the extract folders' attributes (date, permissions etc.)
		    //
		    
		    for i = zar.EntryCount downTo 1
		      e = zar.Entry(i)
		      if e.IsDirectory then
		        f = e.MakeDestination(destFolder,false)
		        if not e.Extract(f, true, true, false, false) then
		          me.p_errMsg.Append e.RawPath : e.ErrorMessage
		        end
		      end
		    next
		    
		    //
		    // Close the archive (not really necessary, as it closes automatically
		    // when the ZipArchive instance gets destructed)
		    //
		    
		    ok = zar.Close
		    
		  end
		  
		  zar = nil
		  
		  return me.p_errMsg.Ubound < 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetComment(zipFile as FolderItem) As String
		  // Gets the comments from a zip file if it has one.
		  // (Usually, zip files do not contain comments)
		  
		  dim ok as Boolean
		  dim zar as ZipArchive
		  dim comm as String
		  
		  redim me.p_errMsg(-1)
		  
		  zar = new ZipArchive
		  if not zar.Open(zipFile, false) then
		    me.p_errMsg.Append zipFile.ShellPath : zar.ErrorMessage
		  else
		    comm = zar.Comment
		    ok = zar.Close
		  end
		  zar = nil
		  return comm
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HadError() As Boolean
		  // Returns true if there was an error during the last calls to
		  // ExtractAllSilently, IsZipArchive and GetComment.
		  
		  return p_errMsg.Ubound >= 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsZipArchive(file as FolderItem) As Boolean
		  // Returns true if the given file is a zip archive.
		  // If it returns false, HadError will return true,
		  // and you can get the details by calling LastErrMsg.
		  
		  dim ok as Boolean
		  dim zar as ZipArchive
		  
		  redim me.p_errMsg(-1)
		  
		  zar = new ZipArchive
		  if not zar.Open(file, false) then
		    me.p_errMsg.Append file.ShellPath : zar.ErrorMessage
		  else
		    ok = zar.Close
		  end
		  zar = nil
		  return ok
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastErrMsg() As String
		  // Returns just the first of any error messages that occured
		  // during the last ExtractAllSilently call
		  
		  if me.HadError then
		    dim p as Pair = p_errMsg(0)
		    return "File "+p.Left+": "+p.Right
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastErrMsgs() As String()
		  // Returns an array of all error messages that occured
		  // during the last ExtractAllSilently call
		  
		  dim s() as String
		  for each p as Pair in p_errMsg
		    s.Append "File "+p.Left+": "+p.Right
		  next
		  return s
		End Function
	#tag EndMethod


	#tag Note, Name = About
		You can use the methods in this optional class to easily extract all files from
		an archive, get its comment and check if a file is a Zip archive at all.
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private p_errMsg() As Pair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private p_totalBytes As Double
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

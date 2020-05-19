#tag Class
Protected Class HTTPSSocket
Inherits HTTPSecureSocket
	#tag Event
		Function AuthenticationRequired(Realm As String, Headers As InternetHeaders, ByRef Name As String, ByRef Password As String) As Boolean
		  if RaiseEvent AuthenticationRequired( Realm, Headers, Name, Password ) then
		    return true
		  end if
		  
		  if Username <> "" then
		    Name = Username
		    Password = self.Password
		    return true
		  else
		    return false
		  end if
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Get(url As String)
		  SetSecure( url )
		  super.Get( url )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Get(url As String, file As FolderItem)
		  SetSecure( url )
		  super.Get( url, file )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(url As String, file As FolderItem, timeout As Integer) As Boolean
		  SetSecure( url )
		  return super.Get( url, file, timeout )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(url As String, timeout As Integer) As String
		  SetSecure( url )
		  return super.Get( url, timeout )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetHeaders(url As String)
		  SetSecure( url )
		  super.GetHeaders( url )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHeaders(url As String, timeout As Integer) As InternetHeaders
		  SetSecure( url )
		  return super.GetHeaders( url, timeout )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendRequest(method As String, url As String)
		  SetSecure( url )
		  super.SendRequest( method, url )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendRequest(method As String, url As String, file As FolderItem)
		  SetSecure( url )
		  super.SendRequest( method, url, file )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendRequest(method As String, url As String, file As FolderItem, timeout As Integer) As Boolean
		  SetSecure( url )
		  return super.SendRequest( method, url, file, timeout )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendRequest(method As String, url As String, timeout As Integer) As String
		  SetSecure( url )
		  return super.SendRequest( method, url, timeout )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetSecure(ByRef url As String)
		  if ForceSecure or url.Trim.Left( 8 ) = "https://" then
		    self.Secure = true
		    self.Port = 443
		  else
		    self.Secure = false
		    self.Port = 80
		  end if
		  
		  SetRequestHeader "Cache-Control", "private, no-cache, max-age=0"
		  SetRequestHeader "Pragma", "no-cache"
		  
		  //
		  // See if the username and password has been specified
		  //
		  dim rx as new RegEx
		  rx.SearchPattern = "^(https?://)([^:/\x20@]+):([^:/\x20@]*)@(.*)"
		  
		  dim match as RegExMatch = rx.Search( url )
		  if match is nil then
		    Username = ""
		    Password = ""
		  else
		    Username = DecodeURLComponent( match.SubExpressionString( 2 ) )
		    Password = DecodeURLComponent( match.SubExpressionString( 3 ) )
		    url = match.SubExpressionString( 1 ) + match.SubExpressionString( 4 )
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AuthenticationRequired(Realm As String, Headers As InternetHeaders, ByRef Name As String, ByRef Password As String) As Boolean
	#tag EndHook


	#tag Property, Flags = &h0
		ForceSecure As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Password As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Username As String
	#tag EndProperty


	#tag Constant, Name = kDefaultMaximumIterations, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="SSLConnectionType"
			Visible=true
			Group="Behavior"
			InitialValue="3"
			Type="SSLConnectionTypes"
			EditorType="Enum"
			#tag EnumValues
				"1 - SSLv23"
				"3 - TLSv1"
				"4 - TLSv11"
				"5 - TLSv12"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificateFile"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="FolderItem"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificatePassword"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificateRejectionFile"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="FolderItem"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ForceSecure"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			Name="Secure"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass

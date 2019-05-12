#tag Class
Protected Class LooseVersion
	#tag Method, Flags = &h0
		Sub Constructor(vstring as String = "")
		  If vstring <> "" Then
		    Self.parse(vstring)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(other as LooseVersion) As Integer
		  Dim maxlength As Integer = Max(Self.version.Ubound, other.version.Ubound)
		  Dim lvalue, rvalue As Integer
		  Dim i As Integer
		  
		  For i = 0 To maxlength
		    If i <= Self.version.Ubound Then
		      lvalue = Self.version(i)
		    Else
		      lvalue = 0
		    End If
		    
		    If i <= other.version.Ubound Then
		      rvalue = other.version(i)
		    Else
		      rvalue = 0
		    End If
		    
		    If lvalue < rvalue Then
		      Return -1
		    Elseif lvalue > rvalue Then
		      Return 1
		    End If
		  Next
		  
		  Return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  Return Self.vstring
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub parse(vstring as String)
		  Dim component_re As New RegEx
		  Dim match As RegExMatch
		  Dim components() As Variant
		  'Dim components As Collection
		  
		  Self.vstring = vstring
		  component_re.SearchPattern = "(\d+|[a-z]+|\.)"
		  match = component_re.Search(vstring)
		  
		  Do
		    If match <> Nil Then
		      If IsNumeric(match.SubExpressionString(0)) Then
		        components.Append(Val(match.SubExpressionString(0)))
		        'components.add(Val(match.SubExpressionString(0)))
		      Elseif match.SubExpressionString(0) <> "." Then
		        components.append(match.SubExpressionString(0))
		        'components.add(match.SubExpressionString(0))
		      End If
		    End If
		    
		    match = component_re.Search
		  Loop Until match Is Nil
		  
		  Self.version = components
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = README
		Version numbering for anarchists and software realists.
		 
		Implements the standard interface for version number classes as
		described above.  A version number consists of a series of numbers,
		separated by either periods or strings of letters.  When comparing
		version numbers, the numeric components will be compared
		numerically, and the alphabetic components lexically.  The following
		are all valid version numbers, in no particular order:
		
		1.5.1
		1.5.2b2
		161
		3.10a
		8.02
		3.4j
		1996.07.12
		3.2.pl0
		3.1.1.6
		2g6
		11g
		0.960923
		2.2beta29
		1.13++
		5.5.kw
		2.0b1pl0
		
		In fact, there is no such thing as an invalid version number under
		this scheme; the rules for comparison are simple and predictable,
		but may not always give the results you want (for some definition
		of "want").
		    
	#tag EndNote

	#tag Note, Name = Rules
		This class is derived from the Python distutils.version package, and I have
		included the notes included in that package here.
		
		The rules according to Greg Stein:
		
		1) a version number has 1 or more numbers separated by a period or by
		   sequences of letters. If only periods, then these are compared
		   left-to-right to determine an ordering.
		2) sequences of letters are part of the tuple for comparison and are
		   compared lexicographically
		3) recognize the numeric components may have leading zeroes
		
		The LooseVersion class below implements these rules: a version number
		string is split up into a tuple of integer and string components, and
		comparison is a simple tuple comparison.  This means that version
		numbers behave in a predictable and obvious way, but a way that might
		not necessarily be how people *want* version numbers to behave.  There
		wouldn't be a problem if people could stick to purely numeric version
		numbers: just split on period and compare the numbers as tuples.
		However, people insist on putting letters into their version numbers;
		the most common purpose seems to be:
		  - indicating a "pre-release" version
		    ('alpha', 'beta', 'a', 'b', 'pre', 'p')
		  - indicating a post-release patch ('p', 'pl', 'patch')
		but of course this can't cover all version number schemes, and there's
		no way to know what a programmer means without asking him.
		
		The problem is what to do with letters (and other non-numeric
		characters) in a version number.  The current implementation does the
		obvious and predictable thing: keep them as strings and compare
		lexically within a tuple comparison.  This has the desired effect if
		an appended letter sequence implies something "post-release":
		eg. "0.99" < "0.99pl14" < "1.0", and "5.001" < "5.001m" < "5.002".
		
		However, if letters in a version number imply a pre-release version,
		the "obvious" thing isn't correct.  Eg. you would expect that
		"1.5.1" < "1.5.2a2" < "1.5.2", but under the tuple/lexical comparison
		implemented here, this just isn't so.
		
		Two possible solutions come to mind.  The first is to tie the
		comparison algorithm to a particular set of semantic rules, as has
		been done in the StrictVersion class above.  This works great as long
		as everyone can go along with bondage and discipline.  Hopefully a
		(large) subset of Python module programmers will agree that the
		particular flavour of bondage and discipline provided by StrictVersion
		provides enough benefit to be worth using, and will submit their
		version numbering scheme to its domination.  The free-thinking
		anarchists in the lot will never give in, though, and something needs
		to be done to accommodate them.
		
		Perhaps a "moderately strict" version class could be implemented that
		lets almost anything slide (syntactically), and makes some heuristic
		assumptions about non-digits in version number strings.  This could
		sink into special-case-hell, though; if I was as talented and
		idiosyncratic as Larry Wall, I'd go ahead and implement a class that
		somehow knows that "1.2.1" < "1.2.2a2" < "1.2.2" < "1.2.2pl3", and is
		just as happy dealing with things like "2g6" and "1.13++".  I don't
		think I'm smart enough to do it right though.
		
		In any case, I've coded the test suite for this module (see
		../test/test_version.py) specifically to fail on things like comparing
		"1.2a2" and "1.2".  That's not because the *code* is doing anything
		wrong, it's because the simple, obvious design doesn't match my
		complicated, hairy expectations for real-world version numbers.  It
		would be a snap to fix the test suite to say, "Yep, LooseVersion does
		the Right Thing" (ie. the code matches the conception).  But I'd rather
		have a conception that matches common notions about version numbers.
	#tag EndNote


	#tag Property, Flags = &h0
		version() As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private vstring As String
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
		#tag ViewProperty
			Name="version"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

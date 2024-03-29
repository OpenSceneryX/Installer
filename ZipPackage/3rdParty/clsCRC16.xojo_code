#tag Class
Protected Class clsCRC16
	#tag Method, Flags = &h0
		Shared Function CCITT(mb as MemoryBlock, ofs as Integer, len as Integer) As UInt16
		  if mCCITT = nil then
		    mCCITT = new clsCRC16 (&h1021)
		  end if
		  
		  return mCCITT.CRC16 (mb.StringValue(ofs,len), 0, false, false, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(intPolynomial as UInt16)
		  table (intPolynomial)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CRC16(strData as string, intInit as UInt16, blnRefin as boolean, blnRefout as boolean, intXORout as UInt16) As UInt16
		  dim intIndex   as integer
		  dim intLoop    as integer
		  dim intLen     as integer
		  dim intRCrc    as integer
		  dim strChars() as string
		  
		  intLen = lenb(strData)
		  
		  if blnRefin = true then
		    strChars = splitb(strData, "")
		    strData  = ""
		    
		    for intLoop = 0 to intLen - 1
		      strData = strData + chrb(val("&b" + reflect(bin(ascb(strChars(intLoop))), 8)))
		    next intLoop
		  end if
		  
		  for intLoop = 1 to intLen
		    intIndex = ((intInit \ 256) xor ascb(midb(strData, intLoop, 1))) and &hff
		    intInit   = crc16table(intIndex) xor (intInit * 256)
		    intInit   = intInit and &hffff
		  next intLoop
		  
		  if blnRefout = false then 
		    return intInit xor intXorout
		  else
		    intRCrc = val("&b" + reflect(bin(intInit), 16))
		    return intRCrc xor intXorout
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function fill(strChr as string, intAmount as integer) As string
		  dim intLoop as integer
		  dim strOut  as string
		  
		  for intLoop = 1 to intAmount
		    strOut = strOut + strChr
		  next intLoop
		  
		  return strOut
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function reflect(strBinary as string, intBits as integer) As string
		  dim intLen  as integer
		  dim intLoop as integer
		  dim strOut  as string
		  
		  intLen    = lenb(strBinary)
		  strBinary = leftb(fill("0", intBits - 1), intBits - intLen) + strBinary
		  
		  for intLoop = 1 to intBits
		    strOut = strOut + leftb(rightb(strBinary, intLoop), 1)
		  next intLoop
		  
		  return strOut
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub table(intPolynomial as Int32)
		  dim intCrc   as Int32
		  dim intTemp  as Int32
		  
		  for intLoop1 as integer = 0 to 255
		    intCrc = intLoop1 * 256
		    
		    for intLoop2 as integer = 0 to 7
		      if ((intCrc and &h8000) > 0) then
		        intTemp = intPolynomial
		      else
		        intTemp = 0
		      end if
		      intCrc = (intCrc * 2) xor (intTemp)
		    next intLoop2
		    
		    crc16table(intLoop1) = intCrc and &hffff
		  next intLoop1
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		
		  CRC-16 Checksum adapation for REALbasic
		  written by Eric D. Brown
		  improved by Thomas Tempelmann
		
		  See "CRC16 Catalogue" for possible checksum calls.
		
		-----------------------------------------------------------
		
		  CODE EXAMPLE:
		
		  dim checksum as new clsCrc16
		  dim intCrc   as integer
		  dim strData  as string
		
		  strData = "123456789"
		  intCrc  = checksum.crc16(strData, &h8005, &h0, true, true, &h0)
		  statictext1.text = left("000", 4 - len(hex(str(intCrc)))) + hex(str(intCrc))  //displays the CRC in 16-bit HEX (ie. 00FF)
		
		-----------------------------------------------------------
	#tag EndNote

	#tag Note, Name = CRC16 Catalogue
		
		     Name:  ARC
		Alias(es):  CRC-16; CRC-IBM; CRC-16/ARC; CRC-16/LHA
		     Call:  crc16({strData}, &h8005, &h0, true, true, &h0)
		    Notes:  N/A
		
		     Name:  CRC-16/AUG-2-CCITT
		Alias(es):  CRC-16/SPI-FUJITSU
		     Call:  crc16({strData}, &h1021, &h84c0, false, false, &h0)
		    Notes:  Init value given as 0x1D0F but this is an augment prepended to the message.  Not necessarily the algorithm used in FlexRay communications.
		
		     Name:  CRC-16/AUG-CCITT
		Alias(es):  N/A
		     Call:  crc16({strData}, &h1021, &h1d0f, false, false, &h0)
		    Notes:  Init value is equivalent to an augment of 0xFFFF prepended to the message.
		
		     Name:  CRC-16/BT-CHIP
		Alias(es):  N/A
		     Call:  crc16({strData}, &h1021, &hffff, true, false, &h0)
		    Notes:  Used to talk to an unidentified Bluetooth transceiver. Not necessarily the algorithm used in Bluetooth communications.
		              For implementations that take a single Reflect parameter, specify True and manually reflect the result.
		
		     Name:  CRC-16/BUYPASS
		Alias(es):  N/A
		     Call:  crc16({strData}, &h8005, &h0, false, false, &h0)
		    Notes:  Reported for the multi-threaded portion of the Buypass transaction processing network.
		
		     Name:  CRC-16/CCITT
		Alias(es):  CRC-16/CITT; CRC-CCITT
		     Call:  crc16({strData}, &h1021, &hffff, false, false, &h0)
		    Notes:  For the ITU-T algorithm see X.25.  Not the true CCITT algorithm according to Numeric Recipes, see KERMIT.
		
		     Name:  CRC-16/DNP
		Alias(es):  N/A
		     Call:  crc16({strData}, &h3d65, &h0, true, true, &hffff)
		    Notes:  N/A
		
		     Name:  CRC-16/EN-13757
		Alias(es):  N/A
		     Call:  crc16({strData}, &h3d65, &h0, false, false, &hffff)
		    Notes:  N/A
		
		     Name:  CRC-16/I-CODE
		Alias(es):  N/A
		     Call:  crc16({strData}, &h1021, &hffff, false, false, &hffff)
		    Notes:  Presented high byte first.  Remainder = 0x1D0F
		
		     Name:  CRC-16/MCRF4XX
		Alias(es):  N/A
		     Call:  crc16({strData}, &h1021, &hffff, true, true, &h0)
		    Notes:  Nibble oriented.  For byte wide algorithms swap nibbles of each byte.  CRC presented low nibble first.
		
		     Name:  CRC-16/USB
		Alias(es):  N/A
		     Call:  crc16({strData}, &h8005, &hffff, true, true, &hffff)
		    Notes:  CRC appended low byte first.  Remainder = 0x800D.
		
		     Name:  KERMIT
		Alias(es):  CRC-16/CCITT-TRUE
		crc16({strData}, &h1021, &hffff, false, false, &h0)
		     Call:  crc16({strData}, &h1021, &h0, true, true, &h0)
		    Notes:  'Same as' the CCITT algorithm according to Numeric Recipes.
		
		     Name:  MODBUS
		Alias(es):  N/A
		     Call:  crc16({strData}, &h8005, &hffff, true, true, &h0)
		    Notes:  CRC presented low byte first.
		
		     Name:  X-25
		Alias(es):  CRC-16/IBM-SDLC; CRC-16/ISO-HDLC
		     Call:  crc16({strData}, &h1021, &hffff, true, true, &hffff)
		    Notes:  Remainder = 0xF0B8.
		
		     Name:  XMODEM
		Alias(es):  ZMODEM; CRC-16/ACORN
		     Call:  crc16({strData}, &h1021, &h0, false, false, &h0)
		    Notes:  CRC presented MSB first.  Remainder = 0x0000.  Used in the MultiMediaCard interface.
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private crc16table(255) As int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mCCITT As clsCRC16
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

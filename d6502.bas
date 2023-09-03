'
' 6502 Symbolic Disassembler
'
'
Option explicit

Dim Op$(256)                ' Tables for Opcode and instruction length
Dim ilen%(256)
Dim lb%(4096)               ' Label Tab
Dim integer org = 0         ' Original start address of file data
Dim infile$  = ""           ' Input file name
Dim outfile$ = ""           ' Output file name
Dim temp$    = ""           ' Temporary string
Dim a$, c$, l$, o$, v$, r$  ' Output Line data
Dim integer label = 0       ' label to find or to insert
Dim integer found = 0       ' Found indicator
Dim integer posi  = 0       ' Position of data found
Dim integer xl, xm, xr      ' Binary search pointers
Dim integer i,j,k           ' General variables
Dim integer adre            ' program counter
Dim integer value           ' 2nd instruction byte
Dim integer Top   = -1      ' Actual top of label Tab
Dim integer inserr = 0      ' Insert errors

Dim integer clen, state, code, mode
Dim byte$

Const TRUE     = 1
Const FALSE    = 0
Const test     = FALSE

' Opcodes for the 6502 processor:
'      0     1     2     3     4     5     6     7
Data "BRK","ORA","DB ","DB ","DB ","ORA","ASL","DB "
Data "PHP","ORA","ASL","DB ","DB ","ORA","ASL","DB "
Data "BPL","ORA","DB ","DB ","DB ","ORA","ASL","DB "
Data "CLC","ORA","DB ","DB ","DB ","ORA","ASL","DB "
Data "JSR","AND","DB ","DB ","BIT","AND","ROL","DB "
Data "PLP","AND","ROL","DB ","BIT","AND","ROL","DB "
Data "BMI","AND","DB ","DB ","DB ","AND","ROL","DB "
Data "SEC","AND","DB ","DB ","DB ","AND","ROL","DB "
Data "RTI","EOR","DB ","DB ","DB ","EOR","LSR","DB "
Data "PHA","EOR","LSR","DB ","JMP","EOR","LSR","DB "
Data "BVC","EOR","DB ","DB ","DB ","EOR","LSR","DB "
Data "CLI","EOR","DB ","DB ","DB ","EOR","LSR","DB "
Data "RTS","ADC","DB ","DB ","DB ","ADC","ROR","DB "
Data "PLA","ADC","ROR","DB ","JMP","ADC","ROR","DB "
Data "BVS","ADC","DB ","DB ","DB ","ADC","ROR","DB "
Data "SEI","ADC","DB ","DB ","DB ","ADC","ROR","DB "
Data "DB ","STA","DB ","DB ","STY","STA","STX","DB "
Data "DEY","DB ","TXA","DB ","STY","STA","STX","DB "
Data "BCC","STA","DB ","DB ","STY","STA","STX","DB "
Data "TYA","STA","TXS","DB ","DB ","STA","DB ","DB "
Data "LDY","LDA","LDX","DB ","LDY","LDA","LDX","DB "
Data "TAY","LDA","TAX","DB ","LDY","LDA","LDX","DB "
Data "BCS","LDA","DB ","DB ","LDY","LDA","LDX","DB "
Data "CLV","LDA","TSX","DB ","LDY","LDA","LDX","DB "
Data "CPY","CMP","DB ","DB ","CPY","CMP","DEC","DB "
Data "INY","CMP","DEX","DB ","CPY","CMP","DEC","DB "
Data "BNE","CMP","DB ","DB ","DB ","CMP","DEC","DB "
Data "CLD","CMP","DB ","DB ","DB ","CMP","DEC","DB "
Data "CPX","SBC","DB ","DB ","CPX","SBC","INC","DB "
Data "INX","SBC","NOP","DB ","CPX","SBC","INC","DB "
Data "BEQ","SBC","DB ","DB ","DB ","SBC","INC","DB "
Data "SED","SBC","DB ","DB ","DB ","SBC","INC","DB "

' --------------------------------------------------
' Mode  Adressing    Format
' ====  ===========  ============================
'  1    Implied      none
'  2    ZP           "$";xx
'  3    (ZP),Y       "($";xx;"),Y"
'  4    (ZP,X)       "($";xx;",X)"
'  5    ZP,X         "$";xx;",X"
'  6    ZP,Y         "$";xx;",Y"
'  7    Branch       "$";xxxx
'  8    Immediate    "#$";xx
'  9    Accu         "A"
' 10    Abs.Ind.     "(";$xxxx;")"
' 11    Absolut      "$";xxxx
' 12    Abs.,X       "$";xxxx;",X"
' 13    Abs,Y        "$";xxxx;",Y"
' 14    DB-Pseudo    "$";xx;"  /  '";CHR$(xx);"'"
' --------------------------------------------------


' Addressing_Mode = High Nibble, Length = Low Nibble
'                   (ilen%>>4)   (ilen% and 15)
' --------------------------------------------------
'     0   1   2     3    4    5    6    7
Data 17, 66, 225, 225, 225, 34, 34, 225
Data 17, 130, 145, 225, 225, 179, 179, 225
Data 114, 50, 225, 225, 225, 82, 82, 225
Data 17, 211, 225, 225, 225, 195, 195, 225
Data 179, 66, 225, 225, 34, 34, 34, 225
Data 17, 130, 145, 225, 179, 179, 179, 225
Data 114, 50, 225, 225, 225, 82, 82, 225
Data 17, 211, 225, 225, 225, 195, 195, 225
Data 17, 66, 225, 225, 225, 34, 34, 225
Data 17, 130, 145, 225, 179, 179, 179, 225
Data 114, 50, 225, 225, 225, 82, 82, 225
Data 17, 211, 225, 225, 225, 195, 195, 225
Data 17, 66, 225, 225, 225, 34, 34, 225
Data 17, 130, 145, 225, 163, 179, 179, 225
Data 114, 50, 225, 225, 225, 82, 82, 225
Data 17, 211, 225, 225, 225, 195, 195, 225
Data 225, 66, 225, 225, 34, 34, 34, 225
Data 17, 225, 17, 225, 179, 179, 179, 225
Data 114, 50, 225, 225, 82, 82, 98, 225
Data 17, 211, 17, 225, 225, 195, 225, 225
Data 130, 66, 130, 225, 34, 34, 34, 225
Data 17, 130, 17, 225, 179, 179, 179, 225
Data 114, 50, 225, 225, 82, 82, 98, 225
Data 17, 211, 17, 225, 195, 195, 211, 225
Data 130, 66, 225, 225, 34, 34, 34, 225
Data 17, 130, 17, 225, 179, 179, 179, 225
Data 114, 50, 225, 225, 225, 82, 82, 225
Data 17, 211, 225, 225, 225, 195, 195, 225
Data 130, 66, 225, 225, 34, 34, 34, 225
Data 17, 130, 17, 225, 179, 179, 179, 225
Data 114, 50, 225, 225, 225, 82, 82, 225
Data 17, 211, 225, 225, 225, 195, 195, 225


' Main program part area ---------------------------------------------------
'---------------------------------------------------------------------------
Main:
  create_tables     ' Build Opcode- and Instruction Length Tables
  Cls
  Print
  Print "****    6502 Symbolic Disassembler, Version 1.1    ****"
  Print "      Written using MMBasic for DOS Box / Windows"
  Print "             (C) 2023 by Norbert Kollek"
  Print
  Print
  test_listing  ' Output Table if Test=True
  get_params    ' Enter Parameters for Disassembling
  Open infile$ For input As #1
  Cursor 6,MM.VRes : Print "Disassembling - Pass one ";
  Pause 750
  pass_one      ' Pass 1, collecting Labels
  Close #1      ' Like Rewind
  Cursor 40,MM.VRes : Print top; " Labels collected.";
  Pause 1500
  'End
  Open infile$ For input As #1
  Open outfile$ For output As #2
  Cursor 22,MM.VRes : Print "Pass two ";Space$(50);
  Pause 750
  pass_two      ' Disassembler output
  Close #1
  dump_labels   ' Dump EQUates for external labels
  Close #2
  Cls
  Print
  System "type bintoa65.asm"
End

Sub pass_one
  adre = org : state = 0
  label = adre : insert_label
  Do While Not Eof(#1)
    byte$ = Input$(1,#1)            ' Get a Byte from input file
    code  = Asc(byte$)              ' and his ASCII code
    Select Case state
      Case 0
        clen = ilen%(code) And 15   ' instruction length
        mode = ilen%(code)>>4       ' Addressing mode

        Select Case clen
          Case 1    ' One Byte instructions
            adre = adre + 1
          Case 2    ' Two Byte instructions
            adre = adre + 1
            If mode = 7 Then state = 4 Else state = 1
          Case 3    ' Three Byte instructions
            adre = adre + 1 : state = 2
        End Select
      Case 1
        label = code
        If top < 4096 Then insert_label Else inserr = inserr + 1
        adre = adre + 1 : state = 0         '2nd and last byte
      Case 2
        label = code
        adre = adre + 1 : state = 3         '2nd byte of three
      Case 3
        label = label + code * 256          '3rd byte of three
        adre = adre + 1 : state = 0
        If top < 4096 Then insert_label Else inserr = inserr + 1
      Case 4
        value = code                        ' Branches
        If code < 128 Then
          label = adre + 1 + code
        Else
          label = adre + 1 - (256-code)
        EndIf
        adre = adre + 1 : state = 0
        If top < 4096 Then insert_label Else inserr = inserr + 1
    End Select
  Loop
End Sub

Sub pass_two
  adre = org : state = 0 :l$ = "        " : o$ = "; SYMBOLIC DISASSEMBLY OF FILE "
  Print #2, l$; o$; UCase$(infile$)
  Print #2, l$; "; DATE: "; Date$; ", TIME: ";Time$; "  (c)2023 BY N. KOLLEK"
  Print #2, l$; ";"
  Print #2, l$; "ORG $"; Hex$(org,4)
  Print #2, l$; ";"
  '
  Do While Not Eof(#1)
    byte$ = Input$(1,#1)    ' Get a Byte from input file
    code  = Asc(byte$)      ' and its ASCII code


'          Case 10   ' Abs. Indirect , 3 Byte
'          Case 11   ' Absolut , 3 Byte
'          Case 12   ' Absolut,X , 3 Byte
'          Case 13   ' Absolut,Y , 3 Byte

    Select Case state
      Case 0
        clen = ilen%(code) And 15   ' instruction length
        mode = ilen%(code)>>4       ' Addressing mode
        label = adre : search_label
        If found = 1 Then l$ = "L"+Hex$(adre,4)+":  " Else l$ = "        "
        a$ = Hex$(adre,4) + " " : c$ = Hex$(code,2) + " " : o$ = op$(code) + " " : r$=""
        Select Case clen
          Case 1    ' --------------------------- one byte instructions
            Select Case mode
              ' For Mode 1 - Implied , 1 Byte, no action neccessary
              Case 9    ' Accu , 1 Byte
                o$ = o$ + "A"
              Case 14   ' DB-Pseudo , 1 Byte
                r$=""
                If code > 31 And code < 127 Then
                  r$ = " / '" + Chr$(code) + "'"
                End If
            End Select
            o$ = Left$(o$+"                  ",18)
            Print #2,l$;o$; ";"; a$; c$; "       ";
            If r$<>"" Then Print #2, r$ Else Print #2, ""
            adre = adre + clen
          Case 2    ' ----------------------------- two byte instructions
            adre = adre + 1 : state = 1
          Case 3        ' ----------------------------- three byte instructions
            adre = adre + 1 : state = 2
        End Select
      Case 1
        value = code : c$ = c$ + Hex$(code,2) + " "
        label = code : search_label
        If Not found Then v$ = "$" + Hex$(value,2) Else v$ = "L" + Hex$(label,2)
        Select Case mode
          ' Nothing to do for mode 2, ZP
          Case 3    ' (ZP),Y , 2 Byte
            v$ = "(" + v$ +"),Y"
          Case 4    ' (ZP,X) , 2 Byte
            v$ = "(" + v$ + ",X)"
          Case 5    ' ZP,X , 2 Byte
            v$ = v$ + ",X"
          Case 6    ' ZP,Y , 2 Byte
            v$ = v$ + ",Y"
          Case 7    ' Branch , 2 Byte
            v$ = "" : value = code
            If value < 128 Then label = adre + 1 + value Else label = adre + 1 - (256 -value)
            search_label
            If Not found Then v$ = "$" + Hex$(label,4) Else v$ = "L" + Hex$(label,4)
          Case 8    ' Immediate , 2 Byte
            v$ = "#" + v$ : r$ = ""
            If code > 31 And code < 127 Then r$ = "     / '" + Chr$(code) + "'"
        End Select
        o$ = o$ + v$
        o$ = Left$(o$+"                  ",18)
        Print #2, l$;o$;";";a$;c$;
        If r$ <> "" Then Print #2, r$ Else Print #2,""
        adre = adre + 1 : state = 0         '2nd and last byte
      Case 2
        label = code : c$ = c$ + Hex$(code,2) + " "
        adre = adre + 1 : state = 3         '2nd byte of three
      Case 3
        label = label + code * 256          '3rd byte of three
        c$ = c$ + Hex$(code,2) + " "
        o$ = o$ + "L" + Hex$(label,4) : o$=Left$(o$ + "                  ",18)
        Print #2,l$;o$;";";a$;c$
        adre = adre + 1 : state = 0
    End Select
  Loop
  adre = adre -1
End Sub


Sub dump_labels
  l$ = "        "
  Print #2,l$; ";"
  Print #2,l$;"; EXTERNAL EQUATES:"
  Print #2,l$;";"
  For i = 0 To top
    If (lb%(i) < org) Or (lb%(i) > adre) Then
      v$ = Hex$(lb%(i),4)
      Print #2, "L"; v$; "   EQU   $"; v$
    End If
  Next
  Print #2, l$; ";"
  Print #2, l$; "; SYMBOL TABLE REFERENCE:"
  Print #2, l$; ";"
  For i = 0 To top Step 4
    Print #2, l$; "; " ;
    For j = 0 To 3
      If (i+j) > top Then Exit For
      v$ = Hex$(lb%(i+j),4)
      Print #2, "L";v$; " "; v$; "    ";
    Next j
    Print #2,""
  Next i
  Print #2, l$; ";"
  Print #2, l$; "END"
End Sub


Sub get_params
  Do
    Cursor 18, 6 : Print Space$(39);
    Cursor 0,6 : Input "     ORG-Address: ", temp$
    If temp$ = "" Then
      org = 256 : Cursor 18,6 : Print Hex$(org,4);
    Else
      If Left$(temp$,1) = "$" Then hextoint
      org = Val(temp$)
    End If
  Loop Until org > 0 And org < 65536
  Cursor 0,7 : Input "     Input file : ", temp$
  If temp$ = "" Then
    infile$  = "eprom_a0.bin"
    outfile$ = "bintoa65.asm"
    Cursor 18,7 : Print infile$
    Print "     Output file: ";outfile$
  Else
    Input "     Output file: ", temp$
    If temp$ = "" Then outfile$ = "bintoasm.asm" Else outfile$ = temp$
  End If
End Sub

Sub hextoint
  temp$ = "&h" + Right$(temp$,Len(temp$)-1)
End Sub

Sub create_tables
  For i = 0 To 255    'Read in Opcode table
    Read op$(i)
  Next i
  '
  For i = 0 To 255    'Read in Instruction length table
    Read ilen%(i)
  Next i
End Sub

Sub test_listing      'List tables if Test% = True
  If test Then
    For i=0 To 255
      Print "  ";Hex$(i,2); "  "; Str$(i,3);"   ";op$(i); "  "; Str$(ilen%(i) And 15,2);"  ", Str$(ilen%(i)>>4,2)
    Next i
  End If
End Sub

'Insert a label into Table lb%() if not already there
'
Sub insert_label
  If top < 0 Then insert_it : Exit Sub   'First entry in Table
  search_label                           'Binary search in Table
  If Not found Then insert_it            'Insert if not in Table
End Sub

'Binary Search
'
Sub search_label
  xl = 0 : xr = top : found = 0
  While xl < xr
    xm=(xl + xr)\2
    If lb%(xm) < label Then xl = xm+1 Else xr = xm
  Wend
  If lb%(xr)=label Then found = 1 : posi = xr
End Sub

'Insert into Table to right position
'
Sub insert_it
  If top < 0 Then lb%(0) = label : top = 0: Exit Sub
  top = top + 1
  For i = top-1 To 0 Step -1
    If label > lb%(i) Then
      lb%(i + 1) = label : Exit For
    Else
      lb%(i + 1) = lb%(i) : If i=0 Then lb%(i) = label
    End If
  Next
End Sub
#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir%

; Author  : Daniel van den Oord
; Date    : 20-04-2012
; Purpose : apply variables to gui
;
; 20-04-2012 (new):
;

if       ( VarCheck = "iPhone 3" )
  Picker = 1
else if  ( VarCheck = "iPhone 4" )
  Picker = 2
else if  ( VarCheck = "iPad 1+2" )
  Picker = 3
else if  ( VarCheck = "iPad New" )
  Picker = 4
else
  Picker = 5

WinGetPos, X, Y, Width, Height, ahk_class rfb::win32::DesktopWindowClass
if ( Width = 998 and Height = 656 ) {
  if ( Picker != 2  )
    MsgBox, We have detected an iPhone 4 but u selected something else.
  Picker = 2
} else if ( Width = 1040 and Height = 806 ) {
  if ( Picker != 3  )
    MsgBox, We have detected an iPad 1 or 2 but u selected something else.
  Picker = 3
}

GuiControl, Choose, MyCheck, %Picker%
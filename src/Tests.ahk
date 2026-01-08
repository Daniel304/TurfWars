#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir%

; Author  : Daniel van den Oord
; Date    : 20-04-2012
; Purpose : Test scripts
;
; 20-04-2012 (new):
;    ongoing

#a::
WinGet, active_id, ID, ahk_class rfb::win32::DesktopWindowClass
colour1 := PixelColor(558, 470, active_id)
MsgBox, newfunction : %colour1%
return
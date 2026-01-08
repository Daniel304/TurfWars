#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir%

; Author  : Daniel van den Oord
; Date    : 16-04-2012
; Purpose : Check weather or not VNC is running.
;
; 16-04-2012 (new):
;    Start VNC when starting program
;    Check and if needed restart VNC during run

IfWinExist ahk_class rfb::win32::DesktopWindowClass 
{
    WinActivate
}
else 
{
    Run bin/vncviewer.exe
    WinWait ahk_class rfb::win32::DesktopWindowClass
    WinActivate
}

checkVnc() {
  IfWinNotExist ahk_class rfb::win32::DesktopWindowClass 
  {
    MsgBox, "VNC Crashed restarting vnc"
    Run bin/vncviewer.exe
    WinWait ahk_class rfb::win32::DesktopWindowClass
    WinActivate
  }
}
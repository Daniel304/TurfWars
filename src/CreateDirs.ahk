#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir%

; Author  : Daniel van den Oord
; Date    : 16-04-2012
; Purpose : Creates the default directories if needed
;
; 16-04-2012(new):
;    Message box on fail

FileCreateDir, %A_WorkingDir%\etc
if ErrorLevel {
  MsgBox Could not create "%A_WorkingDir%\etc"
}

FileCreateDir, %A_WorkingDir%\backup
if ErrorLevel {
  MsgBox Could not create "%A_WorkingDir%\backup"
}

FileCreateDir, %A_WorkingDir%\codes
if ErrorLevel {
  MsgBox Could not create "%A_WorkingDir%\codes"
}

FileCreateDir, %A_WorkingDir%\codes\temps
if ErrorLevel {
  MsgBox Could not create "%A_WorkingDir%\codes\temps"
}
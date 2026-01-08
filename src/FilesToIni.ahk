#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir%

; Author  : Daniel van den Oord
; Date    : 20-04-2012
; Purpose : Write file info to ini file.
;
; 20-04-2012 (new):
;    Relocated to seperate file

FilesToIni(fullFilename) {
  FileRead, MainEdit, %fullFilename%  ; Read the file's contents into the variable.
  StringReplace, OutputVar, MainEdit, `n, `n, useerrorlevel
  Lines := ErrorLevel + 1
  IniRead, filecheck, %A_WorkingDir%\etc\tw.ini, %fullFilename%, done, 0
  if ( filecheck = "" ) {
    IniWrite, %Lines%, %A_WorkingDir%\etc\tw.ini, %fullFilename%, lines
    IniWrite, done, %A_WorkingDir%\etc\tw.ini, %fullFilename%, 0
  }
}
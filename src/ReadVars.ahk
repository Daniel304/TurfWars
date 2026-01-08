#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir%

; Author  : Daniel van den Oord
; Date    : 20-04-2012
; Purpose : Read Global variables from ini files
;
; 20-04-2012 (new):
;    

IniRead, VarCheck, %A_WorkingDir%\etc\tw.ini, Global, check , 0
IniRead, VarSubmitMin, %A_WorkingDir%\etc\tw.ini, Global, submitmin, 2
IniRead, VarSubmitMax, %A_WorkingDir%\etc\tw.ini, Global, submitmax, 6
IniRead, VarSleep, %A_WorkingDir%\etc\tw.ini, Global, sleep, 10
IniRead, VarPause, %A_WorkingDir%\etc\tw.ini, Global, pause, 10
IniRead, VarType, %A_WorkingDir%\etc\tw.ini, Global, type, 100
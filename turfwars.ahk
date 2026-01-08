#NoEnv
#SingleInstance force
;#Warn
#Include %A_ScriptDir%

#Include lib\StdLibs.ahk

#Include src\CreateError.ahk
#Include src\CreateDirs.ahk
#Include src\ReadVars.ahk
#Include src\CheckVnc.ahk
#Include src\SendToPhone.ahk
#Include src\AboutText.ahk
#Include src\CheckTw.ahk
#Include src\SleepTime.ahk
#Include src\StartFile.ahk
#Include src\FilesToIni.ahk
#Include src\ProcessTemps.ahk
#Include src\AutoHeal.ahk

SendMode, Input
SetWorkingDir %A_ScriptDir%
SetStoreCapslockMode, Off
SetKeyDelay, VarType, VarType
IsPaused := false
KeepWinZRunning := false
FileCounter = 0
CounterInviteCode := 0
CounterWrongCode := 0
CounterDupCode := 0
  
#Include src\Gui.ahk

return

#Include src\GuiControls.ahk

#Include src\Tests.ahk
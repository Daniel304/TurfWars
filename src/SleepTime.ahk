#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir%

; Author  : Daniel van den Oord
; Date    : 20-04-2012
; Purpose : Sleep longer period of time etween N*25 codes.
;
; 20-04-2012 (new):
;    Relocated to seperate file

SleepTime() {
  GuiControlGet MyPause
  MinSleep   := ( MyPause - 2) * 60000
  MaxSleep   := ( MyPause + 2) * 60000
  Random, DelayTime , MinSleep, MaxSleep
  DelayTimeSeconds := DelayTime / 1000

  Delayed = %DelayTimeSeconds%, seconds

  FormatTime, mmss, %Delayed%, HH:mm:ss

  SB_SetText("Turfwars is sleeping" . mmss)

  Sleep %DelayTime%
}
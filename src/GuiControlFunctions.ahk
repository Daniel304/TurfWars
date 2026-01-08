#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir%

; Author  : Daniel van den Oord
; Date    : 21-04-2012
; Purpose : Gui Control functions
;
; 21-04-2012:
;   - Added reset gui

ResetGuiWhenDone(){
  GuiControl,, MyProgressBar,
  GuiControl,, MyNumberOfFiles, -
  GuiControl,, MyFileName, -
  GuiControl,, MyNumberCodes, 0 lines
  GuiControl,, MyProgress, 0/0
  GuiControl,, MyCode, -
  SelectedFileNames = 
  FileCounter = 0
}
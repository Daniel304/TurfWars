#Include %A_ScriptDir%
#Include src\GuiControlFunctions.ahk
SetWorkingDir %A_ScriptDir%
/*
  Author  : Daniel van den Oord
  Date    : 16-04-2012
  Purpose : Creates the default directories if needed

  30-04-2012:
  - Added Heal button
  - Added min and max submit time

  21-04-2012:
  - Download temps button
  - Add to Queue button for temps
  
*/

ButtonAddQueue:
  FilenameOrig = %A_WorkingDir%\codes\temps\twdb-new.lst
  FilenameNew = %A_WorkingDir%\codes\twdb-new.lst
  FileMove, %FilenameOrig%, %FilenameNew%, 1
  FileCounter += 1
  FilesToIni(FilenameNew)
  SelectedFileNames .= FilenameNew . "`n"
  GuiControl,, MyNumberOfFiles, (0/%FileCounter%)
return

ButtonDownload:
  ProcessTemps()
return

CCheck:
  GuiControlGet, MyCheck
  IniWrite, %MyCheck% , %A_WorkingDir%\etc\tw.ini, Global, check
return

CSubmitMin:
  GuiControlGet, MySubmitMin
  if ( MySubmitMin < 2 ) {
    Gui, Font, cRed Bold, Verdana
  } else {
    Gui, Font, S10 CDefault, Verdana
  }
  GuiControl, Font, TextSubmitMin
  IniWrite, %MySubmitMin% , %A_WorkingDir%\etc\tw.ini, Global, submitmin
return

CSubmitMax:
  GuiControlGet, MySubmitMax
  if ( MySubmitMax < 2 ) {
    Gui, Font, cRed Bold, Verdana
  } else {
    Gui, Font, S10 CDefault, Verdana
  }
  GuiControl, Font, TextSubmitMax
  IniWrite, %MySubmitMax% , %A_WorkingDir%\etc\tw.ini, Global, submitmax
return

CType:
  GuiControlGet, MyType
  if ( MyType < 51 ) {
    Gui, Font, cRed Bold, Verdana
  } else {
    Gui, Font, S10 CDefault, Verdana
  }
  GuiControl, Font, TextType
  IniWrite, %MyType% , %A_WorkingDir%\etc\tw.ini, Global, type
return

CSleep:
  GuiControlGet, MySleep
  if ( MySleep < 2 ) {
    Gui, Font, cRed Bold, Verdana
  } else {
    Gui, Font, S10 CDefault, Verdana
  }
  GuiControl, Font, TextSleep
  IniWrite, %MySleep% , %A_WorkingDir%\etc\tw.ini, Global, sleep
return

CPause:
  GuiControlGet, MyPause
  if ( MyPause < 5 ) {
    Gui, Font, cRed Bold, Verdana
  } else {
    Gui, Font, S10 CDefault, Verdana
  }
  GuiControl, Font, TextPause
  IniWrite, %MyPause% , %A_WorkingDir%\etc\tw.ini, Global, pause
return

ButtonPause:
  if IsPaused {
     Pause off
     IsPaused := false
     GuiControl,, PauseButton, Pause
  } else {
     SetTimer, Pause, 10
  }
return

ButtonHeal:
  GuiControlGet, MyCheck
  if (MyCheck != "iPhone 4" and MyCheck != "iPad 1+2" ) {
    MsgBox, Sorry this only works for iPhone 4
    return
  }
  if IsHealing {
    SetTimer, Healing, Off
    IsHealing := false
    GuiControl,, HealButton, Heal
    SB_SetText("TurfWars in auto-protect mode: off")
  } else {
    MsgBox, Set Turfwars in The HomeScreen before continuing.
    SetTimer, Healing, 10
  }
return

Healing:
  SetTimer, Healing, Off
  WinGet, tw_id, ID, ahk_class rfb::win32::DesktopWindowClass
  IsHealing := true
  GuiControl,, HealButton, Healing
  GuiControlGet, MyCheck
  Loop
  {
    autoHeal(MyCheck, tw_id)
    if not IsHealing
      break
  }
return

Pause:
  SetTimer, Pause, off
  IsPaused := true
  GuiControl,, PauseButton, Continue
  Pause, on
return

ButtonAbout:
  aboutText := aboutText()
  Gui, 2:+owner1
  Gui +Disabled
  Gui, 2:Add, Text,,
  Gui, 2:Add, Text,, %aboutText%
  Gui, 2:Add, Button, w90 h30 Default, OK
  Gui, 2:Show
return

2ButtonOK:
2GuiClose:
2GuiEscape:
  Gui, 1:-Disabled
  Gui Destroy
return

ButtonPunch:
  Lines = 0
  Counter = 0
  Loop, parse, SelectedFileNames, `n
  {
    Counter += 1
    SplitPath, A_LoopField, name
    if ( name = "" ) {
      break
    }
    FileRead, MainEdit, %A_LoopField%  ; Read the file's contents into the variable.
    StringReplace, OutputVar, MainEdit, `n, `n, useerrorlevel
    Lines := ErrorLevel + 1
    GuiControl,, MyFileName, %name%
    GuiControl,, MyNumberCodes, %Lines% lines
    GuiControl,, MyNumberOfFiles, (%Counter%/%FileCounter%)
    StartFile(A_LoopField)
  }
  ResetGuiWhenDone()
return

; open file window
ButtonFile:
  SelectedFileNames =
  Gui +OwnDialogs
  FileSelectFile, files, M3,, Open File, Text Documents (*.txt)
  if ( files = ) {
    return
  }
  Loop, parse, files, `n
  {
    if ( a_index = 1 ) {
      directory := A_LoopField
    } else {
      FileCounter += 1
      Filename := A_LoopField
      FilesToIni(directory . "\" . Filename)
      SelectedFileNames .= directory . "\" . Filename . "`n"
    }
  }
  GuiControl,, MyNumberOfFiles, (0/%FileCounter%)
return

ButtonExit:
ExitApp

GuiClose:
ExitApp
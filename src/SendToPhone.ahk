; Author  : Daniel van den Oord
; Date    : 16-04-2012
; Purpose : Sends code to VNC
;
; 30-04-2012:
;    Added code detection counters
;    Added Min and MAx submit speed
;    Fixed character not being deleted
;
; 16-04-2012(new):
;    Relocated to seperate file

sendToPhone(code) {
  GuiControlGet MySubmitMin
  GuiControlGet MySubmitMax
  LineLength := StrLen(code) + 2
  MinDelay   := (LineLength * 100 ) + ( MySubmitMin * 1000 ) - 1000
  MaxDelay   := (LineLength * 100 ) + ( MySubmitMax * 1000 ) - 1000
  Random, DelayTime , %MinDelay%, %MaxDelay%
  ControlSend,, %code%, ahk_class rfb::win32::DesktopWindowClass
  Sleep %DelayTime%
  ControlSend,, {Enter}, ahk_class rfb::win32::DesktopWindowClass
  sleep 2000
  readCode()
  ControlSend,, {Backspace %LineLength%}, ahk_class rfb::win32::DesktopWindowClass
}

readCode() {
  WinGet, active_id, ID, ahk_class rfb::win32::DesktopWindowClass
  
  GuiControlGet, MyCheck
  if (MyCheck = "iPhone 3") {
  } else if (MyCheck = "iPhone 4") {
    Done_Button := PixelColor(580, 530, active_id)
    if ( Done_button = 2253277 ) {
      allready_entered := PixelColor(45, 386, active_id)
      allready_in := PixelColor(48, 395, active_id)
      not_exist := PixelColor(80, 406, active_id)
      exist_1line := PixelColor(46, 412, active_id)
      exist_2line := PixelColor(46, 390, active_id)
    } else {
      allready_entered := PixelColor(45, 500, active_id)
      allready_in := PixelColor(48, 509, active_id)
      not_exist := PixelColor(80, 520, active_id)
      exist_1line := PixelColor(46, 526, active_id)
      exist_2line := PixelColor(46, 504, active_id)
    }
  } else if (MyCheck = "iPad 1+2") {
    allready_entered := PixelColor(116, 317, active_id)  ; allready invited
    allready_in      := PixelColor(116, 317, active_id)  ; allready in mob
    not_exist        := PixelColor(151, 329, active_id)  ; invalid code
    exist_1line      := PixelColor(114, 328, active_id)  ; exists
  } else if (MyCheck = "iPad New") {
  } else if (MyCheck = "None") {
  }

  if ( allready_entered = 14473933 ) {
    CounterDupCode += 1
  } else if ( allready_in = 14473933 and not_exist = 14473933 ) {
    CounterWrongCode += 1
  } else if ( allready_in = 14473933 ) {
    CounterDupCode += 1
  } else if ( exist_1line = 14473933 ) {
    CounterInviteCode += 1
    SplitPath, SelectedFileName, name
    FileAppend, %TwCode%`n, %A_WorkingDir%\%name%.new
  } else if ( exist_2line = 14473933 ) {
    CounterInviteCode += 1
    SplitPath, SelectedFileName, name
    FileAppend, %TwCode%`n, %A_WorkingDir%\%name%.new
  } else {
    CounterDupCode += 1
  }

  GuiControl,, MyInviteCode, %CounterInviteCode%
  GuiControl,, MyWrongCode, %CounterWrongCode%
  GuiControl,, MyDupCode, %CounterDupCode%

  return
}


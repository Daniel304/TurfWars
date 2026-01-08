; Author  : Daniel van den Oord
; Date    : 16-04-2012
; Purpose : Processing File
;
; 16-04-2012(new):
;    Relocated to seperate file

StartFile(FileName) {
  Random, RandomPause, -2, 2
  Loop
  {
    checkVnc()
    FileReadLine, TwCode, %FileName%, %A_Index%
    if ( ErrorLevel ) {
      break
    }
    TwCode = %TwCode%

    GuiControlGet, MyType
    SetKeyDelay, MyType , MyType

    Number := ( A_Index / Lines ) * 100

    ; check if tw is running
    CheckTw(TwCode)

    ; create Random Error
    Random, CreateError, 1, 10
    if ( CreateError = 5 ) {
      WrongCode =
      loop 5 {
        WrongCode := createError(TwCode)
        if ( WrongCode != TwCode ) {
          break
        }
      }
      GuiControl,, MyCode , %WrongCode% (wrong)
      GuiControl,, MyProgressBar, %Number%
      GuiControl,, MyProgress, %A_Index% / %Lines%
      SendToPhone(WrongCode)
      #CodeReturn := ReadCode
      Random, SleepAfterError, 2000, 6000
      Sleep %SleepAfterError%
    }

    GuiControl,, MyCode , %TwCode%
    GuiControl,, MyProgressBar, %Number%
    GuiControl,, MyProgress, %A_Index% / %Lines%

    ; send to iPhone
    SendToPhone(TwCode)

    #CodeReturn := ReadCode

    ; create backup
    SplitPath, SelectedFileName, name
    FileAppend, %TwCode%`n, %A_WorkingDir%\backup\%name%.backup
    GuiControlGet, MySleep

    ; sleep time
    GuiControlGet, MySleep
    ModuLo := Mod(A_Index, ((MySleep + RandomPause) * 25))
    if ( %ModuLo% = 0 ) {
      Random, RandomPause, -2, 2
      SleepTime()
    }
  }
}
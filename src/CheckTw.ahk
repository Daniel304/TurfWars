#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir%

; Author  : Daniel van den Oord
; Date    : 20-04-2012
; Purpose : Check if Turwars is running.
;
; 20-04-2012 (new):
;    Relocated to seperate file

checkTw(arg) {
  WinGet, active_id, ID, ahk_class rfb::win32::DesktopWindowClass

  GuiControlGet, MyCheck
  if (MyCheck = "iPhone 3") {
    SB_SetText("Turfwars should be Running")
  } else if (MyCheck = "iPhone 4") {
    CheckColor1 := PixelColor(236, 118, active_id)
    CheckColor2 := PixelColor(521, 118, active_id)
    while ((CheckColor1 != 16777215) and (CheckColor2 != 16777215)) {
      If ( MyCheck = "none" ) {
        Break
      }
      SB_SetText("TurfWars crashed at:" . arg)
      Sleep 1000
      CheckColor1 := PixelColor(236, 118, active_id)
      CheckColor2 := PixelColor(521, 118, active_id)
      GuiControlGet, MyCheck
    }
  } else if (MyCheck = "iPad 1+2") {
    CheckColor1 := PixelColor(987, 484, active_id)
    CheckColor2 := PixelColor(987, 342, active_id)
    CheckColor3 := PixelColor(448, 75, active_id)
    CheckColor4 := PixelColor(590, 75, active_id)

    while ((CheckColor1 != 16777215) and (CheckColor2 != 16777215)) and ((CheckColor3 != 16777215) and (CheckColor4 != 16777215) ) {
      If ( MyCheck = "none" ) {
        Break
      }
      SB_SetText("TurfWars crashed at:" . arg)
      Sleep 1000
      CheckColor1 := PixelColor(987, 484, active_id)
      CheckColor2 := PixelColor(987, 342, active_id)
      CheckColor3 := PixelColor(448, 75, active_id)
      CheckColor4 := PixelColor(590, 75, active_id)
      GuiControlGet, MyCheck
    }
  } else if (MyCheck = "iPad New") {
    SB_SetText("Turfwars should be Running")
  } else if (MyCheck = "None") {
    SB_SetText("Turfwars should be Running")
  }
  SB_SetText("Turfwars is Running")
}
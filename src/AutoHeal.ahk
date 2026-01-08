#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir%

; Author  : Daniel van den Oord
; Date    : 20-04-2012
; Purpose : AutoHeal.
;
; 30-04-2012 (new):
;    AutoHeal iphone4

autoHeal(MyCheck, tw_id) {
  if (MyCheck = "iPhone 4") {
    autoHealIphone4(tw_id)
  } else if (MyCheck = "iPad 1+2") {
    autoHealIpad12(tw_id)
  }
  Sleep 200
  return
}

autoHealIpad12(tw_id) {
  SB_SetText("TurfWars in auto-protect mode: idle (ipad)")
  CheckColor1 := PixelColor(433, 762, tw_id)
  if ( CheckColor1 = "14288914" ) {
    SB_SetText("TurfWars in auto-protect mode: attacked")
    ControlClick, x860 y550, ahk_class rfb::win32::DesktopWindowClass
    Sleep 3000
    CheckColor2 := PixelColor(58, 430, tw_id)
    if ( CheckColor2 = "5280511" ) {
      SB_SetText("TurfWars in auto-protect mode: healing")
      ControlClick, x58 y430, ahk_class rfb::win32::DesktopWindowClass

    }
    Sleep 2000
    CheckColor3 := PixelColor(558, 470, tw_id)
    while ( CheckColor3 = "16722185" ) {
      ControlClick, x558 y470, ahk_class rfb::win32::DesktopWindowClass
      sleep 2000
      CheckColor3 := PixelColor(558, 470, tw_id)
    }    ControlClick, x414 y780, ahk_class rfb::win32::DesktopWindowClass
    Sleep 500
    ControlClick, x310 y780, ahk_class rfb::win32::DesktopWindowClass
    Sleep 500
    ControlClick, x310 y780, ahk_class rfb::win32::DesktopWindowClass
  }
}

autoHealIphone4(tw_id) {
  SB_SetText("TurfWars in auto-protect mode: idle (iphone)")
  CheckColor1 := PixelColor(250, 914, tw_id)
  if ( CheckColor1 = "14759229" ) {
    SB_SetText("TurfWars in auto-protect mode: attacked")
    ControlClick, x477 y834, ahk_class rfb::win32::DesktopWindowClass
    Sleep 3000
    CheckColor2a := PixelColor(110, 533, tw_id)
    CheckColor2b := PixelColor(110, 566, tw_id)
    CheckColor2c := PixelColor(110, 599, tw_id)
    SB_SetText("TurfWars in auto-protect mode: healing")
    if ( CheckColor2a = "5280511" ) {
      ControlClick, x110 y533, ahk_class rfb::win32::DesktopWindowClass
    } else if ( CheckColor2b = "5280511" ) {
      ControlClick, x110 y566, ahk_class rfb::win32::DesktopWindowClass
    } else if ( CheckColor2b = "5280511" ) {
      ControlClick, x110 y596, ahk_class rfb::win32::DesktopWindowClass
    }
    Sleep 2000
    CheckColor3 := PixelColor(275, 580, tw_id)
    while ( CheckColor3 = "16722185" ) {
      ControlClick, x275 y580, ahk_class rfb::win32::DesktopWindowClass
      sleep 2000
      CheckColor3 := PixelColor(275, 580, tw_id)
    }
    ControlClick, x200 y950, ahk_class rfb::win32::DesktopWindowClass
    Sleep 500
    ControlClick, x80 y950, ahk_class rfb::win32::DesktopWindowClass
    Sleep 500
    ControlClick, x80 y950, ahk_class rfb::win32::DesktopWindowClass
  }
}
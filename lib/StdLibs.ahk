/*
  Standaard libraries
*/

grep(h, n, ByRef v, s = 1, e = 0, d = "") {
	v =
	StringReplace, h, h, %d%, , All
	Loop
		If s := RegExMatch(h, n, c, s)
			p .= d . s, s += StrLen(c), v .= d . (e ? c%e% : c)
		Else Return, SubStr(p, 2), v := SubStr(v, 2)
}

PixelColor(pc_x, pc_y, pc_wID)
{   
   If pc_wID
   {
      pc_hDC := DllCall("GetDC", "UInt", pc_wID)
      WinGetPos, , , pc_w, pc_h, ahk_id %pc_wID%
      pc_hCDC := DllCall("CreateCompatibleDC", "UInt", pc_hDC)
      pc_hBmp := DllCall("CreateCompatibleBitmap", "UInt", pc_hDC, "Int", pc_w, "Int", pc_h)
      pc_hObj := DllCall("SelectObject", "UInt", pc_hCDC, "UInt", pc_hBmp)
      DllCall("PrintWindow", "UInt", pc_wID, "UInt", pc_hCDC, "UInt", 0)
      pc_fmtI := A_FormatInteger
      SetFormat, IntegerFast, Hex
      pc_c := DllCall("GetPixel", "UInt", pc_hCDC, "Int", pc_x, "Int", pc_y, "UInt")
      pc_c := pc_c >> 16 & 0xff | pc_c & 0xff00 | (pc_c & 0xff) << 16
      pc_c .= ""
      SetFormat, IntegerFast, %pc_fmtI%
      DllCall("DeleteObject", "UInt", pc_hBmp)
      DllCall("DeleteDC", "UInt", pc_hCDC)
      DllCall("ReleaseDC", "UInt", pc_wID, "UInt", pc_hDC)
      Return pc_c
   }
}
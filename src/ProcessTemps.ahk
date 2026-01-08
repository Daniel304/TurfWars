; Author  : Daniel van den Oord
; Date    : 16-04-2012
; Purpose : Processing Temps
;
; 20-04-2012:
;   - Make sure nothing goes to waste if script was interrupted
;   - More Errorlevels build in
;   - Changed to literal strings
;   - Counters work corectly
;
; 20-04-2012(new):
;   - Process Tempcodes  

#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir%

FormatTime, TimeString,, yyyyMMddhhmmss

ProcessTemps() {
   ProcessTWDB(ttotal, tnew, tdup, told)
   GuiControl,, MyTotTemps, Tot: %ttotal%
   GuiControl,, MyNewTemps, New: %tnew%
   GuiControl,, MyDupTemps, Dup: %tdup%
   GuiControl,, MyOldTemps, Old: %told%
}

ProcessTWDB(byref tot, byref new, byref dup, byref old){
  tot := 0
  new := 0
  dup := 0
  old := 0

  TwdbDownload   = http://www.turfwarsdb.com/Codes/temp/
  HtmlFileName   = %A_WorkingDir%\codes\temps\twdb.html
  BackupFileName = %A_WorkingDir%\codes\temps\twdb.lst
  NewFileName    = %A_WorkingDir%\codes\temps\twdb-new.lst
  OldFileName    = %A_WorkingDir%\codes\temps\twdb-old.lst

  FileCopy, %BackupFileName%, %OldFileName%,1
  FileCopy, %OldFileName%, %BackupFileName%,1

  UrlDownloadToFile, %TwdbDownload%, %HtmlFileName%
  if ErrorLevel
    MsgBox, Something failed
  
  FileRead, OldCodes, %OldFileName%
  if ErrorLevel
    OldCodes := 0
  StringReplace, OutputVar, OldCodes, `n, `n, useerrorlevel
  old := ErrorLevel + 1

  FileRead, NewCodes, %NewFileName%
  if ErrorLevel
    NewCodes := 0
  FileDelete %OldFileName%

  Loop
  {
    FileReadLine, line, %HtmlFileName%, %A_Index%
    if ErrorLevel
      break
    grep(line, "-<font.*</font>", output)
    if ( output ) {
      tot += 1
      GuiControl,, MyTotTemps, Tot: %tot%
      TempCode  := RegExReplace(output, "<.*?>", "")
      FoundCode := RegExMatch(OldCodes, TempCode)
      FileAppend, %TempCode%`n, %OldFileName%
      if ( FoundCode = "0" ) {
        ; hier vergelijken met het bestand met nieuwe codes
        new += 1
        GuiControl,, MyNewTemps, New: %new%
        Duplicate := RegExMatch(NewCodes, TempCode)
        if ( Duplicate = "0" ) {
          FileAppend, %TempCode%`n, %NewFileName%
        } else {
        } 
      } else {
        dup += 1
        GuiControl,, MyDupTemps, Dup: %dup%
      }
    }
  }
  FileDelete, %BackupFileName%
  old -= dup
  GuiControl,, MyOldTemps, Old: %old%
}
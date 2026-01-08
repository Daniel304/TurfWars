#Include %A_ScriptDir%

; Author  : Daniel van den Oord
; Date    : 16-04-2012
; Purpose : Gets the text out of the About.txt File
;
; 16-04-2012 (new):
;    Show neat error when file is not found

aboutText() {
  FileRead, FileContents, About.txt
  if ( ErrorLevel ) {
     FileContents := "File not found: About.txt"
  }
  return %FileContents%
}
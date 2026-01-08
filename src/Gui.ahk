#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir%

; Author  : Daniel van den Oord
; Date    : 20-04-2012
; Purpose : Create Gui
;
; 21-04-2012:
;   - Added button to queue temps in current queue
;
; 20-04-2012(new):
;   - Relocated to seperate File
;	  - Added Tab for Temps

Gui, Add, Picture, x12 y10 w90 h90 , %A_WorkingDir%\images\turfwars_icon_medium.png

Gui, Font, S20 CDefault Bold, Verdana
Gui, Add, Text, x132 y170 w120 h-90 , Text
Gui, Add, Text, x112 y10 w300 h40 , Turfwars Puncher
Gui, Add, Text, x272 y240 w50 h0 , Text
Gui, Font, S10 CDefault, Verdana
Gui, Add, Text, x112 y60 w300 h40 , Welcome to the Ultimate Code puncher. Select the file with codes to punch

Gui, Add, Button, x10 y110 w90 h30, File
Gui, Add, Button, x10 y150 w90 h30, Punch
Gui, Add, Button, x10 y190 w90 h30 vHealButton Default, Heal
Gui, Add, Button, x10 y230 w90 h30 vPauseButton Default, Pause

Gui, Add, Button, x10 y330 w90 h30, About
Gui, Add, Button, x10 y370 w90 h30, Exit

Gui, Add, GroupBox, x110 y100 w320 h210, Status
	Gui, Add, Text, x120 y120 w140 h20, Number of files:
	Gui, Add, Text, x260 y120 w160 h20 vMyNumberOfFiles, -

	Gui, Add, Text, x120 y140 w140 h20, Filename:
	Gui, Add, Text, x260 y140 w160 h20 vMyFileName, -

	Gui, Add, Text, x120 y160 w140 h20, Number of lines:
	Gui, Add, Text, x260 y160 w160 h20 vMyNumberCodes, 0 lines

	Gui, Add, Text, x120 y180 w140 h20, Current Line:
	Gui, Add, Text, x260 y180 w160 h20 vMyProgress, 0/0

	Gui, Add, Text, x120 y200 w120 h20, Current Code:
	Gui, Add, Text, x260 y200 w160 h20 vMyCode, -
	
	Gui, Add, Text, x120 y220 w120 h20, Invites:
	Gui, Add, Text, x260 y220 w160 h20 vMyInviteCode, -

	Gui, Add, Text, x120 y240 w120 h20, Wrong:
	Gui, Add, Text, x260 y240 w160 h20 vMyWrongCode, -

	Gui, Add, Text, x120 y260 w120 h20, Duplicate:
	Gui, Add, Text, x260 y260 w160 h20 vMyDupCode, -

	Gui, Add, Progress, x120 y280 w300 h20 -Smooth vMyProgressBar,

Gui, Add, Tab2, x110 y320 w320 h210, Controls|Speed|Sleep|Temps
  Gui, Tab, 1
    Gui, Add, Text,         w120 h20, Crash Check:
    Gui, Add, DropDownList, w160 h20 vMyCheck gCCheck R4, iPhone 3|iPhone 4|iPad 1+2|iPad New|None

  Gui, Tab, 2
	  Gui, Add, Text,   	w300 h20 vTextType, Keystroke speed (msec):
	  Gui, Add, Slider, 	w300 h20 vMyType gCType Range0-1000 TickInterval100 ToolTip, %Vartype%

	  Gui, Add, Text,   	w300 h20 vTextSubmitMin, Min Submit speed (sec):
	  Gui, Add, Slider, 	w300 h20 vMySubmitMin gCSubmitMin Range2-12 TickInterval1 ToolTip, %VarSubmitMin%

	  Gui, Add, Text,   	w300 h20 vTextSubmitMax, Max Submit speed (sec):
	  Gui, Add, Slider, 	w300 h20 vMySubmitMax gCSubmitMax Range2-12 TickInterval1 ToolTip, %VarSubmitMax%

  Gui, Tab, 3
    Gui, Add, Text,   	w300 h20 vTextSleep, Sleep between N*25 codes:
	  Gui, Add, Slider, 	w300 h20 vMySleep gCSleep Range1-20 TickInterval2 ToolTip, %VarSleep%

	  Gui, Add, Text,   	w300 h20 vTextPause, Pause (min):
	  Gui, Add, Slider, 	w300 h20 vMyPause gCPause Range1-20 TickInterval1 ToolTip, %VarPause%
    
  Gui, Tab, 4
    Gui, Add, Button,   w90 h30, Download
    Gui, Add, Button,   w90 h30, Add Queue
    Gui, Add, GroupBox, xp+100 yp-45 w180 h110
    Gui, Add, Text,   	xp+10 yp+12 w140 h20 vMyTotTemps, Tot:
    Gui, Add, Text,   	yp+24 w140 h20 vMyNewTemps, New:
    Gui, Add, Text,   	yp+24 w140 h20 vMyDupTemps, Dup:
    Gui, Add, Text,   	yp+24 w140 h20 vMyOldTemps, Old:

Gui, Add, StatusBar
Gui, Show, h560 w440, Turfwars Puncher

#Include src\ApplyGui.ahk
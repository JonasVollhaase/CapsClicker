; Jonas Vollhaase Mikkelsen, December 2019
; Contact: JM@TheMarketingGuy.dk
; Version 3
;
; Use capslock as a fifth modifier to provide extra functionality within windows
;

#SingleInstance force		; Cannot have multiple instances of program
#MaxHotkeysPerInterval 200	; Won't crash if button held down
#NoTrayIcon					; App not visible in tray
#Warn						; Debuggin purposese
#NoEnv						; Avoids checking empty variables to see if they are environment variables
#Persistent					; Script will stay running after auto-execute section completes 

SendMode Input
SetWorkingDir %A_ScriptDir% 
SetCapsLockState, AlwaysOff

; ######################################################################## Functionality ########################################################################

; Left Side Enter
CapsLock:: Send {Enter}

; Enable Caps
CapsLock & RControl:: SetCapsLockState % !GetKeyState("CapsLock", "T")

;terminate window, shut down, restart script, delete key
CapsLock & q:: !F4
CapsLock & Escape:: ControlSend, , !{F4}, ahk_class Progman ; shutdown dialogue

;Keyboard arrowkeys
CapsLock & h:: Left
CapsLock & j:: Down
CapsLock & k:: Up
CapsLock & l:: Right

;Vimlike bindings
CapsLock & a:: Send {end}
CapsLock & x:: Send {delete}
CapsLock & i:: Send {home}

;WindowsLike bindings
CapsLock & d:: Send {delete}

;Program launches
CapsLock & o:: outlook()
CapsLock & s:: slack()
CapsLock & c:: chrome()
CapsLock & w:: word()
CapsLock & p:: powerpoint()

;Deprecated
;CapsLock & i:: edge()
;CapsLock & x:: excel()
;CapsLock & f:: foobar()
;CapsLock & a:: adobePremiere()
;CapsLock & e:: explorer()

;media
CapsLock & Insert:: Media_Play_Pause
CapsLock & Home:: Media_Next
CapsLock & PGUP:: Volume_Up
CapsLock & Delete:: Media_Stop
CapsLock & End:: Media_Prev
CapsLock & PGDN:: Volume_Down

; Chrome f6 fix, rwin to rclick
$F6::^l
RWin:: AppsKey

; Linux/Mac like menu open for both alt and caps
CapsLock & Space:: 
Send {LWin}
return

; Open Powershell
LWin & Enter:: run, powershell.exe

; Get some help
; CapsLock & {+}:: Helper()


;Restart script
CapsLock & 0:: 
MsgBox, 65, Restarting script, The script will restart when you click OK
IfMsgBox OK
	Reload
return

;Kill script
CapsLock & F4::
MsgBox, 17, Killing Script, The script will be killed when you click OK
IfMsgBox OK
	ExitApp
return

; ######################################################################## Functions ########################################################################

powerpoint()
{
	IfWinNotExist, ahk_class PPTFrameClass
		run POWERPNT.exe
	GroupAdd, Powerpoints, ahk_class PPTFrameClass
	if WinActive("ahk_class PPTFrameClass")
		GroupActivate, Powerpoints, r
	else
		WinActivate ahk_class PPTFrameClass
	Return
}

excel()
{
	IfWinNotExist, ahk_class xlmain
		run excel.exe
	GroupAdd, Excels, ahk_class xlmain
	if WinActive("ahk_class xlmain")
		GroupActivate, Excels, r
	else
		WinActivate ahk_class xlmain
	return
}

word()
{
	IfWinNotExist, ahk_class OpusApp
		run winword.exe
	GroupAdd, Words, ahk_class OpusApp
	if WinActive("ahk_class OpusApp")
		GroupActivate, Words, r
	else
		WinActivate ahk_class OpusApp
	Return
}

foobar()
{
	IfWinNotExist, ahk_exe foobar2000.exe
		run foobar2000.exe
	else
		WinActivate ahk_exe foobar2000.exe
	return
}

chrome()
{
	IfWinNotExist, ahk_exe chrome.exe
		run, chrome.exe
	GroupAdd, Chromes, ahk_exe chrome.exe
	if WinActive("ahk_exe chrome.exe")
		GroupActivate, Chromes, r
	else
		WinActivate ahk_exe chrome.exe
	Return
}


slack()
{
	IfWinNotExist, ahk_exe slack.exe
		run, slack.exe
	else
		WinActivate, ahk_exe slack.exe
	return
}

; experiemental
skype()
{
	IfWinNotExist, ahk_pid 9456
			run, ahk_pid 9456
		else
				WinActivate, ahk_pid 9456
		return
}

outlook() ; One should never have more than 1 Outlook open
{
	IfWinNotExist, ahk_exe outlook.exe
		run, outlook.exe
	GroupAdd, Outlooks, ahk_exe outlook.exe
	if WinActive("ahk_exe outlook.exe")
		GroupActivate, Outlooks, r
	else
		WinActivate, ahk_exe outlook.exe
	return
}

explorer()
{
	IfWinNotExist, ahk_class CabinetWClass
		run, explorer.exe
	GroupAdd, FileExplorers, ahk_class CabinetWClass
	if WinActive("ahk_exe explorer.exe")
		GroupActivate, FileExplorers, r
	else
		WinActivate ahk_class CabinetWClass
	Return
}

adobePremiere() ; TODO: re-write to go through all adobe programs
{
	IfWinNotExist, ahk_class, EmbeddedWB
		run, Adobe Premiere Pro.exe
	GroupAdd, Premieres, ahk_class EmbeddedWB
	If (winActive("ahk_class EmbeddedWB"))
		GroupActivate, Premieres, r
	else
		WinActivate, ahk_class EmbeddedWB
	return
}

edge() 
{
	IfWinNotExist, ahk_class, ApplicationFrameWindow
		run, ApplicationFrameHost.exe
	GroupAdd, Edges, ahk_class ApplicationFrameWindow
	If (winActive("ahk_class ApplicationFrameWindow"))
		GroupActivate, Edges, r
	else
		WinActivate, ahk_class ApplicationFrameWindow
	return
}

Helper()
{
	MsgBox, 64, These are the commands available , aksjldhf¨`nasdf`nasd`nf`nasdf`nas`ndf`nasdf`na`nsd`nfas`ndf
	return
}

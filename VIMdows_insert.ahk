; Some keys have not yet been mapped
; TODO: Map them

#Include VIMdows_graphics.ahk

#If (toggle = true)
{
	i:: 					; i - insert before the cursor
    DeleteGraphics()
    return
	
	+i::					; I - insert at the beginning of the line
	Send {home}
	DeleteGraphics()
	return
	
	; a - insert (append) after the cursor
	
	+a::					; A - insert (append) at the end of the line
	Send, {end}
	DeleteGraphics()
	return
	
	o::						; o - append (open) a new line below the current line
	Send, {end}{enter}
	DeleteGraphics()
	return
	
	+o::					; O - append (open) a new line above the current line
	Send, {up}{end}{enter}
	DeleteGraphics()
	return
	
	; ea - insert (append) at the end of the word
	; Ctrl + h - delete the character before the cursor during insert mode
	; Ctrl + w - delete word before the cursor during insert mode
	; Ctrl + j - begin new line during insert mode
	; Ctrl + t - indent (move right) line one shiftwidth during insert mode
	; Ctrl + d - de-indent (move left) line one shiftwidth during insert mode
	; Ctrl + n - insert (auto-complete) next match before the cursor during insert mode
	; Ctrl + p - insert (auto-complete) previous match before the cursor during insert mode
	; Esc - exit insert mode
}
#If





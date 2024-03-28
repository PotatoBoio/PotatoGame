extends Node
var dialogue = null
var dialoguetextnum:int = 0
var dialoguestate = "none"
var freedialogue = false
var resetcomplete = null
var lastline = false
var dialogueimage = preload("res://icon.svg")
func _process(delta):
	if dialoguestate == "beginningcharacter":
		if dialoguetextnum == 0:
			dialogue = "helloooooooooooooooooooooooo"
		elif dialoguetextnum == 1:
			dialogue = "second line"
		elif dialoguetextnum == 2:
			dialogue = "third line"
			lastline = true
		elif dialoguetextnum == 3:
			freedialogue = true
	elif dialoguestate == "1beginningcharacter":
		if dialoguetextnum == 0:
			dialogue = "seeeeijf"
		elif dialoguetextnum == 1:
			dialogue = "second line"
		elif dialoguetextnum == 2:
			dialogue = "third line"
		elif dialoguetextnum == 3:
			freedialogue = true
	elif dialoguestate == "tutorialdialogue1": #first character
		dialogueimage = "none"
		if dialoguetextnum == 0:
			dialogue = "press W to jump"
		elif dialoguetextnum == 1:
			freedialogue = true
	if dialoguetextnum == 0:
		lastline = false

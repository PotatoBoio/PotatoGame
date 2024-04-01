extends RichTextLabel
#wvar state = 0
var word:int = 0
var passing = "yuh"
var lock = false

func _ready():
	#sets visible characters/letters to zero
	visible_characters = 0
func _process(delta):
	#checks if enter key is pressed, if so, will play the function "skipforward", or it will reset/
	if Input.is_action_just_pressed("ui_accept"):
		if word != 0:
			skipforward()
		else:
			if Dialogue.freedialogue:
				reset()
			else:
				lock = false
func _on_timer_timeout():
	if word == 0 and not lock:
		Dialogue.dialoguetextnum += 1
		word = Dialogue.dialogue.length()
		text = Dialogue.dialogue
		visible_characters = 0
		lock = true
	elif word != 0 :
		if visible_characters != -1:
			visible_characters += 1
			word -= 1 
		elif word == 0:
			print("done")
func reset():
	print("recived")
	Globalvar.dialoguespawn = false
	Dialogue.freedialogue = false
	Dialogue.dialoguetextnum = 0
	Globalvar.pause = false
	get_parent().queue_free()
func skipforward():
	lock = true
	visible_characters = -1
	word = 0
	
	
	

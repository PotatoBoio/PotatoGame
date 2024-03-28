extends RichTextLabel
#wvar state = 0
var word = 0
var count = null
var letter_index = null
var dialogue_label = null
var dialogue_duration_trigger = true
var nextpassage = "playing"
var finaltrigger = false
var memory:String = "nothing"
var bleh = true
var allow = false
var secondtry = false
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and nextpassage:
		if bleh and not Dialogue.lastline:
			Dialogue.dialoguetextnum += 1
			bleh = false
		word = 0
		visible_characters = -1
		nextpassage = false
		
	elif Input.is_action_just_released("ui_accept") and not nextpassage:
		if visible_characters != -1 and bleh and not Dialogue.lastline:
			Dialogue.dialoguetextnum += 1
			dialogue_duration_trigger = true
			bleh = false
		else: 
			finaltrigger = true
	if Input.is_action_just_pressed("ui_accept") and finaltrigger:
		dialogue_duration_trigger = true
		
	if Input.is_action_just_pressed("ui_accept") and Dialogue.lastline and not allow and not secondtry:
		if visible_characters != -1:
			allow = true
		elif visible_characters == -1:
			secondtry = true
		Dialogue.lastline = false
	elif Input.is_action_just_released("ui_accept") and secondtry:
		secondtry = false
		print("eh")
	
	elif Input.is_action_just_pressed("ui_accept") and allow:
		reset()
	elif Input.is_action_just_released("ui_accept") and not secondtry:
		allow = true
	if Dialogue.resetcomplete:
		get_parent().queue_free()
	
	
func _on_timer_timeout():
	if word == 0 and dialogue_duration_trigger:
		text = Dialogue.dialogue
		word = Dialogue.dialogue.length()
		dialogue_duration_trigger = false
		visible_characters = 0
		nextpassage = true
		finaltrigger = false
		
	if word > 0:
		visible_characters += 1
		word -= 1
	if word == 0 and not dialogue_duration_trigger:
		nextpassage = false
		bleh = true

		
		
func reset():
	print("recived")
	Globalvar.dialoguespawn = false
	visible_characters = 0
	dialogue_duration_trigger = true
	nextpassage = false
	finaltrigger = false
	Dialogue.freedialogue = false
	Dialogue.dialoguetextnum = 0
	Globalvar.pause = false
	Dialogue.lastline = false
	Dialogue.resetcomplete = true

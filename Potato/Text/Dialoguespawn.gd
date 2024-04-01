extends Node2D
var dialogue = preload("res://Text/dialogue.tscn")
var trigger = false
var modulation = false
var image = preload("res://Text/Nother background.png")
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") and Globalvar.dialoguespawn == false and trigger:
		var text = dialogue.instantiate()
		get_parent().add_child(text)
		Globalvar.dialoguespawn = true
		Dialogue.resetcomplete = false
		Globalvar.pause = true
	if modulation and $"../../BeginingCharacter/Enter key".modulate.a < 1:
		$"../../BeginingCharacter/Enter key".modulate.a += 0.1
	elif modulation == false and $"../../BeginingCharacter/Enter key".modulate.a > 0:
		$"../../BeginingCharacter/Enter key".modulate.a -= 0.1

	


func _on_begining_character_body_entered(body):
	trigger = true
	Dialogue.dialoguestate = "beginningcharacter"
	print("ee")
	modulation = true




func _on_begining_character_body_exited(body):
	
	trigger = false
	Dialogue.dialoguestate = null
	#stop freezing in air
	print("oo")
	modulation = false

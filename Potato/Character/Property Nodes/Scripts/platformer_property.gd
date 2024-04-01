extends Node2D
const SPEED = 200.0
const JUMP_VELOCITY = -500.0
var jumpsDefult = 2
var jumps = jumpsDefult
var terminalSpeed = 2000
var slippiness = 4
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var potato = $".."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _physics_process(delta):
	if Globalvar.pause == false:
		if not potato.is_on_floor():
			potato.velocity.y += gravity * delta
		if potato.is_on_floor() and jumps < jumpsDefult:
			jumps = jumpsDefult
		
			# Handle jump
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		if Input.is_anything_pressed():
			if Input.is_action_just_pressed("up") and jumps != 0:
				potato.velocity.y = JUMP_VELOCITY
				jumps -= 1
			if Input.is_action_pressed("right"):
				if potato.velocity.x < 0:
					potato.velocity.x = move_toward(potato.velocity.x, 0, slippiness)
				elif potato.velocity.x < terminalSpeed:
					potato.velocity.x =  potato.velocity.x + SPEED * delta
			if Input.is_action_pressed("left"):
				if potato.velocity.x > 0:
					potato.velocity.x = move_toward(potato.velocity.x, 0, slippiness)
				elif potato.velocity.x > -terminalSpeed:
					potato.velocity.x = potato.velocity.x - SPEED * delta
				else:
					potato.velocity.x = potato.velocity.x
	
			if Input.is_action_just_pressed("reverse"):
				get_tree().change_scene_to_file("res://World/world.tscn")
					#position = $"../reset".position

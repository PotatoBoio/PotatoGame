extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -500.0
var jumpsDefult = 2
var jumps = jumpsDefult
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 0
var slippiness = 4
var gunangle = 0
var terminalSpeed = 2000
var dialogue = preload("res://Text/dialogue.tscn")
func _physics_process(delta):
	
	if Globalvar.pause == false:
		if not is_on_floor():
			velocity.y += gravity * delta
		if is_on_floor() and jumps < jumpsDefult:
			jumps = jumpsDefult
		

		# Handle jump.
		

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		if Input.is_anything_pressed():
			if Input.is_action_just_pressed("up") and jumps != 0:
				velocity.y = JUMP_VELOCITY
				jumps -= 1
			if Input.is_action_pressed("right"):
				if velocity.x < 0:
					velocity.x = move_toward(velocity.x, 0, slippiness)
				if velocity.x < terminalSpeed:
					velocity.x =  velocity.x + SPEED * delta
				else:
					velocity.x = velocity.x
			if Input.is_action_pressed("left"):
				if velocity.x > 0:
					velocity.x = move_toward(velocity.x, 0, slippiness)
				if velocity.x > -terminalSpeed:
					velocity.x = velocity.x - SPEED * delta
				else:
					velocity.x = velocity.x
			if Input.is_action_just_pressed("reverse"):
				get_tree().change_scene_to_file("res://World/world.tscn")
				#position = $"../reset".position
			if Input.is_action_just_pressed("shoot"):
				gunangle = Vector2.from_angle($Gun.rotation)
				velocity = velocity + -Globalvar.bulletspeed/5
			if Input.is_action_pressed("shoot"):
				Globalvar.bulletfirelocation = $bulletlocation.global_position
		else:
			velocity.x = move_toward(velocity.x, 0, slippiness)
			


		

		rotation_degrees = rotation_degrees + velocity.x*delta*2
		move_and_slide()

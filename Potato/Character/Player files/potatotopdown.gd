extends CharacterBody2D


const speed:float = 300.0
const JUMP_VELOCITY = -400.0
var direction = 0
var decelleration:float = 100
var acceleration:float = 100
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
func _physics_process(delta):
	_update_velocity()
	move_and_slide()
	print(velocity)

func _update_velocity():
	if not Input.is_anything_pressed():
		velocity.x = move_toward(velocity.x, direction.x * speed, acceleration)
		velocity.y = move_toward(velocity.y, direction.y * speed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, direction.x * speed, decelleration)
		velocity.y = move_toward(velocity.y, direction.y * speed, decelleration)
	

extends CharacterBody2D
var gun = 0
func _ready():
	rotation = $"../Potato".rotation
	gun = Vector2.from_angle(rotation)
	position = Globalvar.bulletfirelocation
func _process(delta):
	velocity = Vector2(gun.x*delta*100000,gun.y*delta*100000)
	Globalvar.bulletspeed = velocity
	if global_position > position + Vector2(500,500):
		print("fe")
	move_and_slide()
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

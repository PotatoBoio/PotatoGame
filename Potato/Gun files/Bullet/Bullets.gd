extends Node2D
var gun = 0
var bullet = preload("res://Gun files/Bullet/bullet.tscn")
var speed = 1000
var cooldown = 0.1
var deathtime = 1
var deathtimereset = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("shoot"):
		if cooldown < 0:
			inst(delta,speed)
	if cooldown < 0:
		cooldown = 0.1
	if cooldown > 0:
			cooldown -= delta
	if deathtime < 0:
		remove_child(bullet)
func inst(_delta,_speed):
	var projectile = bullet.instantiate()
	get_parent().add_child(projectile) 
	gun = Vector2.from_angle($"../Potato".rotation)
	projectile.position = Globalvar.bulletfirelocation
	projectile.rotation = $"../Potato".rotation
	
	print("bam")


extends AnimatedSprite2D
var gun = 0
var bullet = preload("res://Gun files/bullet.tscn")
func _ready():
	frame = 2
func _process(_delta):
	if Input.is_action_pressed("shoot"):
		play("default")
		
	

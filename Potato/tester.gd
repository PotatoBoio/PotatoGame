extends Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	modulate.a = 1 - (abs(position - $"../Potato".position) / 200).x
 

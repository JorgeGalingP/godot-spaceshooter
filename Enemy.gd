extends Area2D

export(int) var speed = 20
export(int) var armor = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta

extends Area2D

export(int) var speed = 20
export(int) var armor = 3

# called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta


func _on_Enemy_body_entered(body):
	body.queue_free()
	armor -= 1
	
	if armor <= 0:
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

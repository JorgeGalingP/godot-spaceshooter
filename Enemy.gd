extends Area2D

const ExplosionEffect = preload("res://ExplosionEffect.tscn")

export(int) var speed = 20
export(int) var armor = 3

# called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta


func _on_Enemy_body_entered(body):
	body.create_hit_effect()
	body.queue_free()
	armor -= 1
	
	if armor <= 0:
		add_to_score()
		create_explosion()
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
	
func add_to_score():
	var main = get_tree().current_scene
	if main.is_in_group("World"):
		main.score += 10


func create_explosion():
	# get main node and attach to it a explosion animation child
	var world_node = get_tree().current_scene
	var explosion_effect = ExplosionEffect.instance()
	world_node.call_deferred("add_child", explosion_effect)
	# world_node.add_child(explosion_effect)
	explosion_effect.global_position = global_position
	

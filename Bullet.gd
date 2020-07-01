extends RigidBody2D

const HitEffect = preload("res://HitEffect.tscn")

onready var bullet_sound = $BulletSound

func _ready():
	bullet_sound.play()

	
func create_hit_effect():
	# get main node and attach to it a hit effect child
	var world_node = get_tree().current_scene
	var hit_effect = HitEffect.instance()
	world_node.call_deferred("add_child", hit_effect)
	hit_effect.global_position = global_position


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

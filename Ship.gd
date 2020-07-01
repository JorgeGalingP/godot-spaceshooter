extends Area2D

const Bullet = preload("res://Bullet.tscn")
const ExplosionEffect = preload("res://ExplosionEffect.tscn")

export(int) var speed = 100

# called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if Input.is_action_pressed("ui_up"):
        position.y -= speed * delta
    if Input.is_action_pressed("ui_down"):
        position.y += speed * delta
    if Input.is_action_just_pressed("ui_accept"):
        fire_bullet()


func fire_bullet():
    var bullet = Bullet.instance()
    
    # get main node and attach to it a bullet child
    var world_node = get_tree().current_scene
    world_node.add_child(bullet)
    
    # set bullet global position into ship global position
    bullet.global_position = global_position 


func _on_Ship_area_entered(area):
    area.queue_free() # delete the two 2D areas
    queue_free()


func _exit_tree():
    # get main node and attach to it a explosion animation child
    var world_node = get_tree().current_scene
    var explosion_effect = ExplosionEffect.instance()
    world_node.call_deferred("add_child", explosion_effect)
    # world_node.add_child(explosion_effect)
    explosion_effect.global_position = global_position

extends Node2D

const Enemy = preload("res://Enemy.tscn")

onready var spawn_points = $SpawnPoints

func get_spawn_position():
    var points = spawn_points.get_children()
    points.shuffle()
    
    return points[0].global_position # a random one


func spawn_enemy():
    var spawn_position = get_spawn_position()
    var enemy = Enemy.instance()
    
    # get main node and attach to it enemy
    var world_node = get_tree().current_scene
    world_node.add_child(enemy)
    enemy.global_position = spawn_position

func _on_Timer_timeout():
    spawn_enemy()

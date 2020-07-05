extends Node

var score = 0 setget set_score

onready var score_label = $ScoreLabel

func set_score(new_score):
	score = new_score
	score_label.text = "Score " + str(score)


func _on_Ship_player_death():
	# we pause 1 sec so we can view the ship death particles
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://GameOver.tscn")

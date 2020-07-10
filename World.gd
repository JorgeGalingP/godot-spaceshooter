extends Node

var score = 0 setget set_score

onready var score_label = $ScoreLabel

func set_score(new_score):
	score = new_score
	update_score_label()


func update_score_label():
	score_label.text = "Score " + str(score)


func update_save_data():
	var save_data = SaveAndLoad.load_data_from_file()
	if score > save_data.highscore:
		save_data.highscore = score
		SaveAndLoad.save_data_to_file(save_data)


func _on_Ship_player_death():
	update_save_data()
	
	# we pause 1 sec so we can view the ship death particles
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://GameOver.tscn")

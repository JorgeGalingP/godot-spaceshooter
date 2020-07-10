extends Node

# Highscore: 0
onready var highScoreLabel = $HighscoreLabel

func _ready():
	set_highscore_label()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://StartMenu.tscn")
		

func set_highscore_label():
	var save_data = SaveAndLoad.load_data_from_file()
	highScoreLabel.text = " Highscore: " + str(save_data.highscore)

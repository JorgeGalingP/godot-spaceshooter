extends Node

var score = 0 setget set_score

onready var score_label = $ScoreLabel

func set_score(new_score):
	score = new_score
	score_label.text = "Score = " + str(score)

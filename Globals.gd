extends Node

signal score_changed

export var WIN_SCORE = 2000
export var WIN_SCREEN: PackedScene


var score = 0 setget set_score

func set_score(x):
	emit_signal("score_changed", x)
	score = x
	
	if score >= WIN_SCORE:
		get_tree().change_scene_to(WIN_SCREEN)

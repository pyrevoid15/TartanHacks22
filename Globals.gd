extends Node

signal score_changed

var score = 0 setget set_score

func set_score(x):
	emit_signal("score_changed", x)
	score = x

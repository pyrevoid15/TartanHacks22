extends Node

signal score_changed

export var WIN_SCORE = 2000
export var WIN_SCREEN: PackedScene
export var LOSE_SCREEN: PackedScene

onready var progress_bar = $"/root/Game/UiLayer/UI/ProgressBar"

var score = 0 setget set_score
var fuel = 60 # number of seconds

func set_score(x):
	emit_signal("score_changed", x)
	score = x
	
	if score >= WIN_SCORE:
		get_tree().change_scene_to(WIN_SCREEN)

func _process(delta):
	fuel -= delta
	progress_bar.value = fuel
	if fuel <= 0:
		get_tree().change_scene_to(LOSE_SCREEN)

extends Control

func _ready():
	var _x = $"/root/Game/Globals".connect("score_changed", self, "_on_Globals_score_changed")

func _on_Globals_score_changed(score):
	$Score.text = "Score: %s" % [score]

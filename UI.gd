extends Control

onready var dropoff_text = $DropOffText
onready var timer = $Timer

func _ready():
	var _x = $"/root/Game/Globals".connect("score_changed", self, "_on_Globals_score_changed")

func _on_Globals_score_changed(score):
	$Score.text = "Score: %s" % score

func on_answered(correctness, correct, answer):
	var text = ""
	match correctness:
		Airports.Correctness.CORRECT:
			text = "Correct! The destination was %s" % correct.name
		Airports.Correctness.CLOSE:
			text = "Close. The destination was %s, but you dropped off at %s" % [correct.name, answer.name]
		Airports.Correctness.WRONG:
			text = "Incorrect. The destination was %s, but you dropped off at %s" % [correct.name, answer.name]
	dropoff_text.text = text
	dropoff_text.show()
	timer.start(3)

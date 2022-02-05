extends Area2D

export(String, MULTILINE) var prompt: String

func is_player_here():
	for body in get_overlapping_bodies():
		if body is Player:
			return true

func _input(event):
	if event.is_action_pressed("dropoff") and is_player_here():
		print(name)

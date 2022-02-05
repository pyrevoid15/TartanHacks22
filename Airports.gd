extends Node2D

signal airport_chosen

var regions = []
var current_airport = null
var current_region = null

onready var globals = $"/root/Game/Globals"

func _ready():
	randomize()
	
	for region in get_children():
		regions.append(region)
		for airport in region.get_children():
			airport.connect("dropoff", self, "on_dropoff")
	
	yield(get_tree().create_timer(0.1), "timeout")
	choose_airport()
			
func choose_airport():
	# pick a new random region other than the current one
	var selected_region = current_region
	while selected_region == current_region:
		selected_region = regions[randi() % regions.size()]
	current_region = selected_region
	
	# pick a random airport in that region
	current_airport = current_region.get_child(randi() % current_region.get_child_count())
	print(current_airport)
	emit_signal("airport_chosen", current_airport)

# Called when a passenger is dropped off at an airport
func on_dropoff(where):
	if where == current_airport:
		print("100 pts")
		globals.score += 100
		globals.fuel = 60
	elif where.global_position.distance_to(current_airport.global_position) < 500:
		print("20 pts")
		globals.score += 20
		globals.fuel = clamp(globals.fuel + 10, 0, 60)
	else:
		print("no points")
	
	choose_airport()

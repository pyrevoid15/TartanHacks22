extends KinematicBody2D
class_name Player

export var SPEED: float
export var BOOST_SPEED: float
export var STEER_SPEED: float

onready var sprite = $Sprite
onready var dest_text = $DestText
onready var cam = $Camera2D

func _physics_process(delta):
	var steer = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	var speed = SPEED
	if Input.is_action_pressed("boost"):
		speed = BOOST_SPEED
	
	sprite.rotate(steer*STEER_SPEED*delta)
	
	var _x = move_and_slide(sprite.transform.basis_xform(Vector2(0, -speed)))
	var cam_act = true
	
	if position.x <= -9000:
		position.x = 8980
		cam.reset_smoothing()
	elif position.x >= 9000:
		position.x = -8980
		cam.reset_smoothing()
		
	if position.y < -4500:
		position.y = -4500
	elif position.y > 4530:
		position.y = 4530
		

func on_destination_changed(dest):
	dest_text.text = dest.prompt[randi() % len(dest.prompt)]

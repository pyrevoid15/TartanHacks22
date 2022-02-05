extends KinematicBody2D
class_name Player

export var SPEED: float
export var STEER_SPEED: float

onready var sprite = $Sprite
onready var dest_text = $DestText

func _physics_process(delta):
	var steer = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	var speed = SPEED
	if Input.is_action_pressed("debug_boost"):
		speed = 10*SPEED
	
	sprite.rotate(steer*STEER_SPEED*delta)
	
	var _x = move_and_slide(sprite.transform.basis_xform(Vector2(0, -speed)))

func on_destination_changed(dest):
	dest_text.text = dest.prompt

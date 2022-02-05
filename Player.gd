extends KinematicBody2D

export var SPEED: float
export var STEER_SPEED: float


func _physics_process(delta):
	var steer = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	rotate(steer*STEER_SPEED*delta)
	
	move_and_slide(transform.basis_xform(Vector2(0, -SPEED)))

extends KinematicBody2D

var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	$Animation.play()
	pass # Replace with function body.

func _physics_process(_delta):
	var dir = Vector2()

	dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	dir.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	dir = dir.normalized()

	return move_and_slide(dir * speed)



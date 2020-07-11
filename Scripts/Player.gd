extends KinematicBody2D

var speed = 100

export(PackedScene) var Bullet

#shooting vars
var shootDirection = Vector2(1,0)
var counter = 0
var spb = 0.8
var shooting = true


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.play()
	pass # Replace with function body.

func _physics_process(delta):
	var dir = Vector2()

	dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	dir.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	if pow(dir.x, 2) >= pow(dir.y, 2):
		dir.y = 0
	else:
		dir.x = 0

	if dir.length() > 0:
		shootDirection = dir.normalized()
	
	if shooting:
		counter += delta
		if counter >= spb:
			counter = 0
			var bullet = Bullet.instance()
			bullet.dir = shootDirection
			bullet.position = position
			get_parent().add_child(bullet)


	#Animation
	if dir.length() > 0:
		if shootDirection.x > 0:
			$Sprite.animation = "move_right"
		if shootDirection.x < 0:
			$Sprite.animation = "move_left"
		if shootDirection.y > 0:
			$Sprite.animation = "move_down"
		if shootDirection.y < 0:
			$Sprite.animation = "move_up"

	return move_and_slide(dir * speed)



extends KinematicBody2D


export(Array, Vector2) var Waypoints = [Vector2(0,0)]
var current = 0

var speed = 20 

var since = 0
var wait_time = 0.6

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.play()
	pass # Replace with function body.

func _physics_process(delta):
	var goal = Waypoints[current]

	if (goal - position).length() < 1 && since >= wait_time:
		since = 0
		current = (current + 1) % Waypoints.size()
		goal = Waypoints[current]

	if since < wait_time:
		since += delta

		$Sprite.animation = "default"
		
	else:
		var dist = goal - position
		var move = dist.normalized() * speed * delta
		if move.length() > dist.length():
			move = dist
		
		if pow(move.x, 2) > pow(move.y, 2):
			if move.x > 0:
				$Sprite.animation = "move_right"
			else:
				$Sprite.animation = "move_left"
		else:
			if move.y > 0:
				$Sprite.animation = "move_down"
			else:
				$Sprite.animation = "move_up"
		
		var _c = move_and_collide(move)

func collision(_bullet):
	modulate = Color('#880000')
	get_parent().end(position + Vector2(0, -15))


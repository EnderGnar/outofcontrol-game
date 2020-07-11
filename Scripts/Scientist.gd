extends KinematicBody2D


export(Array, Vector2) var Waypoints = [Vector2(0,0)]
var current = 0

var speed = 20 

var since = 0
var wait_time = 0.6

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var goal = Waypoints[current]

	if (goal - position).length() < 1 && since >= wait_time:
		since = 0
		current = (current + 1) % Waypoints.size()
		goal = Waypoints[current]

	if since < wait_time:
		since += delta
	else:
		var dist = goal - position
		var move = dist.normalized() * speed * delta
		if move.length() > dist.length():
			move = dist
		
		move_and_collide(move)

func collision(_bullet):
	modulate = Color('#880000')

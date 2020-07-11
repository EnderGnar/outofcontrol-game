extends KinematicBody2D


export(Array, Vector2) var Waypoints = [Vector2(0,0)]
var current = 0

var speed = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	var goal = Waypoints[current]

	if (goal - position).length() < 1:
		current = (current + 1) % Waypoints.size()
		goal = Waypoints[current]
	
	var dist = goal - position

func collision(_bullet):
	print('ded')

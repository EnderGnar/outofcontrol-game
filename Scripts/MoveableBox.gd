extends KinematicBody2D

var lastPosition = Vector2()
var goal = Vector2()

var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = floor(position.x/16) * 16
	position.y = floor(position.y/16) * 16

	lastPosition = position
	goal = position
	$Sprite.animation = "default"
	pass # Replace with function body.

func _physics_process(delta):
	var dist = goal - position
	if dist.length() > 0:
		var move = dist.normalized() * speed * delta
		if move.length() > dist.length():
			move = dist
		
		var col = move_and_collide(move)

		if col:
			position = lastPosition
			goal = lastPosition
	if (goal- position).length() == 0:
		lastPosition = goal
		

func collision(bullet):
	if bullet.type == 'bullet' && (position - goal).length() == 0:
		var dir = bullet.dir * 16
		goal = lastPosition + dir



	


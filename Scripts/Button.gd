extends Area2D

export(String) var action = "default"

var pressed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.animation = "default"
	position.y -= 0.001
	pass # Replace with function body.

func _physics_process(_delta):
	var over = get_overlapping_bodies()
	if over.size() > 0 && !pressed:
		$Sprite.animation = "pressed"
		pressed = true
		get_parent().called(action, true)
	elif over.size() == 0 && pressed:
		$Sprite.animation = "default"
		pressed = false
		get_parent().called(action, false)

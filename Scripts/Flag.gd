extends Area2D

export(String) var next = "Level1"

var pressed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.animation = "default"
	pass # Replace with function body.

func _physics_process(_delta):
	var over = get_overlapping_bodies()
	if over.size() > 0 && !pressed:
		get_parent().next(next)

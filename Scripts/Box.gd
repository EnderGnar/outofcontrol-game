extends StaticBody2D

var health = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.animation = "default"
	pass # Replace with function body.

func collision(_bullet):
	health -= 1
	if health <= 0:
		$Sprite.animation = "destroyed"
		$Sprite.play()
		$Collider.disabled = true

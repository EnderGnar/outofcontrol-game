extends KinematicBody2D

var health = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.animation = "default"
	pass # Replace with function body.

func collision(bullet):
	health -= bullet.damage
	if health <= 0:
		$Sprite.animation = "destroyed"
		$Sprite.play()
		$Collider.disabled = true

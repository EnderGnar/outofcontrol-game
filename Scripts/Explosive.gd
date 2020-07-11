extends StaticBody2D

var health = 1

var radius = 20

export(PackedScene) var Explosion

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.animation = "default"
	pass # Replace with function body.

func collision(_bullet):
	health -= 1
	if health <= 0:
		$Collider.disabled = true
		for _i in range(50):
			var explosion = Explosion.instance()
			var rad = rand_range(0, radius)
			var dir = rand_range(0,PI*2)
			explosion.position = Vector2(sin(dir) * rad, cos(dir) * rad) + position + Vector2(8,8)
			explosion.get_node("Particle").emitting = true

			get_parent().add_child(explosion)

extends KinematicBody2D

var dir = Vector2(1,0)

var speed = 300

export(PackedScene) var Explosion	

func _ready():
	pass 


func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	if collision:
		var collider = collision.collider

		if collider.get_class() != 'TileMap':
			collider.collision(self)

		var explosion = Explosion.instance()
		explosion.position = position
		explosion.get_node("Particle").emitting = true
		get_parent().add_child(explosion)
		get_parent().remove_child(self)

extends KinematicBody2D

var dir = Vector2(1,0)

var speed = 300
var exploded = false

var type = "bullet"

var damage = 1

export(PackedScene) var Explosion	

func _ready():
	pass 


func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	if collision:
		var collider = collision.collider

		if collider.get_class() != 'TileMap':
			collider.collision(self)

		explode()

func collision(_bullet):
	explode()

func explode():
	if exploded: return
	exploded = true
	var explosion = Explosion.instance()
	explosion.position = position
	get_parent().add_child(explosion)
	get_parent().remove_child(self)

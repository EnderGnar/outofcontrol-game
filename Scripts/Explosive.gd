extends KinematicBody2D

var health = 1
var type = "explosive"

var radius = 30
var activated = false
var exploded = false
var time = 0
var wait_time = 0.2

var damage = 3

export(PackedScene) var Explosion

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.animation = "default"

	$Explosion.get_node('Collider').shape.radius = radius
	pass # Replace with function body.

func _physics_process(delta):
	if activated:
		time += delta
		if time >= wait_time:
			explode()


func collision(_bullet):
	health -= 1
	if health <= 0 && !activated:
		activated = true
		

func explode():
	if exploded: return
	exploded = true
	var ex = $Explosion
	ex.get_node('Collider').disabled = false
	var bodies = ex.get_overlapping_bodies()

	for collider in bodies:
		if collider.get_class() != 'TileMap':
			collider.collision(self)

	$Collider.disabled = true
	for _i in range(50):
		var explosion = Explosion.instance()
		var rad = rand_range(0, radius)
		var dir = rand_range(0,PI*2)
		explosion.position = Vector2(sin(dir) * rad, cos(dir) * rad) + position + Vector2(8,8)
		explosion.offset = rand_range(0, 0.3)
		get_parent().add_child(explosion)


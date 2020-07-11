extends Node2D

var time = 0
var offset = 0

func _ready():
	if offset == 0:
		$Particle.emitting = true
		$Timer.start()

func _physics_process(delta):
	time += delta
	if time >= offset:
		$Particle.emitting = true
		$Timer.start()

func _timeout():
	get_parent().remove_child(self)


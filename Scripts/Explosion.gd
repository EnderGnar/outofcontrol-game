extends Node2D

var time = 0
var offset = 0
var started = false

func _ready():
	if offset == 0 && !started:
		start()

func _physics_process(delta):
	time += delta
	if time >= offset &&!started:
		start()

func start():
	$Sound.playing = true
	$Particle.emitting = true
	$Timer.start()
	started=true

func _timeout():
	get_parent().remove_child(self)


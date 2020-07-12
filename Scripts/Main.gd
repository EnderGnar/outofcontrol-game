extends Control

onready var active = get_node('main')

func _ready():
	active.fadein()
	$Sound.playing = true
	pass 

func change(to):
	active.fadeout()
	active = get_node(to)
	active.fadein()

func start(at):
	get_tree().change_scene("res://Scenes/World.tscn")

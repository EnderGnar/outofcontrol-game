extends KinematicBody2D

export(String) var action = "default"

var opened = false

func _ready():
	get_parent().listener.append(self)

	position.x = round(position.x / 16) * 16
	position.y = round(position.y / 16) * 16

	$Sprite.animation = "default"
	pass # Replace with function body.

func collision(_bullet):
	pass

func activate():
	opened = true
	$Collider.disabled = true
	$Sprite.animation = "open"

func deactivate():
	opened = false
	$Collider.disabled = false	
	$Sprite.animation = "default"

func called(name, info):
	if name == action:
		if info:
			activate()
		else:
			deactivate()

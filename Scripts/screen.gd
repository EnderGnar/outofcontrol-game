extends Node2D

var active = false
var opacity = 0.0

func _ready():
	modulate = Color( 1, 1, 1, opacity)
	if !active: hide()
	pass 

func _process(delta):
	var d = delta * 2

	if active && opacity < 1.0:
		opacity += d
	
	if !active && opacity > 0.0:
		opacity -= d

	opacity = clamp(opacity,0,1)
	if opacity == 0.0 && !active:
		hide()


	modulate = Color(1, 1, 1, opacity)

func fadein():
	show()
	active = true

func fadeout():
	active = false

	
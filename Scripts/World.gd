extends YSort

var listener = []

var start = Vector2()
var goal = Vector2()

var ending = false
var time = 0
var total = 1.0

func _process(delta):
	if ending:
		time += delta
		if time >= total:
			restart()

		else:
			cam().global_position = start + (goal - start) * (time/total)

			cam().zoom = Vector2(1,1) * pow(0.333, time/total + 1)

func called(name, info):
	for l in listener:
		l.called(name, info)

func home():
	get_tree().change_scene("res://UI/Main.tscn")

func restart():
	get_tree().reload_current_scene()

func next(name):
	var dir = "res://Levels/" + name + ".tscn"
	get_tree().change_scene(dir)

func end(at):
	if ending: return
	goal = Vector2(at.x, at.y)
	start = cam().global_position
	ending = true

func cam():
	return get_node("Player").get_node("MainCam")

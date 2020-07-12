extends YSort

var listener = []



func called(name, info):
	for l in listener:
		l.called(name, info)

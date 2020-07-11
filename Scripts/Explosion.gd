extends Node2D

func _timeout():
	get_parent().remove_child(self)


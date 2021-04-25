extends "res://Scripts/Object/Interactable.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var enabled = false

func set_enabled(state):
	enabled = state

func activate():
	if(enabled):
		get_tree().get_root().get_node("torpedo").find_node("torpedo.tres.gd").activate()
	.activate()



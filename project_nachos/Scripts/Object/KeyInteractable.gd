extends "res://Scripts/Object/Interactable.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func activate():
	GameManager.add_item(name)
	.activate()



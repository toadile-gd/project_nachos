extends "res://Scripts/Object/Interactable.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func activate():
	if (GameManager.check_item("TORPEDO")):
		get_node("Torpedo Button").find_node("TorpedoButton.gd").set_enabled(true)
	.activate()

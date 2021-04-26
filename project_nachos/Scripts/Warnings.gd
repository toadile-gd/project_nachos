extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var victory : VictoryConditions
var changed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	victory = get_tree().current_scene.find_node("VictoryConditions")
	pass # Replace with function body.

func _physics_process(delta):
	if (victory.check_damages() and not changed):
		changed = true
		for child in get_children():
			child.turn_green()

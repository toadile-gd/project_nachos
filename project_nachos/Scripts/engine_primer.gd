extends Area

var interactible_name = "engine primer button"
var victory : VictoryConditions
var starter

# Called when the node enters the scene tree for the first time.
func _ready():
	victory = get_tree().current_scene.find_node("VictoryConditions")
	starter = get_parent().get_node("engine_start")
	pass # Replace with function body.


func activate():
	starter.greenlight()
	Tooltip.uprintb("Engine is primed", 2)

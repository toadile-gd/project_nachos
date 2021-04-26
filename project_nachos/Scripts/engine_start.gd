extends Area

var interactible_name = "engine start button"
var greenlit = false
var victory : VictoryConditions

# Called when the node enters the scene tree for the first time.
func _ready():
	victory = get_tree().current_scene.find_node("VictoryConditions")
	pass # Replace with function body.

func greenlight():
	greenlit = true

func activate():
	if greenlit and victory.check_engine():
		victory.engine_running = true
		Tooltip.uprintb("Engine started", 3)
	elif greenlit:
		Tooltip.uprintb("The engine is too damaged to start", 2)
	else:
		Tooltip.uprintb("The engine needs to be primed", 2)

extends Area

var interactible_name = "drainage valve"
var water

func _ready():
	water = get_tree().current_scene.find_node("electric_water")

func activate():
	water.drain()

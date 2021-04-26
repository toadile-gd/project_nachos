extends Area


export var does_something = false
var description = "activate power to "
export var interactible_name = "torpedo bay fuse"
var on = true
var water

func _ready():
	water = get_tree().current_scene.find_node("electric_water")

func activate():
	if not does_something:
		Tooltip.uprintb("Powering that down would be unwise",2)
	else:
		if (on):
			Tooltip.uprintb("Powering down torpedo bay",2)
		else:
			Tooltip.uprintb("Powering up torpedo bay",2)
		water.activate()
		on = not on
		rotate_z(PI)

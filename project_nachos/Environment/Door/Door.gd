extends Spatial

export var door_name = "door"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func activate():
#	if Game Manager has key for this door
	$sub_door/anim.play("open")

extends Spatial

export var door_name = "door"
export var key_name = "KEY_C"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func activate():
	$sub_door/anim.play("open")
	AudioManager.play_sound("door")

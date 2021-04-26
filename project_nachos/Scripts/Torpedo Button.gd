extends Area

var interactible_name = "torpedo launch button"
var fuse
var torpedo
var fired = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer3D.stream.set_loop(false)
	fuse = get_tree().current_scene.find_node("torpedo_fuse")
	torpedo = get_tree().current_scene.find_node("torpedo")
	pass # Replace with function body.


func activate():
	AudioManager.play_sound("button")
	if (fuse.on and not fired):
		fired = true
		Tooltip.uprintb("Launching Torpedo...", 2)
		torpedo.enabled = true
		$AudioStreamPlayer3D.play()
	elif not fired:
		Tooltip.uprintb("Torpedo Bay has no power", 2)
	else:
		Tooltip.uprintb("...", 2)
	pass

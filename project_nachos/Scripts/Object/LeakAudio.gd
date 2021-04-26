extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer3D.stream.set_loop(false)
	$Timer.set_wait_time(2)
	$Timer.connect("timeout", self, "leak")
	yield(get_tree().create_timer(rand_range(.5, 5)), "timeout")
	$Timer.start()
	$AudioStreamPlayer3D.play()

func leak():
	$AudioStreamPlayer3D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

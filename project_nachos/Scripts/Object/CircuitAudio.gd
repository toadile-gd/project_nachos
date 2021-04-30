extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer3D.stream.set_loop(false)
	$Timer.set_wait_time(1.5)
	$Timer.connect("timeout", self, "spark")
	yield(get_tree().create_timer(rand_range(.2, .7)), "timeout")
	$Timer.start()
	$AudioStreamPlayer3D.play()

func spark():
	$AudioStreamPlayer3D.set_pitch_scale(rand_range(1.5, 3.0))
	$AudioStreamPlayer3D.play()
	$Timer.set_wait_time(rand_range(.2, .7))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

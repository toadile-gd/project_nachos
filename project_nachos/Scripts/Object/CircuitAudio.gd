extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer3D.set_unit_db(-10)
	$AudioStreamPlayer3D.stream.set_loop(false)
	$Timer.set_wait_time(2)
	$Timer.connect("timeout", self, "spark")
	$Timer.start()
	$AudioStreamPlayer3D.play()

func spark():
	$AudioStreamPlayer3D.set_pitch_scale(rand_range(.5, 1.5))
	$AudioStreamPlayer3D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

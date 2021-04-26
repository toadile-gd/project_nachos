extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer3D.set_unit_db(-40)
	$AudioStreamPlayer3D.stream.set_loop(false)
	$Timer.set_wait_time(20)
	$Timer.connect("timeout", self, "bubble")
	yield(get_tree().create_timer(rand_range(1, 20)), "timeout")
	$Timer.start()
	$AudioStreamPlayer3D.play()

func bubble():
	$AudioStreamPlayer3D.set_pitch_scale(rand_range(.8, 1.2))
	$AudioStreamPlayer3D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

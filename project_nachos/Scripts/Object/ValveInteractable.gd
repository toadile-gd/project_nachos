extends "res://Scripts/Object/Interactable.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hold_timer

var full_rotation = 360

var rotation_increment = 30

var is_rotating = false

func _ready():
	hold_timer = Timer.new()
	hold_timer.set_wait_time(0.3)
	hold_timer.connect("timeout", self, "stop_event")

func reset_hold_timer():
	if (hold_timer.is_paused()):
		hold_timer.set_paused(false)
	hold_timer.start()
	rotate_valve()
	
func rotate_valve():
	is_rotating = true
	while (is_rotating):
		pass
		## play animation

func stop_event():
	is_rotating = false

func event_complete():
	##GameManager
	pass
	

func activate():
	reset_hold_timer()
	if (!is_rotating):
		rotate_valve()
	.activate()



extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var light_type = 0

enum state {
	ON = 0, 
	OFF = 1, 
	FLICKER_ON = 2, 
	FLICKER_OFF = 3
	}

onready var light = get_node("SpotLight")

# Called when the node enters the scene tree for the first time.
func _ready():
	if (light_type == state.OFF):
		light.hide()
	elif (light_type == state.FLICKER_ON):
		start_flicker_timer("flicker_light")
	elif (light_type == state.FLICKER_OFF):
		light.hide()
		start_flicker_timer("flicker_light_inverse")

func start_flicker_timer(callback):
	$Timer.set_wait_time(rand_range(3, 15))
	$Timer.connect("timeout", self, callback)
	$Timer.start()

func flicker_light():
	light.hide()
	yield(get_tree().create_timer(0.1), "timeout")
	light.show()
	yield(get_tree().create_timer(0.1), "timeout")
	light.hide()
	yield(get_tree().create_timer(0.1), "timeout")
	light.show()
	
func flicker_light_inverse():
	light.show()
	yield(get_tree().create_timer(0.1), "timeout")
	light.hide()
	yield(get_tree().create_timer(0.1), "timeout")
	light.show()
	yield(get_tree().create_timer(0.1), "timeout")
	light.hide()


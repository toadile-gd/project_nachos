extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var light = $OmniLight
export var green : Color

# Called when the node enters the scene tree for the first time.
func _ready():
	light.hide()
	start_blink_timer()

func turn_green():
	light.light_color = green

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start_blink_timer():
	$Timer.connect("timeout", self, "blink_light")
	$Timer.start()

func blink_light():
	light.show()
	yield(get_tree().create_timer(2), "timeout")
	light.hide()


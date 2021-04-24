extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var total_time = 30
onready var minute_multiplier= 60
onready var depth_percentage = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	start_depth_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	increment_depth_percentage()

func start_depth_timer():
	$Timer.start()
	
func increment_depth_percentage():
	depth_percentage = total_time * minute_multiplier / $Timer.time_left
	print(depth_percentage)

func get_depth_precentage():
	return depth_percentage


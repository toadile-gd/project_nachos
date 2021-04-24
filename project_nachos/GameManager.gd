extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var total_time = 30

var current_time = 0

var minute_multiplier= 60

var depth_percentage = 0

var leaks_total = 15 

var leaks_repaired = 0 

var pipes_total = 8 

var pipes_repaired = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	convert_time_to_minutes()
	start_depth_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start_depth_timer():
	$Timer.connect("timeout", self, "increment_depth_percentage")
	$Timer.start()
	

func convert_time_to_minutes():
	total_time *= 60

func increment_depth_percentage():
		current_time += 1
		depth_percentage = float (current_time) / total_time
		print("Depth percentage: " + depth_percentage)

func get_depth_precentage():
	return depth_percentage

func get_leaks_remaining():
	return leaks_total - leaks_repaired
	
func get_pipes_remaining():
	return pipes_total - pipes_repaired

func end_game():
	pass


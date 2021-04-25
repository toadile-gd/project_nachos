extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var total_time = 10

var skybox_color

var ambient_light_intensity

var global_lighting_offset = 0.001

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
	yield(get_tree().create_timer(2), "timeout")
	start_depth_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func initialize_level():
	start_depth_timer()

func start_depth_timer():
	$Timer.connect("timeout", self, "_on_depth_timer_timeout")
	$Timer.start()
	

func convert_time_to_minutes():
	total_time *= 60

func _on_depth_timer_timeout():
	increment_depth_percentage()
	darken_skybox()
	 

func increment_depth_percentage():
		current_time += 1
		depth_percentage = float (current_time) / total_time
		current_time = total_time
		print("Depth percentage: ", depth_percentage)

func get_depth_precentage():
	return depth_percentage

func darken_skybox():
	if(skybox_color == null):
		skybox_color = GlobalLightingUtils.get_skybox_color()
	skybox_color = Color(skybox_color.r - global_lighting_offset,
		skybox_color.g - global_lighting_offset,
		skybox_color.b - global_lighting_offset)
	GlobalLightingUtils.set_skybox_color(skybox_color)
	
	if (ambient_light_intensity == null):
		ambient_light_intensity = GlobalLightingUtils.get_ambient_light_intensity()
	ambient_light_intensity -= global_lighting_offset
	GlobalLightingUtils.set_ambient_light_intensity(ambient_light_intensity)
	
func get_leaks_remaining():
	return leaks_total - leaks_repaired
	
func get_pipes_remaining():
	return pipes_total - pipes_repaired

func end_game():
	pass


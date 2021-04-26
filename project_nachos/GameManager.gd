extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var inventory = []

enum win_conditions {
	VICTORY,
	DEFEAT
}


export var total_time = 10

var skybox_color

var ambient_light_intensity

var global_lighting_offset = 0.5

var current_time = 0

var minute_multiplier= 60

var depth_percentage = 0

var game_done = false

var failure = false

# Called when the node enters the scene tree for the first time.
func _ready():
	## AudioManager.start_song("Main Menu")
	##
	## yield(get_tree().get_current_scene(), "asfdasdf")
	## AudioManager.start_song("Theme")
	convert_time_to_minutes()
	start_depth_timer()

func reset():
	AudioManager.play_level_theme()
	##AudioManager.play_sound("power_off")
	current_time = 0
	depth_percentage = 0
	inventory = []
	failure = false
	game_done = false
	GlobalLightingUtils.reset()
	skybox_color = null

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
	if (depth_percentage <= 1):
		current_time += 1
		depth_percentage = float (current_time) / total_time
		print("Depth percentage: ", depth_percentage)
	else:
		end_game(win_conditions.DEFEAT)

func get_depth_precentage():
	return depth_percentage

func darken_skybox():
	if(skybox_color == null):
		skybox_color = GlobalLightingUtils.base_color
	skybox_color = Color(skybox_color.r - global_lighting_offset*depth_percentage,
		skybox_color.g - global_lighting_offset*depth_percentage,
		skybox_color.b - global_lighting_offset*depth_percentage)
	GlobalLightingUtils.set_skybox_color(skybox_color)
	
	
	if (ambient_light_intensity == null):
		ambient_light_intensity = GlobalLightingUtils.base_ambient_light_intensity
	ambient_light_intensity = (1-depth_percentage)
	GlobalLightingUtils.set_ambient_light_intensity(ambient_light_intensity)
	
func add_item(item):
	print(item)
	if not inventory.has(item):
		inventory.append(item)

func check_item(item):
	print(item, " ", inventory.has(item))
	return inventory.has(item)

func end_game(condition):
	if game_done:
		return
	game_done = true
	if (condition == win_conditions.VICTORY):
		game_done = false
		Tooltip.uprintb("Repair successful. Ascending to surface.", 5)
		yield(get_tree().create_timer(5), "timeout")
		## TODO victory screen
		get_tree().call_deferred("change_scene", "res://Scenes/title_screen.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pass
	else:
		failure = true
		Tooltip.uprintb("You have failed.", 5)
		yield(get_tree().create_timer(5), "timeout")
		game_done = false
		failure = false
		get_tree().call_deferred("change_scene", "res://Scenes/title_screen.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pass


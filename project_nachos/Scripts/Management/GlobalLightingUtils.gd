extends WorldEnvironment


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var base_env = preload("res://Environment/default_env.tres")
var base_color
var base_ambient_light_intensity

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	set_environment(base_env)
	base_color = get_skybox_color()
	base_ambient_light_intensity = get_ambient_light_intensity()

func reset():
	print("reset")
	set_skybox_color(base_color)
	set_ambient_light_intensity(base_ambient_light_intensity)
	set_environment(base_env)
	print("done")

func get_skybox_color():
	return environment.get_bg_color()

func set_skybox_color(color):
	environment = base_env
	environment.set_bg_color(color)
	environment.fog_color = color
	set_environment(environment)

func get_ambient_light_intensity():
	return environment.get_ambient_light_energy() 

func set_ambient_light_intensity(intensity):
	environment = base_env
	environment.set_ambient_light_energy(intensity)
	set_environment(environment)
	

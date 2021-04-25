extends WorldEnvironment


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var base_env = preload("res://Environment/default_env.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_environment(base_env)

func get_skybox_color():
	return environment.get_bg_color()

func set_skybox_color(color):
	environment = base_env
	environment.set_bg_color(color)
	set_environment(environment)

func get_ambient_light_intensity():
	return environment.get_ambient_light_energy() 

func set_ambient_light_intensity(intensity):
	environment = base_env
	environment.set_ambient_light_energy(intensity)
	set_environment(environment)
	

extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var audio_stream = AudioStreamPlayer.new()

onready var fx_stream = AudioStreamPlayer.new()

onready var menu_theme = preload("res://Sounds/mainmenu.mp3")

onready var level_theme = preload("res://Sounds/submortis.mp3")


var loop_offset = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	menu_theme.set_loop(true)
	menu_theme.set_loop_offset(loop_offset)
	level_theme.set_loop(true)
	level_theme.set_loop_offset(loop_offset)
	audio_stream.set_stream(menu_theme)
	audio_stream.set_volume_db(-20)
	add_child(audio_stream)
	add_child(fx_stream)
	play_menu_theme()

func _process(delta: float):
	print(audio_stream.is_playing())

func play_menu_theme():
	audio_stream.play()
	
func play_level_theme():
	audio_stream.stop()
	audio_stream.set_stream(level_theme)
	add_child(audio_stream)
	add_child(fx_stream)
	audio_stream.play()
	
func play_sound(sound):
	var mp3 = load("res://Sounds/" + sound)
	mp3.set_loop(false)
	fx_stream.set_stream(mp3)
	fx_stream.play()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var audio_stream = AudioStreamPlayer.new()

onready var background_fx_stream = AudioStreamPlayer.new()

onready var background_fx_timer = Timer.new()

onready var fx_stream = AudioStreamPlayer.new()

onready var backup_fx_stream = AudioStreamPlayer.new()

onready var menu_theme = preload("res://Sounds/mainmenu.mp3")

onready var level_theme = preload("res://Sounds/submortis.mp3")

onready var background_fx = preload("res://Sounds/Roll1.mp3")

var loop_offset = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	menu_theme.set_loop(true)
	menu_theme.set_loop_offset(loop_offset)
	level_theme.set_loop(true)
	level_theme.set_loop_offset(loop_offset)
	audio_stream.set_stream(menu_theme)
	audio_stream.set_volume_db(-20)
	background_fx.set_loop(false)
	background_fx_stream.set_stream(background_fx)
	background_fx_stream.set_volume_db(-15)
	background_fx_stream.set_pitch_scale(.05)
	add_child(audio_stream)
	add_child(fx_stream)
	background_fx_timer.set_one_shot(false)
	background_fx_timer.set_wait_time(20)
	background_fx_timer.connect("timeout", self, "play_background_fx")
	play_menu_theme()

func _process(delta: float):
	pass

func play_menu_theme():
	audio_stream.play()
	
func play_level_theme():
	audio_stream.stop()
	audio_stream.set_stream(level_theme)
	add_child(audio_stream)
	add_child(fx_stream)
	add_child(backup_fx_stream)
	add_child(background_fx_stream)
	add_child(background_fx_timer)
	background_fx_timer.start()
	audio_stream.play()

func play_background_fx():
	if(background_fx_stream.is_playing()):
		background_fx_stream.stop()
	else:
		background_fx_stream.play()
	
func play_sound(sound):
	var mp3 = load("res://Sounds/" + sound + ".mp3")
	mp3.set_loop(false)
	if(!fx_stream.is_playing()):
		fx_stream.set_stream(mp3)
		fx_stream.set_volume_db(-10)
		fx_stream.play()
	elif(!backup_fx_stream.is_playing()):
		backup_fx_stream.set_stream(mp3)
		backup_fx_stream.set_volume_db(-10)
		backup_fx_stream.play()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

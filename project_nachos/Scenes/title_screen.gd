extends Control

func _ready():
	for button in $menu/button_container/buttons.get_children():
		button.connect("pressed", self, "_on_button_pressed", [button.scene_to_load])
	$controls_menu/back.connect("pressed", self, "_back_func")

func _on_button_pressed(scene_to_load):
	if scene_to_load == "EXIT_GAME":
		get_tree().quit()
	elif scene_to_load == "CONTROLS":
		$controls_menu.visible = true
	else:
		get_tree().change_scene(scene_to_load)

func _back_func() -> void:
	$controls_menu.visible = false

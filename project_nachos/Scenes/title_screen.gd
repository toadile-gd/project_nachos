extends Control

func _ready():
	for button in $menu/button_container/buttons.get_children():
		button.connect("pressed", self, "_on_button_pressed", [button.scene_to_load])

func _on_button_pressed(scene_to_load):
	if scene_to_load == "EXIT_GAME":
		get_tree().quit()
	else:
		get_tree().change_scene(scene_to_load)

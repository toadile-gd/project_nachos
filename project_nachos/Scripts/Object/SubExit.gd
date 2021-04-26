extends Area

export var interactible_name = "ladder"
var victory : VictoryConditions

func _ready():
	 victory = get_tree().current_scene.find_node("VictoryConditions")

func activate():
	Tooltip.uprintb("You need to ascend to the surface first.", 2)
	print(victory.check_ready_for_victory())
	print(victory.get_damage_percentage())
	if victory.check_ready_for_victory():
		GameManager.end_game(GameManager.win_conditions.VICTORY)


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
	elif not victory.check_damages():
		Tooltip.uprintb("The submarine is not repaired yet...", 3)
	elif not victory.squid_dead:
		Tooltip.uprintb("I need to take care of that squid...", 3)


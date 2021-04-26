extends Node

var engine_damages : Node
var engine_running = false
var damages : Node
var total_damage
var squid

func _ready():
	engine_damages = get_parent().find_node("engine_room")
	damages = get_parent().find_node("Damages")
	total_damage = get_all_damage()
	squid = get_parent().find_node("Squid")

func check_engine():
	return engine_damages.get_child_count() == 0 and engine_running

func check_squid():
	return squid == null

func check_ready_for_victory():
	return check_squid() and check_engine() and check_damages()

func check_damages():
	var still_damage = false
	for child in damages.get_children():
		if child.get_child_count() > 0:
			still_damage = true
	return not still_damage

func get_damage_percentage():
	return String(get_all_damage()/total_damage * 100)+"%"

func get_all_damage():
	var total : int = 0
	for child in damages.get_children():
		total += child.get_child_count()
	return total

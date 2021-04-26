extends Spatial


# Declare member variables here. Examples:
var dead = false
export var speed = 2.0

func _physics_process(delta):
	translate_object_local(Vector3.FORWARD*delta*speed)

func _on_Area_body_entered(body):
	GameManager.end_game(GameManager.win_conditions.DEFEAT)
	speed = 0.00


func _on_Area_area_entered(area):
	$squid/anim.play("die")
	dead = true
	speed = 0.00


func _on_anim_animation_finished(anim_name):
	if anim_name == "die":
		queue_free()

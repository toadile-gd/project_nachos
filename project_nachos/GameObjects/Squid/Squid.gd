extends Spatial


# Declare member variables here. Examples:
var dead = false
export var speed = 2.0
var time = 0
var message_sent = false

func _physics_process(delta):
	translate_object_local(Vector3.FORWARD*delta*speed)
	time += delta
	if time > 300 and not message_sent:
		message_sent = true
		Tooltip.uprintb("Sounds like that giant squid is getting close...", 3)

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

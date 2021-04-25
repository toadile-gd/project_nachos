extends Spatial


# Declare member variables here. Examples:
var dead = false
export var speed = 2.0

func _physics_process(delta):
	translate_object_local(Vector3.FORWARD*delta*speed)

func _on_Area_body_entered(body):
	$squid/anim.play("die")
	dead = true

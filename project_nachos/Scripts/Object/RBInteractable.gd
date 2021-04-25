extends "res://Scripts/Object/Interactable.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var velocity = 5

func activate():
	$RigidBody.apply_impulse($Translation,Vector3.FORWARD * velocity)
	.activate()



extends Area

export var health = 60

func activate():
	health -= 1

func _physics_process(delta):
	if health <= 0:
		queue_free()

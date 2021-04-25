extends Position3D

var val = 0.0
const max_rotation = 280

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (val >= deg2rad(max_rotation)):
		# DEATH
		pass
	else:
		rotate_object_local(Vector3.BACK, 0.001*delta)
		val += 0.5*delta
	pass

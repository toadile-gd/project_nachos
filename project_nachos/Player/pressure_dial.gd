extends Position3D

var val = 0.0
const max_rotation = 280

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotation_degrees.z = GameManager.get_depth_precentage()*max_rotation-180

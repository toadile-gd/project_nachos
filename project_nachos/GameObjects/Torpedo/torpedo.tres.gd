extends Spatial

export var speed = 5.0
var enabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if enabled:
		translate_object_local(-Vector3.FORWARD*speed*delta)

func activate():
	enabled = true

func _on_Area_area_entered(area):
	queue_free()

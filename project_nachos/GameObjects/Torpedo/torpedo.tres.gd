extends Spatial

export var speed = 8.0
export var enabled = false
var victory : VictoryConditions

func _ready():
	victory = get_tree().current_scene.find_node("VictoryConditions")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if enabled:
		translate_object_local(-Vector3.FORWARD*speed*delta)

func activate():
	enabled = true

func _on_Area_area_entered(area):
	Tooltip.uprintb("Squid neutralized",2)
	victory.squid_dead = true
	queue_free()

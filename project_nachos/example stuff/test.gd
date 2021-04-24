extends MeshInstance

var base_speed = 2
export var adjusted_speed : float = 5.0
var camera : Camera

enum states {
	idle,
	hurt,
	jump,
}
var current_state = states.idle

# Called when the node enters the scene tree for the first time.
func _ready():
	camera = find_node("Camera")
	print(camera.name)
	camera.rotate_x(PI)
	
	yield(null, current_state == states.hurt)
	print("timeout")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	match current_state:
		states.idle:
			pass
		states.hurt:
			$Timer.start()
			pass
		states.jump:
			pass
		_:
			pass
	pass

func _exit_tree():
	pass

func _on_Area_body_entered(body):
	print("NACHOS!!!")
	print(body.name)

func _input(event):
	if Input.is_action_just_pressed("jump"):
		print("jump")
	
	if event is InputEventJoypadMotion:
#		print(event.axis_value)
		pass


func _on_Timer_timeout():
	current_state = states.idle

extends KinematicBody


export var mov_speed : float = 2.0
export var look_speed : float = 10.0

var gravity = Vector3.DOWN * 9.8
var velocity = Vector3.ZERO

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass

func _physics_process(delta):
	
	# PAUSING
	if Input.is_action_just_pressed("pause"):
			if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			elif Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	# MOVEMENT
	var mov_vec : Vector3 = Vector3.ZERO
	if Input.is_action_pressed("up"):
		mov_vec += Vector3.FORWARD
	elif Input.is_action_pressed("down"):
		mov_vec -= Vector3.FORWARD
	if Input.is_action_pressed("right"):
		mov_vec += Vector3.RIGHT
	elif Input.is_action_pressed("left"):
		mov_vec -= Vector3.RIGHT
	mov_vec = mov_vec.normalized()
	mov_vec = mov_vec.rotated(Vector3.UP, rotation.y)
	mov_vec *= mov_speed
	
	if Input.is_action_pressed("run"):
		mov_vec *= 1.5
	
	move_and_slide(mov_vec)
	if $ground_ray.is_colliding():
		move_and_slide(-3*$ground_ray.get_collision_normal())
	else:
		velocity += gravity
		velocity = move_and_slide(velocity)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x*look_speed/1000)
		$aim.rotate_x(-event.relative.y*look_speed/1000)
		$aim.rotation_degrees.x = clamp($aim.rotation_degrees.x, -90, 90)
	pass

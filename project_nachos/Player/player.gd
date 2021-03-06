extends KinematicBody


export var mov_speed : float = 2.0
export var look_speed : float = 10.0

var gravity = Vector3.DOWN * 9.8
var velocity = Vector3.ZERO

enum items {
	none,
	wrench,
	fire,
	foam,
	iron
}
var item = items.none

func _menus_visible():
	return $manual_overlay/manual.visible or $escape/escape_menu.visible or $escape/escape_menu/controls_menu.visible

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$aim/cam/arms/right_arm.visible = false
	GameManager.reset()
	pass

func _physics_process(delta):
	
	# PAUSING
	if Input.is_action_just_pressed("pause"):
		if not $escape/escape_menu.visible:
			$escape/escape_menu.visible = true
			$escape/escape_menu/controls_menu.visible = false
		else:
			$escape/escape_menu.visible = false
			$escape/escape_menu/controls_menu.visible = false
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE and $manual_overlay/manual.visible == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		elif Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and $manual_overlay/manual.visible == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	# OPEN/CLOSE MANUAL
	if Input.is_action_just_pressed("ui_focus_next"):
		if not $manual_overlay/manual.visible:
			$manual_overlay/manual.visible = true
			if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and $escape/escape_menu.visible == false:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE and $escape/escape_menu.visible == false:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			$manual_overlay/manual.visible = false
			
	if not _menus_visible():
		
		# INVENTORY
		var switch = false
		if Input.is_action_just_pressed("1"):
			if GameManager.check_item("WRENCH"):
				item = items.none if item == items.wrench else items.wrench
				switch = true
		elif Input.is_action_just_pressed("2"):
			if GameManager.check_item("FIRE_EXTINGUISHER"):
				item = items.none if item == items.fire else items.fire
				switch = true
		elif Input.is_action_just_pressed("3"):
			if GameManager.check_item("FOAM"):
				item = items.none if item == items.foam else items.foam
				switch = true
		elif Input.is_action_just_pressed("4"):
			if GameManager.check_item("IRON"):
				item = items.none if item == items.iron else items.iron
				switch = true
		if (switch):
			$aim/cam/arms/right_arm/fire/particle.restart()
			$aim/cam/arms/right_arm/foam/particle.restart()
			$aim/cam/arms/right_arm/iron/particle.restart()
			$aim/cam/arms/right_arm/anim.play("switch", -1)
			match item:
				items.none:
					$aim/cam/arms/right_arm.visible = false
				items.wrench:
					$aim/cam/arms/right_arm.visible = true
					hide_objects($aim/cam/arms/right_arm.get_children())
					$aim/cam/arms/right_arm/wrench.visible = true
				items.fire:
					$aim/cam/arms/right_arm.visible = true
					hide_objects($aim/cam/arms/right_arm.get_children())
					$aim/cam/arms/right_arm/fire.visible = true
				items.foam:
					$aim/cam/arms/right_arm.visible = true
					hide_objects($aim/cam/arms/right_arm.get_children())
					$aim/cam/arms/right_arm/foam.visible = true
				items.iron:
					$aim/cam/arms/right_arm.visible = true
					hide_objects($aim/cam/arms/right_arm.get_children())
					$aim/cam/arms/right_arm/iron.visible = true
				_:
					pass
		
		if $aim/cam/look_ray.is_colliding():
			Tooltip.uprint("Press F to interact with "+$aim/cam/look_ray.get_collider().interactible_name)
		elif $aim/effect.get_overlapping_areas().size() > 0:
			var damage = $aim/effect.get_overlapping_areas()[0].name
			if "fire" in damage:
				if GameManager.check_item("FIRE_EXTINGUISHER"):
					Tooltip.uprint("Use fire extinguisher (2) to put out fire")
				else:
					Tooltip.uprintb("Need to find a fire extinguisher", 1)
			elif "steam" in damage:
				if GameManager.check_item("WRENCH"):
					Tooltip.uprint("Use wrench (1) to fix steam pressure leak")
				else:
					Tooltip.uprintb("Need to find a wrench", 1)
			elif "leak" in damage:
				if GameManager.check_item("FOAM"):
					Tooltip.uprint("Use cementing foam (3) to fix water leak in hull")
				else:
					Tooltip.uprintb("Need to find a can of cementing foam",1)
			elif "circuit" in damage:
				if GameManager.check_item("IRON"):
					Tooltip.uprint("Use soldering iron (4) to fix electrical equipment")
				else:
					Tooltip.uprintb("Need to find a soldering iron",1)
		
		# INTERACT
		if Input.is_action_just_pressed("interact"):
			print("interact!")
			if $aim/cam/look_ray.is_colliding():
				$aim/cam/look_ray.get_collider().activate()
		
		# TOOLS
		if Input.is_action_pressed("click"):
			match item:
				items.none:
					pass
				items.wrench:
					$aim/cam/arms/right_arm/anim.play("wrench")
					action("steam")
				items.fire:
					$aim/cam/arms/right_arm/anim.play("reach")
					$aim/cam/arms/right_arm/fire/particle.emitting = true
					AudioManager.play_sound("spray_foam")
					action("fire")
				items.foam:
					$aim/cam/arms/right_arm/anim.play("reach")
					$aim/cam/arms/right_arm/foam/particle.emitting = true
					AudioManager.play_sound_volume("foam", -25)
					action("leak")
				items.iron:
					$aim/cam/arms/right_arm/anim.play("reach")
					$aim/cam/arms/right_arm/iron/particle.emitting = true
					action("circuit")
				_:
					pass
		else:
			$aim/cam/arms/right_arm/anim.play("default")
			$aim/cam/arms/right_arm/fire/particle.emitting = false
			$aim/cam/arms/right_arm/foam/particle.emitting = false
			$aim/cam/arms/right_arm/iron/particle.emitting = false
		
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
		
		var mov_offset = 0
		if Input.is_action_pressed("run"):
			mov_offset = 1
			mov_vec *= 1.75
		
		if mov_vec.length_squared() > 0.1 and not $aim/cam/cam_anim.current_animation == "walk":
			$aim/cam/cam_anim.play("walk", 0.1, 1.5+mov_offset)
		elif mov_vec.length_squared() < 0.1:
			$aim/cam/cam_anim.play("idle", 0.5, 0.5)
		
		move_and_slide(mov_vec)
		if $ground_ray.is_colliding():
			move_and_slide(-3*$ground_ray.get_collision_normal())
		else:
			velocity += gravity
			velocity = move_and_slide(velocity)
	else:
		$aim/cam/cam_anim.play("idle")

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x*look_speed/1000)
		$aim.rotate_x(-event.relative.y*look_speed/1000)
		$aim.rotation_degrees.x = clamp($aim.rotation_degrees.x, -90, 90)
	pass

## CUSTOM FUNCTIONS

func action(type):
	for obj in $aim/effect.get_overlapping_areas():
		if type in obj.name:
			obj.activate()

func hide_objects(array):
	for obj in array:
		if obj is VisualInstance:
			obj.visible = false

extends Area


export var hint_text = "Edit this hint text"
export var hint_time = 3

func _on_Area_body_entered(body):
	if body.name == "player":
		Tooltip.uprintb(hint_text, hint_time)
		queue_free()

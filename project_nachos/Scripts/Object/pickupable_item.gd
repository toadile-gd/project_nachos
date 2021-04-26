extends Area


export var item_name : String = ""
export var interactible_name = "wrench"
export var pickup_message = "You picked up a wrench"

func activate():
	AudioManager.play_sound("key")
	GameManager.add_item(item_name)
	Tooltip.uprintb(pickup_message, 2)
	queue_free()

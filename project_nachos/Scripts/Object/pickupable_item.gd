extends Area


export var item_name : String = ""
export var interactible_name = "wrench"

func activate():
	GameManager.add_item(item_name)
	queue_free()

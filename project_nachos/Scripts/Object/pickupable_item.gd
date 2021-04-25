extends Area


export var item_name : String = ""

func activate():
	GameManager.add_item(item_name)
	queue_free()

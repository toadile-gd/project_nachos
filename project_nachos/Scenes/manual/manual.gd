extends Control

func _ready():
	$page_1_2.visible = false
	$page_3_4.visible = false
	$page_5_6.visible = false
	$page_7_8.visible = false
	
	# Cover page buttons
	$cover/to_page_1_2.connect("pressed", self, "_on_button_pressed", ["page_1_2"])
	
	# Page 1_2 Buttons
	$page_1_2/to_cover.connect("pressed", self, "_on_button_pressed", ["cover"])
	$page_1_2/to_page_3_4.connect("pressed", self, "_on_button_pressed", ["page_3_4"])
	
	# Page 3_4 Buttons
	$page_3_4/to_page_1_2.connect("pressed", self, "_on_button_pressed", ["page_1_2"])
	$page_3_4/to_page_5_6.connect("pressed", self, "_on_button_pressed", ["page_5_6"])
	
	# Page 5_6 Buttons
	$page_5_6/to_page_3_4.connect("pressed", self, "_on_button_pressed", ["page_3_4"])
	$page_5_6/to_page_7_8.connect("pressed", self, "_on_button_pressed", ["page_7_8"])
	
	# Page 7_8 Buttons
	$page_7_8/to_page_5_6.connect("pressed", self, "_on_button_pressed", ["page_5_6"])

func _on_button_pressed(left_right):
	if left_right == "cover":
		$page_1_2.visible = false
		$cover.visible = true
	if left_right == "page_1_2":
		$cover.visible = false
		$page_3_4.visible = false
		$page_1_2.visible = true
	if left_right == "page_3_4":
		$page_1_2.visible = false
		$page_5_6.visible = false
		$page_3_4.visible = true
	if left_right == "page_5_6":
		$page_3_4.visible = false
		$page_7_8.visible = false
		$page_5_6.visible = true
	if left_right == "page_7_8":
		$page_5_6.visible = false
		$page_7_8.visible = true
		

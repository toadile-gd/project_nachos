extends Control

var timeout = 0.1
var timedout = true

func _ready():
	$CenterContainer/Label.text = ""

func uprint(msg : String):
	if (timedout):
		$CenterContainer/Label.text = msg
		$Timer.start(timeout)

func uprintb(msg : String, time):
	$CenterContainer/Label.text = msg
	$Timer.start(time)
	timedout = false

func _on_Timer_timeout():
	$CenterContainer/Label.text = ""
	timedout = true

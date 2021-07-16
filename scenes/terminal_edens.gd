extends Control


# Declare member variables here. Examples:
var active_user = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Audio_WRONG.playing == true:
		var pos = $Audio_WRONG.get_playback_position()
		if pos > 0.3:
			$Audio_WRONG.stop()
	if $Audio_RIGHT.playing == true:
		var pos = $Audio_RIGHT.get_playback_position()
		if pos > 0.3:
			$Audio_RIGHT.stop()




func _on_Check_RYAN_pressed():
	active_user = "RYAN"
	if $Check_EDEN.pressed == true:
		$Check_EDEN.pressed = false

func _on_Check_EDEN_pressed():
	active_user = "EDEN"
	if $Check_RYAN.pressed == true:
		$Check_RYAN.pressed = false



func _on_Button_pressed():
	if active_user == "RYAN" and $LineEdit.text != "1234":
		$Audio_WRONG.play()
	elif active_user == "RYAN" and $LineEdit.text == "1234":
		$Audio_RIGHT.play()
		
	if active_user == "EDEN" and $LineEdit.text != "1234":
		$Audio_WRONG.play()
	elif active_user == "EDEN" and $LineEdit.text == "1234":
		$Audio_RIGHT.play()


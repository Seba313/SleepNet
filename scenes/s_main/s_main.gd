extends Spatial

#-----------------SCENE--SCRIPT------------------#
#    Close your game faster by clicking 'Esc'    #
#   Change mouse mode by clicking 'Shift + F1'   #
#------------------------------------------------#

export var fast_close := true
var mouse_mode: String = "CAPTURED"

##################################################

func _ready() -> void:
	if fast_close:
		print("** Fast Close enabled in the 's_main.gd' script **")
		print("** 'Esc' to close 'Shift + F1' to release mouse **")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and fast_close:
		get_tree().quit() # Quits the game
	
	if event.is_action_pressed("mouse_input") and fast_close:
		match mouse_mode: # Switch statement in GDScript
			"CAPTURED":
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				mouse_mode = "VISIBLE"
			"VISIBLE":
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				mouse_mode = "CAPTURED"

func _on_Kitchen_body_entered(Player):
	if $EdensFlat/EdensFlat_kitchen/Lighs/light_kitchen.visible == false:
		$EdensFlat/EdensFlat_kitchen/Lighs/light_kitchen.visible = true
		$EdensFlat/EdensFlat_kitchen/Sounds/switch_ON.play()

func _on_Kitchen_body_exited(Player):
	if $EdensFlat/EdensFlat_kitchen/Lighs/light_kitchen.visible == true:
		$EdensFlat/EdensFlat_kitchen/Lighs/light_kitchen.visible = false
		$EdensFlat/EdensFlat_kitchen/Sounds/switch_OFF.play()



func _on_Bedroom_body_entered(Player):
	if $EdensFlat/EdensFlat_bedroom/lights/light_bedroom.visible == false:
		$EdensFlat/EdensFlat_bedroom/lights/light_bedroom.visible = true
		$EdensFlat/EdensFlat_bedroom/sounds/switch_ON.play()

func _on_Bedroom_body_exited(Player):
	if $EdensFlat/EdensFlat_bedroom/lights/light_bedroom.visible == true:
		$EdensFlat/EdensFlat_bedroom/lights/light_bedroom.visible = false
		$EdensFlat/EdensFlat_bedroom/sounds/switch_OFF.play()



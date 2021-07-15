extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_door_openclose_body_entered(Player):
	$AnimationPlayer.play("kitchbatch_anim")


func _on_door_openclose_body_exited(Player):
	$AnimationPlayer.play_backwards("kitchbatch_anim")

extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	if Input.get_connected_joypads().size() == 0:
		get_tree().change_scene_to_file("res://scene/screen/noController/noController.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends Node

func _ready():
	if Input.get_connected_joypads().size() == 0:
		get_tree().change_scene_to_file("res://scene/screen/noController/noController.tscn")

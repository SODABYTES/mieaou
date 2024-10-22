extends Node
@onready var cameraPivot = $CanvasLayer/SubViewportContainer/SubViewport/CameraPivot

var timePassed:float = 0

func _process(delta):
	timePassed += 1 * delta
	cameraPivot.rotation.x = sin(timePassed * 3) / 4
	cameraPivot.rotation.y = cos(timePassed * 3) / 4
	if Input.get_connected_joypads().size() > 0:
		get_tree().change_scene_to_file("res://scene/test/test.tscn")

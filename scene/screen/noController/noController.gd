extends Node
@onready var cameraPivot = $CameraPivot

var timePassed:float = 0

func _process(delta):
	timePassed += 1 * delta
	cameraPivot.rotation.x = sin(timePassed * 3) / 4
	cameraPivot.rotation.y = cos(timePassed * 3) / 4

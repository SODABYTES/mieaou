extends Node3D
@onready var camera = $Camera3D

var cameraSpeed:float = 3
var zoomSpeed:float = 3

var inputAxisL:Vector2 = Vector2(0,0)
var inputAxisR:Vector2 = Vector2(0,0)

var zoomIn:bool = false
var zoomOut:bool = false

func _physics_process(delta):
	getInput()
	if abs(inputAxisR.x) > 0.25:
		rotation.y += -inputAxisR.x * cameraSpeed * delta
	if abs(inputAxisR.y) > 0.25:
		rotation.x += -inputAxisR.y * cameraSpeed * delta
	rotation.x = clampf(rotation.x, -PI / 2, PI / 2)
	
	if zoomIn:
		camera.position.z -= zoomSpeed * delta
	if zoomOut:
		camera.position.z += zoomSpeed * delta
	pass

func getInput():
	inputAxisL = Vector2(Input.get_joy_axis(0, JOY_AXIS_LEFT_X), Input.get_joy_axis(0, JOY_AXIS_LEFT_Y))
	inputAxisR = Vector2(Input.get_joy_axis(0, JOY_AXIS_RIGHT_X), Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y))
	if Input.get_joy_axis(0, JOY_AXIS_TRIGGER_RIGHT) > 0.5:
		zoomIn = true
	else:
		zoomIn = false
	zoomOut = Input.is_joy_button_pressed(0, JOY_BUTTON_RIGHT_SHOULDER)

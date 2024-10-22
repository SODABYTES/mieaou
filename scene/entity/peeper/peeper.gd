extends Node3D
@onready var camera = $Camera3D

var cameraSpeed:float = 3
var zoomSpeed:float = 3
var moveSpeed:float = 2

var inputAxisL:Vector2 = Vector2(0,0)
var inputAxisR:Vector2 = Vector2(0,0)

var inputPad:Vector2 = Vector2(0,0)

func _physics_process(delta):
	getInput()
	if abs(inputAxisR.x) > 0.25:
		rotation.y += -inputAxisR.x * cameraSpeed * delta
	if abs(inputAxisR.y) > 0.25:
		rotation.x += -inputAxisR.y * cameraSpeed * delta
	rotation.x = clampf(rotation.x, -PI / 2, PI / 2)
	
	position.x += (inputPad.x * cos(rotation.y)) * moveSpeed * delta
	position.z += (inputPad.x * -sin(rotation.y)) * moveSpeed * delta
	
	position.z += (inputPad.y * cos(rotation.y)) * cos(rotation.x) * moveSpeed * delta
	position.x += (inputPad.y * sin(rotation.y)) * cos(rotation.x) * moveSpeed * delta
	
	position.y += (inputPad.y * -sin(rotation.x)) * moveSpeed * delta

func getInput():
	inputAxisL = Vector2(Input.get_joy_axis(0, JOY_AXIS_LEFT_X), Input.get_joy_axis(0, JOY_AXIS_LEFT_Y))
	inputAxisR = Vector2(Input.get_joy_axis(0, JOY_AXIS_RIGHT_X), Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y))
	inputPad.x = int(Input.is_joy_button_pressed(0, JOY_BUTTON_DPAD_RIGHT)) - int(Input.is_joy_button_pressed(0, JOY_BUTTON_DPAD_LEFT))
	inputPad.y = int(Input.is_joy_button_pressed(0, JOY_BUTTON_DPAD_DOWN)) - int(Input.is_joy_button_pressed(0, JOY_BUTTON_DPAD_UP))

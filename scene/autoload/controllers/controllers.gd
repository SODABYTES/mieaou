extends Node

var stick = [Vector2i(128, 128), Vector2i(128, 128), Vector2i(128, 128), Vector2i(128, 128)]

var buttonA = [false,false,false,false]
var buttonB = [false,false,false,false]
var buttonX = [false,false,false,false]
var buttonY = [false,false,false,false]
var buttonL = [false,false,false,false]
var buttonR = [false,false,false,false]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	for i in 4:
		
		#stick
		stick[i].x = clampi(int((Input.get_joy_axis(i, JOY_AXIS_LEFT_X) * 128) + 128), 0, 255)
		stick[i].y = clampi(int((Input.get_joy_axis(i, JOY_AXIS_LEFT_Y) * 128) + 128), 0, 255)
		
		#button
		buttonA[i] = Input.is_joy_button_pressed(i, JOY_BUTTON_A)
		buttonB[i] = Input.is_joy_button_pressed(i, JOY_BUTTON_B)
		buttonX[i] = Input.is_joy_button_pressed(i, JOY_BUTTON_X)
		buttonY[i] = Input.is_joy_button_pressed(i, JOY_BUTTON_Y)
		
		if Input.is_joy_button_pressed(i, JOY_BUTTON_LEFT_SHOULDER) or Input.get_joy_axis(i, JOY_AXIS_TRIGGER_LEFT) > 0.5:
			buttonL[i] = true
		else:
			buttonL[i] = false
		
		if Input.is_joy_button_pressed(i, JOY_BUTTON_RIGHT_SHOULDER) or Input.get_joy_axis(i, JOY_AXIS_TRIGGER_RIGHT) > 0.5:
			buttonR[i] = true
		else:
			buttonR[i] = false

func getStickAsFloat(controller):
	var result:Vector2 = Vector2(0,0)
	result.x = clampf((stick[controller].x - 128) / 127.0, -1, 1)
	result.y = clampf((stick[controller].y - 128) / 127.0, -1, 1)
	return result

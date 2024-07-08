extends Node3D
@onready var audio = $AudioStreamPlayer3D

var button:int = -1

var l:bool = false
var r:bool = false
var d:bool = false
var u:bool = false
var a:bool = false

# -1 no button
#  0 Left
#  1 Right
#  2 Down
#  3 Up
#  4 A
var buttonPrevious:int = -1

var pitch:int = 0
var pitchShift:float = 0
var pitchWobble:float = 0

var timePassed:float = 0

func _physics_process(delta):
	timePassed += 1 * delta
	#get controller input
	var con = get_parent().controllerSlot
	button = -1
	if Controllers.buttonX[con]:
		button = 0
		pitch = 11
	if Controllers.buttonB[con]:
		button = 1
		pitch = 8
	if Controllers.buttonA[con]:
		button = 2
		pitch = 4
	if Controllers.buttonY[con]:
		button = 3
		pitch = 15
	if Controllers.buttonR[con]:
		button = 4
		pitch = 1
	pitchWobble = abs(Controllers.getStickAsFloat(con).x)
	pitchShift = Controllers.getStickAsFloat(con).y * 2
	
	if button != buttonPrevious and button != -1:
		audio.play()
	if button == -1:
		audio.stop()
	buttonPrevious = button
	audio.pitch_scale = 1 + ((pitch - pitchShift + (sin(timePassed * 32) * pitchWobble) ) / 12.0) 

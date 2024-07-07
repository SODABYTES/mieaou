extends Node3D
@onready var audio = $AudioStreamPlayer3D
var wasSingPressed:bool = false

var buttonSing:bool = false
var pitchShift:float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	getInput()
	if buttonSing:
		if !wasSingPressed:
			audio.play()
		wasSingPressed = true
	else:
		audio.stop()
		wasSingPressed = false
	if pitchShift <= 0:
		audio.pitch_scale = 1 - pitchShift
	else:
		audio.pitch_scale = 1 - (pitchShift / 2)

func getInput():
	buttonSing = Input.get_joy_axis(0, JOY_AXIS_TRIGGER_LEFT)
	
	pitchShift = Input.get_joy_axis(0, JOY_AXIS_LEFT_Y)

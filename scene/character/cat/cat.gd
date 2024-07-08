extends Node3D
@onready var model = $cat
@onready var audio = $AudioStreamPlayer3D
var wasSingPressed:bool = false

var buttonSing:bool = false
var stick:Vector2 = Vector2(0,0)
var headTilt

var jawTarget:float = -1.2
var jawCurrent:float = jawTarget

var blinkTimer:float = 0
var blinkTarget:float = 1
var blinkCurrent:float = 1

func _ready():
	jawCurrent = jawTarget

func _physics_process(delta):
	getInput()
	if buttonSing:
		jawTarget = -PI / 2
		if !wasSingPressed:
			audio.play()
		wasSingPressed = true
	else:
		jawTarget = -1.2
		audio.stop()
		wasSingPressed = false
	if stick.y <= 0:
		audio.pitch_scale = 1 - stick.y
	else:
		audio.pitch_scale = 1 - (stick.y / 2)
	
	jawCurrent = lerpf(jawCurrent, jawTarget, 32 * delta)
	
	model.get_node("Armature").get_node("Skeleton3D").set_bone_pose_rotation(1, Quaternion(Vector3.LEFT, jawCurrent))
	model.get_node("Armature").get_node("Skeleton3D").set_bone_pose_rotation(0, Quaternion(Vector3.LEFT, (-stick.y / 2) - (PI / 2)) + Quaternion(Vector3.UP, stick.x))
	
	blinkTimer += 1 * delta
	if blinkTimer >= 5:
		blinkTimer = 0
	
	if blinkTimer <= 0.125:
		blinkTarget = -0.5
	else:
		blinkTarget = 1
	blinkCurrent = lerpf(blinkCurrent, blinkTarget, 32 * delta)
	
	model.get_node("Armature/Skeleton3D").set_bone_pose_scale(4, Vector3(1, 1, blinkCurrent))
	model.get_node("Armature/Skeleton3D").set_bone_pose_scale(5, Vector3(1, 1, blinkCurrent))

func getInput():
	buttonSing = Controllers.buttonL[get_parent().controllerSlot]
	stick = Controllers.getStickAsFloat(get_parent().controllerSlot)

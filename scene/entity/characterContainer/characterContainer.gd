extends Node3D
@export_range(0,3) var controllerSlot:int = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnCharacter()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnCharacter():
	if get_node_or_null("Character"):
		get_node("Character").queue_free()
	var characterLoaded = load("res://scene/character/" + Game.character[controllerSlot] + "/character.tscn")
	var characterChild = characterLoaded.instantiate()
	characterChild.name = "Character"
	add_child(characterChild)

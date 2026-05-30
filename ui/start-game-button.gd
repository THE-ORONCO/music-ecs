extends Button

const WORLD = preload("uid://bu6at8m56x0nd")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(func(): get_tree().change_scene_to_packed(WORLD), CONNECT_ONE_SHOT)

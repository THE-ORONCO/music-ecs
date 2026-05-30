extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _init() -> void:
	child_entered_tree.connect(_fix_owner)


func _fix_owner(child: Node) -> void:
	if not is_instance_valid(child.owner):
		child.owner = self

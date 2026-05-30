class_name O_SyncSpawnPosition
extends Observer

func sub_observers() -> Array[Array]:
	return [
		[q.with_all([C_GridPosition2D]).on_added(), _sync_grid_positions],
		[q.with_all([C_Transform2D]).on_added(), _sync_transforms],
	]

func query() -> QueryBuilder:
	return q.with_all([C_GridPosition2D]).on_added()

func each(event: Variant, entity: Node, payload: Variant = null) -> void:
	if event == Observer.Event.ADDED:
		if payload is C_GridPosition2D and entity is Node2D:
			payload.position = Vector2i(entity.position) 

func _sync_grid_positions(event: Variant, entity: Node, payload: Variant = null) -> void:
	if event == Observer.Event.ADDED:
		if payload is C_GridPosition2D and entity is Node2D:
			payload.position = Vector2i(entity.position) 
func _sync_transforms(event: Variant, entity: Node, payload: Variant = null) -> void:
	if event == Observer.Event.ADDED:
		if payload is C_Transform2D and entity is Node2D:
			payload.transform = entity.transform
# func on_component_removed(entity: Entity, component: Resource):
# 	pass

# func on_component_changed(
# 	entity: Entity, component: Resource, property: String, new_value: Variant, old_value: Variant
# ):
# 	pass

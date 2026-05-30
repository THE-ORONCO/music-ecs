class_name S_TileWobbly
extends System

# Remember: Systems contain the meat and potatos of everything and can delete
# themselves or add other systems etc. System order matters.
## Override this method to define the [System]s that this system depends on.[br]
## If not overridden the system will run based on the order of the systems in the [World][br]
## and the order of the systems in the [World] will be based on the order they were added to the [World].[br]
#func deps() -> Dictionary[int, Array]:
	#return {
		#Runs.After: [],
		#Runs.Before: [],
	#}


## Override this method and return a [QueryBuilder] to define the required [Component]s for the system.[br]
## If not overridden, the system will run on every update with no entities.
func query() -> QueryBuilder:
	return q.with_all([C_VerticalWobble]).iterate([C_VerticalWobble, C_Transform2D, C_GridPosition2D])

## Override this method to define any sub-systems that should be processed by this system.[br]
# func sub_systems() -> Array[Array]:
# 	return [
# 		[q.with_all([YourComponent]), process_subsystem]
# 	]
#
# func process_subsystem(entities: Array[Entity], components: Array, delta: float):
# 	pass


## The main processing function for the system.[br]
## Override this method to define your system's behavior.[br]
## [param entities] Array of entities matching the system's query[br]
## [param components] Array of component arrays (in order from iterate()), or empty if no iterate() call[br]
## [param delta] The time elapsed since the last frame[br][br]
## [b]Simple approach:[/b] Loop through entities and use get_component()[br]
## [b]Fast approach:[/b] Use iterate() in query and access component arrays directly
func process(entities: Array, components: Array, delta: float) -> void:
	# Per-entity processing (simple)
	var wobbles: Array = components[0]
	var transforms: Array = components[1]
	var grid_positions: Array = components[2]
	for i in range(entities.size()):
		var wobble = wobbles[i] as C_VerticalWobble
		var transform := transforms[i] as C_Transform2D
		var grid_position := (grid_positions[i] as C_GridPosition2D).position
		if not transform: return
		
		wobble.progress = wobble.speed * delta + wobble.progress 

		var offset: float = wobble_position(wobble, grid_position, delta)
		transform.transform.origin.y += offset

	# OR batch processing (fast) - requires query().iterate([Components])
	# var your_components = components[0]
	# for i in entities.size():
	# 	# Process entities[i] with your_components[i]


static func wobble_position(wobble: C_VerticalWobble, grid_pos: Vector2i, delta: float) -> float:
	var pos_offset: float = (float(grid_pos.x) + float(grid_pos.y)) * wobble.position_offset_influence
	
	var offset :float = sin(wobble.progress + pos_offset) * wobble.magnitude
	return offset

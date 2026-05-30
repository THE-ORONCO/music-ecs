class_name S_TileRenderer
extends System

@export var multi_mesh_instance: MultiMeshInstance2D

var _multi_mesh: MultiMesh

func setup():
	safe_iteration = false
	process_empty = true
	_multi_mesh = multi_mesh_instance.multimesh

func query() -> QueryBuilder:
	return q.with_all([C_Transform2D, C_Tile]).iterate([C_Transform2D, C_Tile])


func process(entities: Array[Entity], components: Array, delta: float) -> void:
	var transforms: Array = components[0]
	var count = entities.size()

	if count > _multi_mesh.instance_count:
		_multi_mesh.instance_count = count + 500

	_multi_mesh.visible_instance_count = count

	for i in range(count):
		var t: C_Transform2D = transforms[i]
		if t:
			_multi_mesh.set_instance_transform_2d(i, t.transform)
		#if c:
			#multi_mesh.set_instance_color(i, c.color)

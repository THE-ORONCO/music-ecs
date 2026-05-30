extends Node2D
const E_TILE = preload("uid://dkbh2oadf1yoa")

@onready var entities: Node = %Entities
@onready var systems: Node = %Systems
var world: World

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	#world.initialize.call_deferred()
	for x in range(100):
		for y in range(100):
			var tile: E_Tile = E_TILE.instantiate()
			
			#ECS.world.add_entity(tile)
	
	_create_world.call_deferred()

var _do_process := false

func _physics_process(delta: float) -> void:
	if _do_process:
		ECS.process(delta, "physics")

func _process(delta: float) -> void:
	if _do_process:
		ECS.process(delta, "render")

func _create_world() -> void:
	world = World.new()
	world.entity_nodes_root = entities.get_path()
	world.system_nodes_root = systems.get_path()
	
	self.add_child(world)
	
	ECS.world = world
	
	_do_process = true

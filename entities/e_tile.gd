@tool
class_name E_Tile
extends Entity

#@onready var sprite: Sprite2D = $Sprite2D

# TODO replace sprite 2d with a multimesh instance

#func define_components() -> Array:
	#return [C_GridPosition2D.new(), C_Tile.new(), C_VerticalWobble.new(), C_Transform2D.new()]

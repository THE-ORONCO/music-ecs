# GdUnit generated TestSuite
class_name STileWobblyTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source: String = 'res://systems/s_tile_wobbly.gd'


func test_wobble_position() -> void:
	var grid_pos := Vector2i(1,1)
	
	var wobble := C_VerticalWobble.new()
	wobble.progress = 0.
	wobble.magnitude = 1.
	wobble.position_offset_influence = 0.03
	wobble.speed = 10.
	
	var delta := 0.01
	
	var offset := S_TileWobbly.wobble_position(wobble, grid_pos, delta)
	
	assert_float(offset).is_greater(0.)
	

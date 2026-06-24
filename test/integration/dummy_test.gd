class_name DummyIntegrationTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

const __source: String = 'res://test/integration/dummy_test.gd'


func test_dummy() -> void:
	assert_bool(true).is_true()

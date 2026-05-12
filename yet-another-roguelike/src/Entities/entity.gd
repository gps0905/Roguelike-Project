class_name Entity
extends Sprite2D


# Update the world position whenever we change the position on the grid
var grid_position: Vector2i:
	set(value):
		grid_position = value
		position = Grid.grid_to_world(grid_position)

func _init(start_position: Vector2i, entity_definition: EntityDefinition) -> void:
	centered = false
	grid_position = start_position
	texture = entity_definition.texture
	modulate = entity_definition.color

func move(move_offset: Vector2i) -> void:
	grid_position += move_offset


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

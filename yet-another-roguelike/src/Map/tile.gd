class_name Tile
extends Sprite2D

var _definition: TileDefinition

func _init(grid_position: Vector2i, tile_definition: TileDefinition) -> void:
	centered = false
	position = Grid.grid_to_world(grid_position)
	set_tile_type(tile_definition)

func set_tile_type(tile_definition: TileDefinition) -> void:
	_definition = tile_definition
	texture = _definition.texture
	modulate = _definition.color_dark

func is_walkable() -> bool:
	return _definition.is_walkable
	
func is_transparent() -> bool:
	return _definition.is_transparent
 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

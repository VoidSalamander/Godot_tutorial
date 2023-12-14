extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func get_tile_data(data_position: Vector2, data_name: String) -> Variant:
	var tile_position = self.local_to_map(data_position)
	var data: TileData = self.get_cell_tile_data(0, tile_position)
	if data:
		return data.get_custom_data(data_name)
	return null

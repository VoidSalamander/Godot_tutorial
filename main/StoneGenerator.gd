extends Node2D


@onready var tilemap = $"../TileMap"
@export var stone_node: PackedScene
@export var stone_num: int = 1000

func _ready():
	for i in range(stone_num):
		var stone_position = Vector2(randf_range(-1600, 1600),randf_range(-1600, 1600))
		if tilemap.get_tile_data(stone_position, "grass"):
			var stone = stone_node.instantiate()
			stone.global_position = stone_position
			add_child(stone)

extends Node2D


@onready var tilemap = $"../TileMap"
@export var tree_node: PackedScene

func _ready():
	for i in range(1000):
		var tree_position = Vector2(randf_range(-1600, 1600),randf_range(-1600, 1600))
		if tilemap.get_tile_data(tree_position, "grass"):
			var tree = tree_node.instantiate()
			tree.global_position = tree_position
			add_child(tree)

#tilemap.get_tile_data(self.position, "speed_modify")


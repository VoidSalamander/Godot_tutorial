extends Node2D


@onready var tilemap = $"../TileMap"
@export var tree_node: PackedScene
@export var tree_num: int = 500

func _ready():
	for i in range(tree_num):
		var tree_position = Vector2(randf_range(-1600, 1600),randf_range(-1600, 1600))
		if tilemap.get_tile_data(tree_position, "grass"):
			var tree = tree_node.instantiate()
			tree.global_position = tree_position
			add_child(tree)

#tilemap.get_tile_data(self.position, "speed_modify")
func _process(_delta):
	if Global.time%120 == 0:
		for i in range(10):
			var tree_position = Vector2(randf_range(-1600, 1600),randf_range(-1600, 1600))
			if tilemap.get_tile_data(tree_position, "grass"):
				var tree = tree_node.instantiate()
				tree.global_position = tree_position
				add_child(tree)


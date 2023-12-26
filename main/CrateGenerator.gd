extends Node2D

@export var crate_node : PackedScene
@onready var tilemap = $"../TileMap"
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(50):
		var init_position = Vector2(randf_range(-1600, 1600),randf_range(-1600, 1600))
		if tilemap.get_tile_data(init_position, "spawn_able"):
			var crate = crate_node.instantiate()
			crate.init_crate()
			crate.global_position = init_position
			add_child(crate)

func _process(_delta):
	if Global.time%120 == 0:
		for i in range(2):
			var init_position = Vector2(randf_range(-1600, 1600),randf_range(-1600, 1600))
			if tilemap.get_tile_data(init_position, "spawn_able"):
				var crate = crate_node.instantiate()
				crate.init_crate()
				crate.global_position = init_position
				add_child(crate)

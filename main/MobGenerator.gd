extends Node2D

@export var mob_node : PackedScene
@onready var tilemap = $"../TileMap"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _on_mob_spawn_timer_timeout():
	var mob_position = Vector2(randi_range(-1600, 1600), randi_range(-1600, 1600))
	if tilemap.get_tile_data(mob_position, "spawn_able"):
		var mob = mob_node.instantiate()
		mob.player = $"../player"
		mob.global_position = mob_position
		add_child(mob)

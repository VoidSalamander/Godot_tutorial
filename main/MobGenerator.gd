extends Node2D

@export var mob_node : PackedScene
@onready var tilemap = $"../TileMap"

var mob_damage :float = 3
var mob_speed :float = 20
var mob_health :float = 20

var mob_array := []

func _process(delta):
	if Global.time % 60 == 0:
		$colddown_timer.start()
		
func _on_mob_spawn_timer_timeout():
	var mob_position = Vector2(randi_range(-1600, 1600), randi_range(-1600, 1600))
	if tilemap.get_tile_data(mob_position, "spawn_able") and mob_position.distance_to($"../player".position) > 50:
		var mob = mob_node.instantiate()
		mob.init(mob_damage, mob_speed, mob_health)
		mob.player = $"../player"
		mob.global_position = mob_position
		mob_array.push_back(mob)
		if mob_array.size() > 50:
			mob_array.pop_front().queue_free()
		print(mob_array.size())
		add_child(mob)

func _on_colddown_timer_timeout():
	mob_damage += Global.time/60
	mob_speed += Global.time/30
	mob_health += Global.time/10
	$mob_spawn_timer.wait_time *= 0.9

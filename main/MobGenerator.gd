extends Node2D

@export var mob_node : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mob_spawn_timer_timeout():
	var mob = mob_node.instantiate()
	mob.player = get_parent().get_node("player")
	add_child(mob)

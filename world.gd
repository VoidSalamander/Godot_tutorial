extends Node2D

@export var crate_node : PackedScene
@export var mob_node : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(100):
		var crate = crate_node.instantiate()
		crate.init_crate()
		add_child(crate)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mob_spawn_timer_timeout():
	var mob = mob_node.instantiate()
	mob.player = $player
	add_child(mob)

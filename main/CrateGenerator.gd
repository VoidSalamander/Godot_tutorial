extends Node2D

@export var crate_node : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(100):
		var crate = crate_node.instantiate()
		crate.init_crate()
		add_child(crate)

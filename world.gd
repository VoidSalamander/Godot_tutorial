extends Node2D

@export var crate_node : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(100):
		var crate = crate_node.instantiate()
		crate.init_crate()
		add_child(crate)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var newWorld = load("res://main/world.tscn")
	var new = newWorld.instantiate()
	add_child(new)


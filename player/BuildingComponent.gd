extends Node2D

@export var turret : PackedScene

func _on_build_button_pressed():
	
	Global.instance_node(turret, global_position)


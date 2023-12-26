extends Node2D

@export var turret : PackedScene



func _on_turret_1_pressed():
	if get_parent().can_build and get_parent().wood >= 5:
		Global.instance_node(turret, global_position)
		get_parent().wood -= 5


func _on_turret_2_pressed():
	if get_parent().can_build and get_parent().stone >= 5:
		Global.instance_node(turret, global_position)
		get_parent().stone -= 5


func _on_turret_3_pressed():
	if get_parent().can_build and get_parent().wood >= 5 and get_parent().stone >= 5:
		Global.instance_node(turret, global_position)
		get_parent().wood -= 5
		get_parent().stone -= 5

func _on_turret_4_pressed():
	pass # Replace with function body.

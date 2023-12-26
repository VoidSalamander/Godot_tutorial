extends Node2D

@export var turret : PackedScene
@export var bonefire : PackedScene
@export var gatling : PackedScene
@export var canno : PackedScene

func _on_turret_1_pressed():
	if get_parent().can_build and get_parent().wood >= 2 and get_parent().stone >= 2 and get_parent().gear >= 2:
		Global.instance_node(turret, global_position)
		get_parent().wood -= 2
		get_parent().stone -= 2
		get_parent().gear -= 2

func _on_turret_2_pressed():
	if get_parent().can_build and get_parent().wood >= 5 and get_parent().stone >= 1:
		Global.instance_node(bonefire, global_position)
		get_parent().wood -= 5
		get_parent().stone -= 1

func _on_turret_3_pressed():
	if get_parent().can_build and get_parent().wood >= 1 and get_parent().stone >= 3 and get_parent().gear >= 6:
		Global.instance_node(gatling, global_position)
		get_parent().wood -= 1
		get_parent().stone -= 3
		get_parent().gear -= 6

func _on_turret_4_pressed():
	if get_parent().can_build and get_parent().wood >= 3 and get_parent().stone >= 7 and get_parent().gear >= 3:
		Global.instance_node(canno, global_position)
		get_parent().wood -= 3
		get_parent().stone -= 7
		get_parent().gear -= 3

extends Node2D
class_name building

#========#
# RQ res #
#========#

var RQ_wood := 2
var RQ_stone := 1
var RQ_gear := 1

func _ready():
	$StaticBody2D/CollisionShape2D.disabled = true

func _on_area_2d_body_exited(_body):
	call_deferred("_able_collision")

func _able_collision():
	$StaticBody2D/CollisionShape2D.disabled = false

func build_able()->bool:
	if get_parent().wood < RQ_wood || get_parent().stone < RQ_stone || get_parent().gear < RQ_gear:
		return false
	return true

func building_cost():
	if build_able():
		get_parent().wood -= RQ_wood
		get_parent().stone -= RQ_stone
		get_parent().gear -= RQ_gear

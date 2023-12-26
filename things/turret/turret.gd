extends Node2D
class_name building

#========#
# RQ res #
#========#

@export var RQ_wood := 2
@export var RQ_stone := 7
@export var RQ_gear := 3

func _ready():
	$StaticBody2D/CollisionShape2D.disabled = true

func _on_area_2d_body_exited(_body):
	call_deferred("_able_collision")

func _able_collision():
	$StaticBody2D/CollisionShape2D.disabled = false

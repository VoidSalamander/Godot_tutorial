extends Node2D
class_name HealthComponent

@export var MAX_HEALTH: float  = 20
var health: float

func _ready():
	health = MAX_HEALTH
	$HealthBar.max_value = MAX_HEALTH
	$HealthBar.hide()
	
func get_damage(Attack: float):
	$HealthBar.show()
	health -= Attack
	if health <= 0:
		get_parent().queue_free()
	$HealthBar.value = health


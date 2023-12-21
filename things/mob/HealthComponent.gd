extends Node2D
class_name HealthComponent

@export var MAX_HEALTH: float = 10
var health: float

func _ready():
	health = MAX_HEALTH
	$HealthBar.max_value = MAX_HEALTH
	$HealthBar.visible = false
	
func get_damage(Attack: float):
	$HealthBar.visible = true
	health -= Attack
	if health <= 0:
		get_parent().queue_free()
	
	$HealthBar.value = health


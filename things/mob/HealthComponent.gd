extends Node2D
class_name HealthComponent

var MAX_HEALTH: float = 20
var health: float

func update_health():
	health = MAX_HEALTH
	$HealthBar.max_value = MAX_HEALTH
	$HealthBar.hide()
	

func _ready():
	update_health()
	
func get_damage(Attack: float):
	$HealthBar.show()
	health -= Attack
	if health <= 0:
		Global.mob_dead += 1
		get_parent().queue_free()
	$HealthBar.value = health


extends Node2D


var MAX_HEALTH: float  = 100
var health: float

func _ready():
	health = MAX_HEALTH
	$"../HUD/State/HealthBar".max_value = MAX_HEALTH
	
func get_damage(Attack: float):
	health -= Attack
	if health <= 0:
		get_parent().is_dead = true
	$"../HUD/State/HealthBar".value = health


extends Node2D


var MAX_HEALTH: float  = 100
var health: float

func _ready():
	health = MAX_HEALTH
	$"../HUD/State/HealthBar".max_value = MAX_HEALTH
	get_parent().max_health = MAX_HEALTH
	get_parent().health = health
	
func get_damage(Attack: float):
	Attack -= get_parent().armor
	if Attack > 0:
		health -= Attack
		if health <= 0:
			get_parent().is_dead = true
		$"../HUD/State/HealthBar".value = health
		get_parent().is_sneak = false
		get_parent().health = health

func update_health():
	health = get_parent().health
	MAX_HEALTH = get_parent().max_health
	$"../HUD/State/HealthBar".value = health	
	$"../HUD/State/HealthBar".max_value = MAX_HEALTH

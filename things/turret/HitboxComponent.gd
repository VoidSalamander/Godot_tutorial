extends Area2D

@export var HealthComponent: Node2D

func damage(Attack):
	if HealthComponent:
		HealthComponent.get_damage(Attack)

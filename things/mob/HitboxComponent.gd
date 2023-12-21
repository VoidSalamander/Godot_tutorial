extends Area2D

@export var HealthComponent: Node2D


func damage(Attack):
	$Mob_stun.start()
	get_parent().modulate = Color.RED
	if HealthComponent:
		HealthComponent.get_damage(Attack)


func _on_mob_stun_timeout():
	get_parent().modulate = Color.WHITE

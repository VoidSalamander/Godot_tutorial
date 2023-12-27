extends Area2D

@export var HealthComponent: Node2D

func damage(Attack):
	$Stun.start()
	get_parent().modulate = Color.RED
	if HealthComponent:
		HealthComponent.get_damage(Attack)


func _on_stun_timeout():
	get_parent().modulate = Color.WHITE


func _on_area_entered(area):
	if area.has_method("collect"):
		area.collect(get_parent().inventory)
	if area.is_in_group("turret"):
		get_parent().can_build = false


func _on_area_exited(area):
	if area.is_in_group("turret"):
		get_parent().can_build = true

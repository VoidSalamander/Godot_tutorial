extends Area2D



func _on_fire_rate_timeout():
	var overlapping_areas = self.get_overlapping_areas()
	for area in overlapping_areas:
		if area.has_method("damage") and area.is_in_group("mob"):
			area.damage(3)
		if area.is_in_group("player"):
			area.get_parent().get_node("StateModifyer").health_modify(0.02)

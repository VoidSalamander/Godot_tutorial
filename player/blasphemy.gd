extends Area2D

func _on_timer_timeout():
	var overlapping_areas = self.get_overlapping_areas()
	for area in overlapping_areas:
		if area.has_method("damage") and area.is_in_group("mob"):
			area.damage(get_parent().get_parent().blasphemy_damage + get_parent().get_parent().bonus_damage)

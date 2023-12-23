extends Area2D

var damage = 3

func _on_area_entered(area):
	if area.has_method("damage"):
		area.damage(damage)
		queue_free()

func _on_duration_timer_timeout():
	queue_free()

func _on_tree_entered():
	$duration_timer.start()

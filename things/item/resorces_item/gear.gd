extends Item

func _on_body_entered(body):
	if body.is_in_group("player"):
		queue_free()

func collect(_inventory: Inventory):
	pass

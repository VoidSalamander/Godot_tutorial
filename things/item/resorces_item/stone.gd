extends Item

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("StateModifyer").get_stone(1)
		queue_free()

func collect(_inventory: Inventory):
	pass

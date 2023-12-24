extends Area2D
class_name Item


@export var itemRes: InventoryItem

var drop_range: int = 50

func init_item(parent_position):
	self.position = Vector2(parent_position.x + randf_range(drop_range,-1*drop_range), parent_position.y + randf_range(drop_range,-1*drop_range))
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("StateModifyer").get_wood(2)
		queue_free()

func collect(inventory: Inventory):
	inventory.insert(itemRes)

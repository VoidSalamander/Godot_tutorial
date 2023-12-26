extends Area2D
class_name Item

@export var itemRes_1: InventoryItem
@export var itemRes_2: InventoryItem
@export var itemRes_3: InventoryItem

var drop_range: int = 100
var item_rarity: int = 1

func init_item(parent_position, rarity:int = 1):
	item_rarity = rarity
	self.position = Vector2(parent_position.x + randf_range(drop_range,-1*drop_range), parent_position.y + randf_range(drop_range,-1*drop_range))
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		queue_free()

func collect(inventory: Inventory):
	if item_rarity == 3: inventory.insert(itemRes_3)
	elif item_rarity == 2: inventory.insert(itemRes_2)
	else: inventory.insert(itemRes_1)
	

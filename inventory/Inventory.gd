extends Control

@onready var inventory: Inventory = preload("res://inventory/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


func _ready():
	inventory.updated.connect(update)
	update()

func update():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])

func _on_hud_reset_inventory():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].reset(inventory.slots[i])

func _on_menu_reset_inventory_menu():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].reset(inventory.slots[i])

func _on_player_player_use_item(num):
	var button_path = "./NinePatchRect/GridContainer/inv_UI_slot" + str(num) 
	var button = get_node(button_path)
	if button:
		print(button.name)
		button._on_button_pressed()
	
	

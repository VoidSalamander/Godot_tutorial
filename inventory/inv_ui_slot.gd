extends Panel
class_name Slot

@onready var backgroundSprite: Sprite2D = $background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/item_display
@onready var amountLabel: Label = $CenterContainer/Panel/Label

var Inv_slot: InventorySlot

func update(slot: InventorySlot):
	if !slot.item:
		Inv_slot = null
		backgroundSprite.frame = 0
		itemSprite.visible = false
		amountLabel.visible = false
		
	else:
		Inv_slot = slot
		backgroundSprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = slot.item.texture
		if(slot.amount > 1):
			amountLabel.visible = true
		amountLabel.text = str(slot.amount)

func reset(slot: InventorySlot):
	slot.item = null
	backgroundSprite.frame = 0
	itemSprite.visible = false
	amountLabel.visible = false

func _on_button_pressed():
	if Inv_slot && Inv_slot.item:
		Inv_slot.amount -= 1
		Inv_slot.item
		if Inv_slot.amount == 0:
			Inv_slot.item = null
			update(Inv_slot)
		else:
			update(Inv_slot)



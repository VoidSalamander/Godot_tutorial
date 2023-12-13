extends Panel

@onready var backgroundSprite: Sprite2D = $background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/item_display
@onready var amountLabel: Label = $CenterContainer/Panel/Label


func update(slot: InventorySlot):
	if !slot.item:
		backgroundSprite.frame = 0
		itemSprite.visible = false
		amountLabel.visible = false
		
	else:
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

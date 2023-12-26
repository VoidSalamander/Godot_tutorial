extends Panel
class_name Slot

@onready var backgroundSprite: Sprite2D = $background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/item_display
@onready var amountLabel: Label = $CenterContainer/Panel/Label

@export var color_1: Color
@export var color_2: Color
@export var color_3: Color

var Inv_slot: InventorySlot
@onready var player = get_parent().get_parent().get_parent().get_parent().get_parent()

func update(slot: InventorySlot):
	if !slot.item:
		Inv_slot = null
		backgroundSprite.frame = 0
		itemSprite.visible = false
		amountLabel.visible = false
		$rarity_background.modulate = Color(255, 255, 255, 0)
	else:
		Inv_slot = slot
		backgroundSprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = slot.item.texture
		if(slot.amount > 1):
			amountLabel.visible = true
		amountLabel.text = str(slot.amount)
		
		if slot.item.background_color == 1: $rarity_background.modulate = color_1
		if slot.item.background_color == 2: $rarity_background.modulate = color_2
		if slot.item.background_color == 3: $rarity_background.modulate = color_3

func reset(slot: InventorySlot):
	slot.item = null
	backgroundSprite.frame = 0
	itemSprite.visible = false
	amountLabel.visible = false

func _on_button_pressed():
	if Inv_slot && Inv_slot.item:
		Inv_slot.amount -= 1
		usage(Inv_slot.item.name, Inv_slot.item.background_color)
		if Inv_slot.amount == 0:
			Inv_slot.item = null
			update(Inv_slot)
		else:
			update(Inv_slot)


func usage(name: String, rarity: int):
	if name == "armor":
		if rarity == 1:
			player.get_node("StateModifyer").armor_modify(1)
		if rarity == 2:
			player.get_node("StateModifyer").armor_modify(2)
		if rarity == 3:
			player.get_node("StateModifyer").armor_modify(4)
	
	if name == "bang":
		if rarity == 1:
			player.get_node("StateModifyer").attack_speed_modify(0.5, 10)
		if rarity == 2:
			player.get_node("StateModifyer").attack_speed_modify(1.0, 10)
		if rarity == 3:
			player.get_node("StateModifyer").attack_speed_modify(2.0, 10)
			player.get_node("StateModifyer").attack_speed_modify(0.2, 10, true)
	
	if name == "blasphemy":
		if rarity == 1:
			player.get_node("StateModifyer").blasphemy_modify(2, 10)
		if rarity == 2:
			player.get_node("StateModifyer").blasphemy_modify(4, 15)
		if rarity == 3:
			player.get_node("StateModifyer").blasphemy_modify(8, 20)
	
	if name == "bomb":
		if rarity == 1:
			player.get_node("StateModifyer").bomb_modify(10)
		if rarity == 2:
			player.get_node("StateModifyer").bomb_modify(30)
		if rarity == 3:
			player.get_node("StateModifyer").bomb_modify(80)
	
	if name == "coco":
		if rarity == 1:
			player.get_node("StateModifyer").health_modify(0.1)
		if rarity == 2:
			player.get_node("StateModifyer").health_modify(0.5)
		if rarity == 3:
			player.get_node("StateModifyer").health_modify(0.9)
	
	if name == "cola":
		if rarity == 1:
			player.get_node("StateModifyer").duration_modify(1)
		if rarity == 2:
			player.get_node("StateModifyer").duration_modify(2)
		if rarity == 3:
			player.get_node("StateModifyer").duration_modify(4)
	
	if name == "res_pack":
		if rarity == 1:
			player.get_node("StateModifyer").get_wood(randi_range(1,2))
			player.get_node("StateModifyer").get_stone(randi_range(1,2))
			player.get_node("StateModifyer").get_gear(randi_range(1,2))
		if rarity == 2:
			player.get_node("StateModifyer").get_wood(randi_range(2,4))
			player.get_node("StateModifyer").get_stone(randi_range(2,4))
			player.get_node("StateModifyer").get_gear(randi_range(2,4))
		if rarity == 3:
			player.get_node("StateModifyer").get_wood(randi_range(4,7))
			player.get_node("StateModifyer").get_stone(randi_range(4,7))
			player.get_node("StateModifyer").get_gear(randi_range(4,7))
			
	if name == "SG":
		if rarity == 1:
			player.get_node("StateModifyer").max_health_modify(10)
		if rarity == 2:
			player.get_node("StateModifyer").max_health_modify(20)
		if rarity == 3:
			player.get_node("StateModifyer").max_health_modify(40)
	
	if name == "shooes":
		if rarity == 1:
			player.get_node("StateModifyer").speed_modify(20, 20)
		if rarity == 2:
			player.get_node("StateModifyer").speed_modify(40, 20)
		if rarity == 3:
			player.get_node("StateModifyer").speed_modify(70, 20)
			player.get_node("StateModifyer").speed_modify(10, 20, true)
	
	if name == "sword":
		if rarity == 1:
			player.get_node("StateModifyer").bonus_damage_modify(1)
		if rarity == 2:
			player.get_node("StateModifyer").bonus_damage_modify(2)
		if rarity == 3:
			player.get_node("StateModifyer").bonus_damage_modify(4)
			
	if name == "weapon":
		if rarity == 1:
			player.get_node("StateModifyer").reduce_attack_modify(3, 10)
		if rarity == 2:
			player.get_node("StateModifyer").reduce_attack_modify(1, 15)
		if rarity == 3:
			player.get_node("StateModifyer").reduce_attack_modify(0, 20)
		
	if name == "sneak":
		if rarity == 1:
			player.get_node("StateModifyer").sneak_modify(10)
		if rarity == 2:
			player.get_node("StateModifyer").sneak_modify(30)
		if rarity == 3:
			player.get_node("StateModifyer").sneak_modify(0, true)
			
	if name == "magic":
		if rarity == 1:
			player.get_node("StateModifyer").chain_num_modify(1,10)
		if rarity == 2:
			player.get_node("StateModifyer").chain_num_modify(3,10)
		if rarity == 3:
			player.get_node("StateModifyer").chain_num_modify(1,10, true)
			player.get_node("StateModifyer").chain_num_modify(6,10)
		

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.Account['cat'] != '':
		$Cat.texture = load("res://png/Gacha/Cards/Clothing/"+Global.Account['cat']+".png")
		$Cat.visible = true
	else:
		$Cat.visible = false
	$Cloth.texture = load("res://png/Gacha/Cards/Clothing/"+Global.Account['clothing']+".png")
	if Global.Account['accessory'] != '':
		if Global.Account['accessory'].contains("hat") or Global.Account['accessory'].contains("banana"):
			$Accessory.position = Vector2(3,-14)
			$Accessory.scale = Vector2(0.4,0.4)
		else:
			$Accessory.position = Vector2(-16,11)
			$Accessory.scale = Vector2(0.4,0.4)
		$Accessory.texture = load("res://png/Gacha/Cards/Clothing/"+Global.Account['accessory']+".png")
		$Accessory.visible = true
	else:
		$Accessory.visible = false

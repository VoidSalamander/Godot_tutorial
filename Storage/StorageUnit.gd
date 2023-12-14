extends MarginContainer

func _on_visibility_changed():
	SetStorage()

func SetStorage():
	#print(Global.currentStorage)
	var StorageInfo = Global.Card[Global.currentStorage]
	#string of path to png file
	var CardImg
	CardImg = str( "res://png/Gacha/Cards/" , StorageInfo[0] , "/" , StorageInfo[1] )
	if Global.storage[Global.currentStorage] == 0:
		CardImg = CardImg + "_dark.png"
	else:
		CardImg = CardImg + ".png"
	
	var CardSize = get_node(".").size
	$Object.texture = load(CardImg)
	$Object.scale = CardSize / $Object.texture.get_size()
	$Object.visible = true




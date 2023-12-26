extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_visibility_changed():
	SetCard()

func SetCard():
	var CardInfo = Global.Card[Global.currentCard]
	#string of path to png file
	var CardImg
	if CardInfo[0] == "Tool":
		CardImg = str( "res://png/Gacha/Cards/" , CardInfo[0] , "/" , CardInfo[1] , ".png" )
		$".".size.x = 535
		$".".size.y = 535
	else:
		CardImg = str( "res://png/Gacha/Cards/" , CardInfo[0] , "/" , CardInfo[1] , ".png" )
		$".".size.x = 1152
		$".".size.y = 535
		
	var CardSize = $".".size
	$Card.texture = load(CardImg)
	$Card.scale = CardSize / $Card.texture.get_size()
	$Card.visible = true


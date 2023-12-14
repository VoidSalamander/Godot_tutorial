extends Node2D


func _ready():
	$CoinAndDiamond/CoinAmount.text = str(Global.CoinAmount)
	$CoinAndDiamond/GemAmount.text = str(Global.GemAmount)
	$Name/Name.text = Global.Account["nickname"]
	var CardImg = "res://png/CharacterPage/SelectedCharacter.png"
	$Selected/Selected.texture = load(CardImg)
	$Selected/Selected.scale = Vector2(208,130) / $Selected/Selected.texture.get_size()


func _process(delta):
	$CoinAndDiamond/CoinAmount.text = str(Global.CoinAmount)
	$CoinAndDiamond/GemAmount.text = str(Global.GemAmount)


func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainScene/MainPage.tscn")


func _on_coin_and_gem_pressed():
	get_tree().change_scene_to_file("res://MainScene/TopUpPage.tscn")

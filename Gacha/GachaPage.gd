extends Node2D

var CardInfo


func _ready():
	$CoinAndDiamond/CoinAmount.text = str(Global.CoinAmount)
	$CoinAndDiamond/GemAmount.text = str(Global.GemAmount)
	$Name/Name.text = Global.Account["nickname"]
	$Continue.visible = false
	$Back.visible = true
	$Once.visible = true
	$TenTimes.visible = true
	$Transition.visible = false
	$CardSample.visible = true
	Global.currentCard = Global.RareCardAmount - 1
	CardInfo = Global.Card[Global.currentCard]
	var CardImg = str( "res://png/Gacha/big_" , CardInfo[1] , ".png" )
	$CardSample/Card.texture = load(CardImg)
	$Possibility.text = "0.25%"
	CardInfo = Global.Card[Global.currentCard-1]
	CardImg = str( "res://png/Gacha/small_" , CardInfo[1] , ".png" )
	$List/First.texture = load(CardImg)
	CardInfo = Global.Card[Global.currentCard]
	CardImg = str( "res://png/Gacha/small_" , CardInfo[1] , ".png" )
	$List/Second.texture = load(CardImg)
	$List.visible = true
	$Notice.visible = false
	if Global.Account['cookies'] == "":
		$CoinAndDiamond/CoinAndGem.visible = false
	
func _process(delta):
	$Name/Name.text = Global.Account["nickname"]
	$CoinAndDiamond/CoinAmount.text = str(Global.CoinAmount)
	$CoinAndDiamond/GemAmount.text = str(Global.GemAmount)


func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainScene/MainPage.tscn")


func _on_timer_timeout():
	Global.currentCard -= 1
	if Global.currentCard < 0:
		Global.currentCard = Global.RareCardAmount - 1
	CardInfo = Global.Card[Global.currentCard]
	var CardImg = str( "res://png/Gacha/big_" , CardInfo[1] , ".png" )
	$CardSample/Card.texture = load(CardImg)
	$Possibility.text = "0.25%"


func _on_coin_and_gem_pressed():
	get_tree().change_scene_to_file("res://MainScene/TopUpPage.tscn")

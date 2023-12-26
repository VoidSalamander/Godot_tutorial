extends Node2D


func _ready():
	if Global.Account['cookies'] != "":
		$Loading.visible = true
		$Back.visible = false
		$Main.visible = false
		
		Global.search_args['username'] = Global.Account['username']
		Global.search_args['cookies'] = Global.Account['cookies']
		
		Global.currentAction = 6
		var newcall = load("res://Global/HttpRequest.tscn")
		Global.response["status"] = ""
		
		while Global.response == null or Global.response["status"] != "Successful":
			var new = newcall.instantiate()
			add_child(new)
			new.send()
			
			await get_tree().create_timer(2).timeout
			if Global.response != null and Global.response["status"] == "Successful":
				$Loading.visible = false
				Global.CoinAmount = Global.response["coin"]
				Global.GemAmount = Global.response["diamond"]
				Global.Account["nickname"] = Global.response["nickname"]
			remove_child(new)
	else:
		$Main/LeaderBoard.visible = false
		$Main/CoinAndDiamond/TopUp1.visible = false
		$Main/CoinAndDiamond/TopUp2.visible = false
	
	$Main/CoinAndDiamond/CoinAmount.text = str(Global.CoinAmount)
	$Main/CoinAndDiamond/GemAmount.text = str(Global.GemAmount)
	$Main/Name/Name.text = Global.Account["nickname"]
	$Main.visible = true
	LoadAndSave.saveGame()
	
	
func _process(delta):
	$Main/CoinAndDiamond/CoinAmount.text = str(Global.CoinAmount)
	$Main/CoinAndDiamond/GemAmount.text = str(Global.GemAmount)
	$Main/Name/Name.text = Global.Account["nickname"]


func _on_storage_pressed():
	get_tree().change_scene_to_file("res://Storage/StoragePage.tscn")


func _on_gatcha_pressed():
	get_tree().change_scene_to_file("res://Gacha/GachaPage.tscn")


func _on_new_room_pressed():
	get_tree().change_scene_to_file("res://MainScene/NewRoom.tscn")


func _on_quick_match_pressed():
	get_tree().change_scene_to_file("res://MainScene/QuickMatch.tscn")


func _on_coin_and_gem_pressed():
	get_tree().change_scene_to_file("res://MainScene/TopUpPage.tscn")


func _on_character_pressed():
	get_tree().change_scene_to_file("res://MainScene/CharacterPage.tscn")


func _on_to_leader_board_pressed():
	get_tree().change_scene_to_file("res://MainScene/LeaderBoardPage.tscn")


func _on_start_game_pressed():
	LoadAndSave.loadGame()
	get_tree().change_scene_to_file("res://MainScene/newWorld.tscn")


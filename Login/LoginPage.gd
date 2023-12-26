extends Node2D


func _ready():
	$Notice.visible = false

func _on_log_in_pressed():
	if $HSplitContainer/InputBox/UserID.text != "" and $HSplitContainer/InputBox/Password.text != "":
		Global.login_args["username"] = $HSplitContainer/InputBox/UserID.text
		Global.login_args["password"] = $HSplitContainer/InputBox/Password.text
		
		Global.currentAction = 1
		var newcall = load("res://Global/HttpRequest.tscn")
		var new = newcall.instantiate()
		add_child(new)
		new.send()
		
		await get_tree().create_timer(2).timeout
		if Global.response != null and Global.response["status"] == "Successful":
			remove_child(new)
			Global.Account["username"] = Global.response["username"]
			Global.Account["cookies"] = Global.response["cookies"]
			Global.SAVE_PATH = "user://"+Global.Account["username"]+".bin"
			LoadAndSave.loadGame()
			get_tree().change_scene_to_file("res://MainScene/MainPage.tscn")
		else:
			remove_child(new)
			$Notice.visible = true
			$Notice/Label.text = "Log in failed\nUsername or Email incorrect"
			await get_tree().create_timer(2).timeout
			$Notice.visible = false
			$Notice/Label.text = ""
	else:
		$Notice.visible = true
		if $HSplitContainer/InputBox/UserID.text == "":
			if $Notice/Label.text != "":
				$Notice/Label.text = $Notice/Label.text + "\n"
			$Notice/Label.text = $Notice/Label.text + "- Username isn't filled in"
		if $HSplitContainer/InputBox/Password.text == "":
			if $Notice/Label.text != "":
				$Notice/Label.text = $Notice/Label.text + "\n"
			$Notice/Label.text = $Notice/Label.text + "- Password isn't filled in"
		await get_tree().create_timer(2).timeout
		$Notice.visible = false
		$Notice/Label.text = ""


func _on_sign_up_pressed():
	get_tree().change_scene_to_file("res://Login/SignUpPage.tscn")


func _on_forgotten_password_pressed():
	get_tree().change_scene_to_file("res://Login/ForgottenPwPage.tscn")


func _on_visitor_pressed():
	LoadAndSave.loadGame()
	if len(Global.storage) == 0:
		Global.storage.resize(100)
		Global.storage.fill(0)
	get_tree().change_scene_to_file("res://MainScene/MainPage.tscn")

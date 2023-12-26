extends Node2D


func _ready():
	$Notice.visible = false

func _on_log_in_pressed():
	if $InputBox/UserID.text != "" and $InputBox/Password.text != "":
		Global.login_args["username"] = $InputBox/UserID.text
		Global.login_args["password"] = $InputBox/Password.text
		
		Global.currentAction = 1
		var newcall = load("res://Global/HttpRequest.tscn")
		var new = newcall.instantiate()
		add_child(new)
		new.send()
		
		await get_tree().create_timer(2).timeout
		if Global.response["status"] == "Successful":
			remove_child(new)
			Global.Account["username"] = Global.response["username"]
			Global.Account["cookies"] = Global.response["cookies"]
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
		if $InputBox/UserID.text == "":
			if $Notice/Label.text != "":
				$Notice/Label.text = $Notice/Label.text + "\n"
			$Notice/Label.text = $Notice/Label.text + "- Username isn't filled in"
		if $InputBox/Password.text == "":
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




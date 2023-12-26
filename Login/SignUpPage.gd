extends Node2D


func _ready():
	$Notice.visible = false


func _process(delta):
	if (!($Whole/Left/InputBoxes/UserName/UserNameInputBox.text.is_empty())) and (!(("a"+$Whole/Left/InputBoxes/UserName/UserNameInputBox.text).is_valid_identifier()) or ("_" in $Whole/Left/InputBoxes/UserName/UserNameInputBox.text)):
		$Whole/Left/Labels/UserName/Label.text = "Username can only"
		$Whole/Left/InputBoxes/UserName/Label.text = "contain letters and numbers"
	else:
		$Whole/Left/Labels/UserName/Label.text = ""
		$Whole/Left/InputBoxes/UserName/Label.text = ""
		
	if (!$Whole/Right/InputBoxes/Email/EmailInputBox.text.is_empty()) and (!("@" in $Whole/Right/InputBoxes/Email/EmailInputBox.text) or $Whole/Right/InputBoxes/Email/EmailInputBox.text.find("@") > 63 or $Whole/Right/InputBoxes/Email/EmailInputBox.text.find("@") == 0):
		$Whole/Right/InputBoxes/Email/Label.text = "Invalid email"
	else:
		$Whole/Right/InputBoxes/Email/Label.text = ""
		
	if (!$Whole/Left/InputBoxes/Password/PasswordInputBox.text.is_empty()) and (!(("a"+$Whole/Left/InputBoxes/Password/PasswordInputBox.text).is_valid_identifier()) or ("_" in $Whole/Left/InputBoxes/Password/PasswordInputBox.text)):
		$Whole/Left/Labels/Password/Label.text = "Password can only"
		$Whole/Left/InputBoxes/Password/Label.text = "contain letters and numbers"
	elif (!$Whole/Left/InputBoxes/Password/PasswordInputBox.text.is_empty()) and ($Whole/Left/InputBoxes/Password/PasswordInputBox.text.length() < 8):
		$Whole/Left/Labels/Password/Label.text = ""
		$Whole/Left/InputBoxes/Password/Label.text = "Password is too short"
	elif (!$Whole/Left/InputBoxes/Password/PasswordInputBox.text.is_empty()) and ($Whole/Left/InputBoxes/Password/PasswordInputBox.text.length() > 12):
		$Whole/Left/Labels/Password/Label.text = ""
		$Whole/Left/InputBoxes/Password/Label.text = "Password is too long"
	else:
		$Whole/Left/Labels/Password/Label.text = ""
		$Whole/Left/InputBoxes/Password/Label.text = ""
		
	if (!$Whole/Right/InputBoxes/ConfirmPw/ConfirmPwInputBox.text.is_empty()) and ($Whole/Left/InputBoxes/Password/PasswordInputBox.text != $Whole/Right/InputBoxes/ConfirmPw/ConfirmPwInputBox.text):
		$Whole/Right/InputBoxes/ConfirmPw/Label.text = "Password does not match"
	else:
		$Whole/Right/InputBoxes/ConfirmPw/Label.text = ""


func _on_sign_up_pressed():
	if $Whole/Left/InputBoxes/Password/PasswordInputBox.text != "" and $Whole/Left/InputBoxes/Password/PasswordInputBox.text == $Whole/Right/InputBoxes/ConfirmPw/ConfirmPwInputBox.text and $Whole/Left/InputBoxes/UserName/UserNameInputBox.text != "" and $Whole/Right/InputBoxes/Email/EmailInputBox.text != "":
		if $Whole/Left/Labels/UserName/Label.text.is_empty() and $Whole/Left/InputBoxes/UserName/Label.text.is_empty() and $Whole/Left/InputBoxes/Password/Label.text.is_empty() and $Whole/Right/InputBoxes/Email/Label.text.is_empty() and $Whole/Right/InputBoxes/ConfirmPw/Label.text.is_empty():
			Global.register_args["username"] = $Whole/Left/InputBoxes/UserName/UserNameInputBox.text
			Global.register_args["email"] = $Whole/Right/InputBoxes/Email/EmailInputBox.text
			Global.register_args['password'] = $Whole/Left/InputBoxes/Password/PasswordInputBox.text
			Global.register_args['nickname'] = $Whole/Left/InputBoxes/UserName/UserNameInputBox.text
			
			Global.currentAction = 2
			var newcall = load("res://Global/HttpRequest.tscn")
			var new = newcall.instantiate()
			add_child(new)
			new.send()
			
			await get_tree().create_timer(2).timeout
			if Global.response["status"] == "Successful":
				remove_child(new)
				get_tree().change_scene_to_file("res://Login/LoginPage.tscn")
			else:
				remove_child(new)
				$Notice.visible = true
				$Notice/Label.text = "Sign up failed"
		else:
			$Notice.visible = true
			$Notice/Label.text = "Something is invalid"
			await get_tree().create_timer(2).timeout
			$Notice.visible = false
			$Notice/Label.text = ""
	else:
		$Notice.visible = true
		if $Whole/Left/InputBoxes/UserName/UserNameInputBox.text == "":
			if $Notice/Label.text != "":
				$Notice/Label.text = $Notice/Label.text + "\n"
			$Notice/Label.text = $Notice/Label.text + "- Username isn't filled in"
		if $Whole/Left/InputBoxes/Password/PasswordInputBox.text == "":
			if $Notice/Label.text != "":
				$Notice/Label.text = $Notice/Label.text + "\n"
			$Notice/Label.text = $Notice/Label.text + "- Password isn't filled in"
		if $Whole/Right/InputBoxes/Email/EmailInputBox.text == "":
			if $Notice/Label.text != "":
				$Notice/Label.text = $Notice/Label.text + "\n"
			$Notice/Label.text = $Notice/Label.text + "- Email isn't filled in"
		if $Whole/Left/InputBoxes/Password/PasswordInputBox.text != $Whole/Right/InputBoxes/ConfirmPw/ConfirmPwInputBox.text:
			if $Notice/Label.text != "":
				$Notice/Label.text = $Notice/Label.text + "\n"
			$Notice/Label.text = $Notice/Label.text + "- Password doesn't match"
		await get_tree().create_timer(2).timeout
		$Notice.visible = false
		$Notice/Label.text = ""


func _on_log_in_pressed():
	get_tree().change_scene_to_file("res://Login/LoginPage.tscn")

extends Node2D


func _ready():
	$Back.visible = true
	$ResetPwLabel.visible = true
	$ResetPwLabel.position = Vector2(279,95)
	$Verify.visible = false
	$ResetPassword.visible = false
	$Directions.visible = true
	$SendEmail.visible = true
	$Send.visible = true
	$Notice.visible = false


func _process(delta):
	pass


func _on_temp_pressed():
	get_tree().change_scene_to_file("res://Login/StartPage.tscn")


func _on_send_pressed():
	if $SendEmail/Email.text != "":
		Global.forgot_args["email"] = $SendEmail/Email.text
		
		Global.currentAction = 3
		var newcall = load("res://Global/HttpRequest.tscn")
		var new = newcall.instantiate()
		add_child(new)
		new.send()
		
		await get_tree().create_timer(2).timeout
		print("Send: ", Global.response)
		if Global.response == null:
			remove_child(new)
			$Notice.visible = true
			$Notice/Label.text = "Email incorrect"
			$Notice/Label.text = $Notice/Label.text + "\n" + str(Global.response)
			await get_tree().create_timer(2).timeout
			$Notice.visible = false
			$Notice/Label.text = ""
		elif Global.response["status"] == "Successful":
			remove_child(new)
			$Verify.visible = true
			$ResetPassword.visible = true
			$Directions.visible = false
			$SendEmail.visible = false
			$Send.visible = false
		else:
			remove_child(new)
			$Notice.visible = true
			$Notice/Label.text = "Email incorrect"
			$Notice/Label.text = $Notice/Label.text + "\n" + str(Global.response)
			await get_tree().create_timer(2).timeout
			$Notice.visible = false
			$Notice/Label.text = ""
	else:
		$Notice.visible = true
		if $SendEmail/Email.text == "":
			if $Notice/Label.text != "":
				$Notice/Label.text = $Notice/Label.text + "\n"
			$Notice/Label.text = $Notice/Label.text + "- Email isn't filled in"
		await get_tree().create_timer(2).timeout
		$Notice.visible = false
		$Notice/Label.text = ""


func _on_reset_password_pressed():
	if $Verify/InputBox/VSplitContainer/Email.text != "" and $Verify/InputBox/VSplitContainer/NewPassword.text != "" and $Verify/InputBox/VertifyCode.text != "":
		if (!(("a"+$Verify/InputBox/VSplitContainer/NewPassword.text).is_valid_identifier()) or ("_" in $Verify/InputBox/VSplitContainer/NewPassword.text)):
			$Notice/Label.text = "Password can only\ncontain letters and numbers"
			$Notice.visible = true
			await get_tree().create_timer(2).timeout
			$Notice.visible = false
			$Notice/Label.text = ""
		elif ($Verify/InputBox/VSplitContainer/NewPassword.text.length() < 8):
			$Notice/Label.text = "Password is too short"
			$Notice.visible = true
			await get_tree().create_timer(2).timeout
			$Notice.visible = false
			$Notice/Label.text = ""
		elif ($Verify/InputBox/VSplitContainer/NewPassword.text.length() > 12):
			$Notice/Label.text = "Password is too long"
			$Notice.visible = true
			await get_tree().create_timer(2).timeout
			$Notice.visible = false
			$Notice/Label.text = ""
		else:
			Global.verify_args["email"] = $Verify/InputBox/VSplitContainer/Email.text
			Global.verify_args["password"] = $Verify/InputBox/VSplitContainer/NewPassword.text
			Global.verify_args["vcode"] = $Verify/InputBox/VertifyCode.text
			
			Global.currentAction = 4
			var newcall = load("res://Global/HttpRequest.tscn")
			var new = newcall.instantiate()
			add_child(new)
			new.send()
			
			await get_tree().create_timer(2).timeout
			if Global.response == null:
				remove_child(new)
				$Notice.visible = true
				$Notice/Label.text = "Reset password failed"
				await get_tree().create_timer(2).timeout
				$Notice.visible = false
				$Notice/Label.text = ""
			elif Global.response["status"] == "Successful":
				remove_child(new)
				get_tree().change_scene_to_file("res://Login/LoginPage.tscn")
			else:
				remove_child(new)
				$Notice.visible = true
				$Notice/Label.text = "Reset password failed"
				await get_tree().create_timer(2).timeout
				$Notice.visible = false
				$Notice/Label.text = ""
	else:
		$Notice.visible = true
		if $Verify/InputBox/VSplitContainer/Email.text == "":
			if $Notice/Label.text != "":
				$Notice/Label.text = $Notice/Label.text + "\n"
			$Notice/Label.text = $Notice/Label.text + "- Email isn't filled in"
		if $Verify/InputBox/VSplitContainer/NewPassword.text == "":
			if $Notice/Label.text != "":
				$Notice/Label.text = $Notice/Label.text + "\n"
			$Notice/Label.text = $Notice/Label.text + "- New Password isn't filled in"
		if $Verify/InputBox/VertifyCode.text == "":
			if $Notice/Label.text != "":
				$Notice/Label.text = $Notice/Label.text + "\n"
			$Notice/Label.text = $Notice/Label.text + "- Verify Code isn't filled in"
		await get_tree().create_timer(2).timeout
		$Notice.visible = false
		$Notice/Label.text = ""


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Login/LoginPage.tscn")

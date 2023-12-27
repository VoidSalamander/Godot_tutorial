extends Node2D

var bgm_bus = AudioServer.get_bus_index("BGM")
var se_bus = AudioServer.get_bus_index("SE")

func _ready():
	$SettingsBG.visible = true
	$Name.visible = true
	$Name/Name.editable = false
	$Name/Name.text = Global.Account["nickname"]
	$Pen.visible = true
	$BGM.visible = true
	$SE.visible = true
	$Notice.visible = false


func _process(delta):
	pass


func _on_touch_screen_button_pressed():
	if Global.Account['cookies'] != "":
		if $Name/Name.editable == false:
			$Name/Name.editable = true
		else:
			$Name/Name.editable = false
			Global.rename_args["username"] = Global.Account["username"]
			Global.rename_args["nickname"] = $Name/Name.text
			Global.rename_args["cookies"] = Global.Account["cookies"]
			
			$Loading.visible = true
			Global.currentAction = 5
			var newcall = load("res://Global/HttpRequest.tscn")
			var new = newcall.instantiate()
			add_child(new)
			new.send()
			
			await get_tree().create_timer(2).timeout
			$Loading.visible = false
			if Global.response != null and Global.response["status"] == "Successful":
				Global.Account["nickname"] = $Name/Name.text
			else:
				$Notice/Label.text = "Failed to change nickname"
				$Notice.visible = true
				await get_tree().create_timer(2).timeout
				$Notice.visible = false
			remove_child(new)
	else:
		if $Name/Name.editable == false:
			$Name/Name.editable = true
		else:
			$Name/Name.editable = false
			Global.Account["nickname"] = $Name/Name.text
			LoadAndSave.saveGame()

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
	if $Name/Name.editable == false:
		$Name/Name.editable = true
	else:
		$Name/Name.editable = false
		Global.rename_args["username"] = Global.Account["username"]
		Global.rename_args["nickname"] = $Name/Name.text
		Global.rename_args["cookies"] = Global.Account["cookies"]
		
		Global.currentAction = 5
		var newcall = load("res://Global/HttpRequest.tscn")
		var new = newcall.instantiate()
		add_child(new)
		new.send()
		
		await get_tree().create_timer(2).timeout
		if Global.response["status"] == "Successful":
			Global.Account["nickname"] = $Name/Name.text
		else:
			$Notice/Label.text = "Failed to change nickname"
			$Notice.visible = true
			await get_tree().create_timer(1).timeout
			$Notice.visible = false
		remove_child(new)

func _on_bgm_slider_value_changed(value):
	AudioServer.set_bus_volume_db(bgm_bus, value)
	
func _on_s_elider_value_changed(value):
	AudioServer.set_bus_volume_db(se_bus, value)

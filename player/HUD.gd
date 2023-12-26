extends CanvasLayer

signal pause
signal back_to_game
signal button_position
signal reset_player
signal reset_inventory

func _process(_delta):
	button_color()
	time_update()

func _on_menu_button_pressed():
	$Menu.show()
	$Menu_button.hide()
	$game_button.hide()
	$Control.hide()
	emit_signal("pause")
	emit_signal("button_position",$game_button/Joystick.position, $game_button/Attack_button.position, $game_button/build_Container.position)

func _on_menu_close_menu():
	$Menu.hide()
	$Menu_button.show()
	$game_button.show()
	$Control.show()
	emit_signal("back_to_game")

func _on_menu_button_move(joystick, attack, build):
	$game_button/Joystick.set_position(Vector2(joystick[0], joystick[1]))
	$game_button/Joystick_mark.set_position(Vector2(joystick[0], joystick[1]))
	$game_button/Attack_button.set_position(Vector2(attack[0], attack[1]))
	$game_button/build_Container.set_position(Vector2(build[0], build[1]))

func _on_retry_pressed():
	emit_signal("reset_player")
	emit_signal("reset_inventory")
	Global.playerMaxHealth = 100
	Global.playerSpeed = 100
	get_tree().reload_current_scene()

func _on_exit_pressed():
	if Global.mob_dead > Global.Account["kills"]:
		Global.Account["kills"] = Global.mob_dead
		Global.Account["time"] = Global.time
	elif Global.mob_dead == Global.Account["kills"] and Global.Account["time"] < Global.time:
		Global.Account["time"] = Global.time
	emit_signal("reset_player")
	emit_signal("reset_inventory")
	Global.playerMaxHealth = 100
	Global.playerSpeed = 100
	get_tree().change_scene_to_file("res://MainScene/MainPage.tscn")

func _on_player_player_dead(time,mob):
	$Dead/Sprite2D/time/value.text = str((time/5)/24) + "day " + str((time/5)%24) + 'hr'
	$Dead/Sprite2D/enemy/value.text = str(mob)
	
func button_color():
	if get_parent().can_build and get_parent().wood >= 5:
		$game_button/build_Container/turret_1.modulate = Color.WHITE
	else:
		$game_button/build_Container/turret_1.modulate = Color.DIM_GRAY
	if get_parent().can_build and get_parent().stone >= 5:
		$game_button/build_Container/turret_2.modulate = Color.WHITE
	else:
		$game_button/build_Container/turret_2.modulate = Color.DIM_GRAY
	if get_parent().can_build and get_parent().wood >= 5 and get_parent().stone >= 5:
		$game_button/build_Container/turret_3.modulate = Color.WHITE
	else:
		$game_button/build_Container/turret_3.modulate = Color.DIM_GRAY
		
	$game_button/build_Container/turret_4.modulate = Color.DIM_GRAY

func time_update():
	var time = String()
	var apm = 'am'
	var hr = (Global.time/5 + 6)%24
	if hr < 12:
		apm = 'am'
	else:
		apm = 'pm'
			
	$Time/Hour.text = ("%02d" % ((Global.time/5 + 6)%12))
	$Time/Hour/APM.text = apm
	$Time/Day.text = 'day ' + str(((Global.time/5 + 6)/24)+1)

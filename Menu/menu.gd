extends Control

signal close_menu
signal button_move
signal reset_player_menu
signal reset_inventory_menu
signal quit_game

var bgm_bus = AudioServer.get_bus_index("BGM")
var se_bus = AudioServer.get_bus_index("SE")


func show_and_hide(first, second):
	first.show()
	second.hide()
	
	
func _on_back_from_option_pressed():
	emit_signal("close_menu")
	
func _on_music_pressed():
	show_and_hide($Music_page, $Options)

func _on_back_from_music_pressed():
	show_and_hide($Options, $Music_page)


func _on_bgm_slider_value_changed(value):
	AudioServer.set_bus_volume_db(bgm_bus, value)

func _on_se_slider_value_changed(value):
	AudioServer.set_bus_volume_db(se_bus, value)

func _on_adjustment_pressed():
	show_and_hide($Adjust_page, $Options)


func _on_back_from_adjust_pressed():
	#$Adjust_page/Joystick.position = Vector2(Global.Account["xposition"],Global.Account["yposition"])
	emit_signal("button_move", $Adjust_page/Joystick.position, $Adjust_page/Attack.position - Vector2(11,11), $Adjust_page/Build.position - Vector2(5.35,20.5))
	show_and_hide($Options, $Adjust_page)

func _on_hud_button_position(joystick_pos, attack_pos, build_pos):
	$Adjust_page/Joystick.position = joystick_pos
	$Adjust_page/Attack.position = attack_pos + Vector2(11,11)
	$Adjust_page/Build.position = build_pos + Vector2(5.35,20.5)


func _on_quit_game_pressed():
	$Quit_page.show()
	
func _on_no_pressed():
	$Quit_page.hide()

func _on_yes_pressed():
	emit_signal("quit_game")
	#get_tree().change_scene_to_file("res://MainScene/MainPage.tscn")
	





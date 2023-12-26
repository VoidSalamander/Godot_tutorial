extends Node2D

var counter


func _ready():
	$Start.visible = true
	Global.storage.resize(100)
	Global.storage.fill(0)
	Global.gacha = 0
	Global.currentCard = 0
	Global.currentStorage = 0
	Global.currentStorageStart = 0
	counter = 1


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Login/LoginPage.tscn")


func _on_timer_timeout():
	if counter == 1:
		$Tip.add_theme_color_override("font_color",Color(0.659, 0.616, 0.533))
		counter = 0
	else:
		$Tip.add_theme_color_override("font_color",Color(0.871, 0.851, 0.733))
		counter = 1

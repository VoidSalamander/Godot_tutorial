extends Node2D

var set

# Called when the node enters the scene tree for the first time.
func _ready():
	$".".visible = false

func _on_settings_pressed():
	var setting = load("res://MainScene/Settings.tscn")
	set = setting.instantiate()
	set.scale = Vector2(1.0,1.0)
	$"..".add_child(set)
	$".".visible = true
	$"../Main/Character/Character".visible = false
	$"../Main/Gacha/Gacha".visible = false
	$"../Main/Storage/Storage".visible = false
	$"../Main/Name/Settings".visible = false
	$"../Main/NewRoom/NewRoom".visible = false
	'''
	$"../Main/QuickMatch/QuickMatch".visible = false
	$"../Main/CoinAndDiamond/CoinAndGem".visible = false
	'''

func _on_left_pressed():
	$"..".remove_child(set)
	$".".visible = false
	$"../Main/Character/Character".visible = true
	$"../Main/Gacha/Gacha".visible = true
	$"../Main/Storage/Storage".visible = true
	$"../Main/Name/Settings".visible = true
	$"../Main/NewRoom/NewRoom".visible = true
	'''
	$"../Main/QuickMatch/QuickMatch".visible = true
	$"../Main/CoinAndDiamond/CoinAndGem".visible = true
	'''

func _on_bottom_pressed():
	$"..".remove_child(set)
	$".".visible = false
	$"../Main/Character/Character".visible = true
	$"../Main/Gacha/Gacha".visible = true
	$"../Main/Storage/Storage".visible = true
	$"../Main/Name/Settings".visible = true
	$"../Main/NewRoom/NewRoom".visible = true
	'''
	$"../Main/QuickMatch/QuickMatch".visible = true
	$"../Main/CoinAndDiamond/CoinAndGem".visible = true
	'''

func _on_right_pressed():
	$"..".remove_child(set)
	$".".visible = false
	$"../Main/Character/Character".visible = true
	$"../Main/Gacha/Gacha".visible = true
	$"../Main/Storage/Storage".visible = true
	$"../Main/Name/Settings".visible = true
	$"../Main/NewRoom/NewRoom".visible = true
	'''
	$"../Main/QuickMatch/QuickMatch".visible = true
	$"../Main/CoinAndDiamond/CoinAndGem".visible = true
	'''

func _on_top_pressed():
	$"..".remove_child(set)
	$".".visible = false
	$"../Main/Character/Character".visible = true
	$"../Main/Gacha/Gacha".visible = true
	$"../Main/Storage/Storage".visible = true
	$"../Main/Name/Settings".visible = true
	$"../Main/NewRoom/NewRoom".visible = true
	'''
	$"../Main/QuickMatch/QuickMatch".visible = true
	$"../Main/CoinAndDiamond/CoinAndGem".visible = true
	'''

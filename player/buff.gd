extends Node2D

var sound

func _ready():
	get_pick_sound()

func get_wood(num: int):
	get_parent().wood += num
	#sound.play()

func get_stone(num: int):
	get_parent().stone += num
	#sound.play()

func get_gear(num: int):
	get_parent().gear += num
	#sound.play()

# gradual decrease
func speed_modify(increas: float):
	get_parent().speed += increas

func get_pick_sound():
	var player = get_parent()
	if player:
		sound = player.get_node_or_null("Sound/Pick")
	

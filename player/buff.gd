extends Node2D

func get_wood(num: int):
	get_parent().wood += num

func get_stone(num: int):
	get_parent().stone += num

func get_gear(num: int):
	get_parent().gear += num

# gradual decrease
func speed_modify(increas: float):
	get_parent().speed += increas

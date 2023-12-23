extends Node2D
@onready var player = $".."
@onready var collisionShape = $"../CollisionShape2D"

func _process(_delta):
	if player.speed > 200:
		player.speed -= 0.3
	elif player.speed < 200:
		player.speed = 200
		
func effect_speedup():
	player.item_num += 1
	player.speed = 50


	
func effect_get_sheild():
	if player.shield < 5:
		player.shield += 1
	

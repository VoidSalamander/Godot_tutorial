extends Node2D
class_name  World


@export var turret : PackedScene
@onready var player = $player

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_player_build_terret():
	if player.item_num >= 5:
		var temp = turret.instantiate()
		add_child(temp)
		temp.position = player.global_position
		player.item_num -= 5
		

func _on_timer_timeout():
	Global.time += 1

extends Node2D
class_name  World


@export var turret : PackedScene
@onready var player = $player



var player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$CanvasLayer/HSplitContainer/Label.text = str(player.item_num)
	$CanvasLayer/HSplitContainer2/Label.text = str(player.health)
#	if Input.is_action_just_pressed("build"):
#		print(player.item_num)
#		if player.item_num >= 5:
#			var temp = turret.instantiate()
#			add_child(temp)
#			temp.position = player.global_position
#			player.item_num -= 5

func _on_mob_spawn_timer_timeout():
	var mob = mob_node.instantiate()
	mob.player = $player
	add_child(mob)


func _on_player_build_terret():
	if player.item_num >= 5:
			var temp = turret.instantiate()
			add_child(temp)
			temp.position = player.global_position
			player.item_num -= 5


func _on_timer_timeout():
	Global.time += 1

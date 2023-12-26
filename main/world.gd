extends Node2D
class_name  World

@onready var player = $player

func _ready():
	$AudioStreamPlayer2D.play()

func _on_timer_timeout():
	Global.time += 1

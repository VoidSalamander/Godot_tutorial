extends Node2D
class_name  World

@onready var player = $player

func _ready():
	$BGM_day.play()

func _on_timer_timeout():
	Global.time += 1
	if Global.time%120 == 0:
		$BGM_night.stop()
		$BGM_day.play()
	elif Global.time%60 == 0:
		$BGM_day.stop()
		$BGM_night.play()

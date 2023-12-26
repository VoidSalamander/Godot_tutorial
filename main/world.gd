extends Node2D
class_name  World

@onready var player = $player

func _ready():
	$BGM_day.play()

func _on_timer_timeout():
	Global.time += 1
	if Global.time%60 == 0:
		if !$BGM_day.playing:
			$BGM_night.stop()
			$BGM_day.play()
		if $BGM_day.playing:
			$BGM_day.stop()
			$BGM_night.play()

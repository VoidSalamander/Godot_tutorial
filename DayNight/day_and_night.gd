extends Node2D

var state = "day"

var change_state = false

@export var length_of_day = 30 #sec
@export var length_of_night = 30 #sec


func _ready():
	if state == "day":
		$ColorRect.color.a = 0
	elif state == "night":
		$ColorRect.color.a = 150


func _on_timer_timeout():
	if state == "day":
		state = "night"
	elif state == "night":
		state = "day"
		
	change_state = true


func _process(_delta):
	if change_state == true:
		change_state = false
		if state == "day":
			change_to_day()
		if state == "night":
			change_to_night()


func change_to_day():
	$AnimationPlayer.play("nighttoday")
	$Timer.wait_time = length_of_day
	$Timer.start()


func change_to_night():
	$AnimationPlayer.play("daytonight")
	$Timer.wait_time = length_of_night
	$Timer.start()

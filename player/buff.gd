extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().speed > 200:
		get_parent().speed -= 0.3
	elif get_parent().speed < 200:
		get_parent().speed = 200
		
func effect_speedup():
	get_parent().speed += 50

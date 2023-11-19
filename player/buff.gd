extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$bigger_Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().speed > 200:
		get_parent().speed -= 0.3
	elif get_parent().speed < 200:
		get_parent().speed = 200
		
func effect_speedup():
	get_parent().speed += 50

func effect_bigger():
	get_parent().scale += Vector2(0.1,0.1)
	get_parent().get_node("CollisionShape2D").scale += Vector2(0.1,0.1)
	if !$bigger_Timer.is_stopped():
		$bigger_Timer.wait_time += 0.1
	$bigger_Timer.start()
	
func _on_bigger_timer_timeout():
	get_parent().get_node("CollisionShape2D").scale = Vector2(1, 1)
	get_parent().scale = Vector2(1, 1)

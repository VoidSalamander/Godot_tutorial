extends Area2D

@export var speed : int = 750


func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body):
	if body.is_in_group("mob"):
		body.queue_free()
		queue_free()
	else:
		body.queue_free()
		queue_free()

func _on_timer_timeout():
	queue_free()

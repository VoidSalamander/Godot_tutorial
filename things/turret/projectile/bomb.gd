extends Area2D

@export var speed : int = 750
var damage = 4

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_area_entered(area):
	if area.has_method("damage"):
		area.damage(damage)
		damage -= 2
	if damage == 0:
		queue_free()

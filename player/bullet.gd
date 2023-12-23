extends Area2D

@export var speed : int = 500

var velocity = Vector2.ZERO
var look_once = true

func _ready():
	pass
	
func _physics_process(delta):
	if look_once:
		velocity = Global.bullet_direction
		look_once = false
	global_position += velocity * delta * speed
		
func _on_timer_timeout():
	queue_free()

func _on_area_entered(area):
	if area.has_method("damage") and area.is_in_group("mob"):
		area.damage(2)
		queue_free()

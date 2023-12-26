extends Area2D

@export var speed : int = 750
var damage = 4
var is_velocity: bool = false
var velocity:Vector2

func init(input_damage, input_speed, input_is_velocity):
	damage = input_damage
	speed = input_speed
	is_velocity = input_is_velocity
	
func _physics_process(delta):
	if is_velocity:
		self.global_position += velocity * speed * delta
	else:
		position += transform.x * speed * delta

func _on_area_entered(area):
	if area.has_method("damage") and area.is_in_group("mob"):
		area.damage(damage)
		damage -= 2
	if damage == 0:
		queue_free()

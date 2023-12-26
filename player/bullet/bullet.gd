extends Area2D

@export var speed : int = 300

var velocity = Vector2.ZERO
var look_once = true
var attack_damage: float = 2.0
var reduce_damage: float
var chain_num: int


func init(input_damage: float, input_reduce_damage: int, input_chain_num: int):
	reduce_damage = input_reduce_damage
	attack_damage = input_damage
	chain_num = input_chain_num

func _physics_process(delta):
	if look_once:
		velocity = Global.bullet_direction
		look_once = false
	global_position += velocity * delta * speed
		
func _on_timer_timeout():
	queue_free()

func _on_area_entered(area):
	if area.has_method("damage") and area.is_in_group("mob"):
		area.damage(attack_damage)
		attack_damage -= reduce_damage
		if attack_damage <= 0: queue_free()
		

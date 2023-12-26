extends CharacterBody2D
class_name Mob


@onready var nav = $NavigationComponent

var player : CharacterBody2D
var damage : float = 3
var speed : float = 20 
var health : float = 20

func init(input_damage: float, input_speed: float, input_health: float):
	damage =input_damage
	speed = input_speed
	health =input_health
	$HealthComponent.MAX_HEALTH = health
	$HealthComponent.update_health()

func _physics_process(_delta) -> void:
	velocity = nav.dir * speed
	move_and_slide()

func _on_grow_up_timer_timeout():
	init(damage*1.2, speed*1.2, health*1.2)
	self.scale += Vector2(0.2, 0.2)

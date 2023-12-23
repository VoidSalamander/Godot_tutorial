extends CharacterBody2D
class_name Mob

@export var speed : float = 20 
@onready var nav = $NavigationComponent


var player : CharacterBody2D
var damage = 3

func _physics_process(_delta) -> void:
	velocity = nav.dir * speed
	move_and_slide()

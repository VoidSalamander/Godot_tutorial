extends CharacterBody2D
class_name Mob

@export var speed : float = 20 
var player : CharacterBody2D
@onready var nav = $NavigationComponent

func _physics_process(_delta) -> void:
	velocity = nav.dir * speed
	move_and_slide()

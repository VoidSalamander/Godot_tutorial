extends CharacterBody2D

@export var speed : float = 20 
@export var player : CharacterBody2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _ready():
	makepath()

func _physics_process(delta) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	print(nav_agent.get_next_path_position())
	move_and_slide()

func makepath():
	nav_agent.target_position = player.global_position
	
func _on_timer_timeout():
	
	makepath()

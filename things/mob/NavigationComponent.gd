extends Node2D
class_name Navigation_component

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var target = get_parent().player
var face = [Vector2(1,0), Vector2(0,1), Vector2(-1,0), Vector2(0,-1),
			Vector2(1,1), Vector2(-1,1), Vector2(-1,-1), Vector2(1,-1)]
			
var random_number = 0
var attack_range = 100 
var dir = Vector2(1,0)
var temp_target

func _on_update_timer_timeout():
	if temp_target:
		nav_agent.target_position = temp_target.global_position
	else:
		nav_agent.target_position = target.global_position
	
	dir = to_local(nav_agent.get_next_path_position()).normalized()

func motion():
	#白天
	if Global.time % 60 < 30:
		dir = face[random_number].normalized()
		if global_position.distance_to(target.global_position) < attack_range:
			dir = to_local(nav_agent.get_next_path_position()).normalized()
	#夜晚
	else:
		dir = to_local(nav_agent.get_next_path_position()).normalized()


func _on_wander_timer_timeout():
	random_number = randi() % 8

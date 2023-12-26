extends Area2D

@export var attack_area: PackedScene

var attack_able_stack = []
var attack_rate = 2 #second

func _ready():
	$attack_rate.wait_time = attack_rate

func attacking():
	if !attack_able_stack.is_empty():
		var nearest = attack_able_stack[0]
		$"../NavigationComponent".temp_target = nearest
		nearest.damage(get_parent().damage)

func _on_area_entered(area):
	if area.has_method("damage") and !area.is_in_group("mob"):
		attack_able_stack.push_back(area)

func _on_area_exited(area):
	if attack_able_stack.has(area):
		if area == attack_able_stack[0]:
			$"../NavigationComponent".temp_target = null
		attack_able_stack.erase(area)

func _on_attack_rate_timeout():
	attacking()
	

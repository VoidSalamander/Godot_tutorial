extends Node2D

var attack_able_mob = []

@export var bullet: PackedScene

func _on_attac_range_body_entered(body):
	if body.is_in_group("mob"):
		attack_able_mob.push_back(body)

func _on_attac_range_body_exited(body):
	if body.is_in_group("mob"):
		attack_able_mob.erase(body)

func shoot():
	var bullet_node = Global.instance_node(bullet, global_position)
	bullet_node.init(get_parent().attack_damage)
	if !attack_able_mob.is_empty():
		var nearest_mob = attack_able_mob[0]
		for i in range(attack_able_mob.size()):
			if position.distance_to(attack_able_mob[i].position) < position.distance_to(nearest_mob.position):
				nearest_mob = attack_able_mob[i]
		Global.bullet_direction = (nearest_mob.global_position - global_position).normalized()
	else:
		Global.bullet_direction = get_parent().face

func _on_attack_button_pressed():
	if $Reload.is_stopped():
		shoot()
		$Reload.start()

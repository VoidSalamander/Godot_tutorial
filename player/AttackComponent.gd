extends Node2D

var attack_able_mob = []

@export var bullet: PackedScene

func _process(_delta):
	update_attack_speed()
	update_blasphemy()
	update_bomb()

func update_attack_speed():
	$Reload.wait_time = 1/get_parent().attack_speed

func update_blasphemy():
	if get_parent().is_blasphemy:
		$blasphemy.visible = true
		$blasphemy/CollisionShape2D.disabled = false
		if $blasphemy/Timer.is_stopped(): $blasphemy/Timer.start()
	else:
		$blasphemy.visible = false
		$blasphemy/CollisionShape2D.disabled = true

func update_bomb():
	if get_parent().bomb_damage > 0:
		for area in $AttacRange.get_overlapping_areas():
			if area.has_method("damage") and area.is_in_group("mob"):
				area.damage(get_parent().bomb_damage + get_parent().bonus_damage)
	get_parent().bomb_damage = 0
	
	
func _on_attac_range_body_entered(body):
	if body.is_in_group("mob"):
		attack_able_mob.push_back(body)

func _on_attac_range_body_exited(body):
	if body.is_in_group("mob"):
		attack_able_mob.erase(body)

func shoot():
	get_parent().is_sneak = false
	var bullet_node = Global.instance_node(bullet, global_position)
	bullet_node.init(get_parent().attack_damage + get_parent().bonus_damage, get_parent().reduce_attack, get_parent().chain_num)
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

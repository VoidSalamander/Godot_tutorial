extends Node2D

var attack_able_mob = []

@export var bullet : PackedScene
@export var fire_rate :float = 2 #second

func _ready():
	$StaticBody2D/CollisionShape2D.disabled = true
	$fire_rate.wait_time = fire_rate

func _on_atack_range_body_entered(body):
	if body.is_in_group("mob"):
		attack_able_mob.push_back(body)

func _on_atack_range_body_exited(body):
	if body.is_in_group("mob") and attack_able_mob.has(body):
		attack_able_mob.erase(body)

func turret_fire():
	var projectile = bullet.instantiate()
	add_child(projectile)
	
	if !attack_able_mob.is_empty():
		var nearest_mob = attack_able_mob[0]
		for i in range(attack_able_mob.size()):
			if position.distance_to(attack_able_mob[i].position) < position.distance_to(nearest_mob.position):
				nearest_mob = attack_able_mob[i]
		look_at(nearest_mob.position)
	
	projectile.transform = $Marker2D.transform
	
func _on_fire_rate_timeout():
	if !attack_able_mob.is_empty():
		turret_fire()

func _on_area_2d_body_exited(_body):
	call_deferred("_able_collision")

func _able_collision():
	$StaticBody2D/CollisionShape2D.disabled = false

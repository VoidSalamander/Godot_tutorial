extends Area2D

var attack_able_mob = []

@export var bullet : PackedScene
@export var fire_rate :float = 5 #second

func _ready():
	$fire_rate.wait_time = fire_rate

func _on_body_entered(body):
	if body.is_in_group("mob"):
		attack_able_mob.push_back(body)

func _on_body_exited(body):
	if body.is_in_group("mob") and attack_able_mob.has(body):
		attack_able_mob.erase(body)
		
func turret_fire():
	var projectile = bullet.instantiate()
	projectile.init(15, 100, false)
	add_child(projectile)
	
	if !attack_able_mob.is_empty():
		var nearest_mob = attack_able_mob[0]
		for i in range(attack_able_mob.size()):
			if position.distance_to(attack_able_mob[i].position) < position.distance_to(nearest_mob.position):
				nearest_mob = attack_able_mob[i]
		get_parent().look_at(nearest_mob.position)
	projectile.transform = $Marker2D.transform
	projectile.scale *= 3

func _on_fire_rate_timeout():
	if !attack_able_mob.is_empty():
		turret_fire()

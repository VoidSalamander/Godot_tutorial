extends Node2D

var attack_able_mob = []
@export var bullet : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_atack_range_body_entered(body):
	if body.is_in_group("mob"):
		attack_able_mob.push_back(body)

func _on_atack_range_body_exited(body):
	if body.is_in_group("mob"):
		attack_able_mob.erase(body)
	if body == bullet:
		body.queue_free()

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
	turret_fire()

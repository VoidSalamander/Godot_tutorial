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
		
func turret_fire(num):
	var projectile = bullet.instantiate()
	projectile.init(2, num, true)
	add_child(projectile)
	
	var mob = attack_able_mob[randi_range(0,attack_able_mob.size()-1)]
	var dir = Vector2(mob.global_position - self.global_position).normalized()
	dir = dir.rotated(deg_to_rad(randf_range(-50,50)))
	projectile.velocity = dir

func _on_fire_rate_timeout():
	if !attack_able_mob.is_empty():
		for i in range(10):
			turret_fire((i+1)*20 + 100)

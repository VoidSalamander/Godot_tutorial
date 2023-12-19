extends CharacterBody2D
class_name Mob

@export var speed : float = 20 
@export var player : CharacterBody2D
@onready var nav = $NavigationComponent

var health = 30

func _physics_process(_delta) -> void:
	velocity = nav.dir * speed
	move_and_slide()
	#look_at(player.position)
	$Sprite2D.rotate(0.1)
	$HealthBar.value = health
		
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		pass
		#Global.mob_dead += 1
		#queue_free()

func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet"):
		health -= 10
		modulate = Color.RED
		$Mob_stun.start()
		area.queue_free()
		if health <= 0:
			Global.mob_dead += 1
			queue_free()

func _on_mob_stun_timeout():
	modulate = Color.WHITE


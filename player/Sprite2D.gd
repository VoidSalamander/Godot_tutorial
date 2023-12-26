extends Sprite2D

@onready var animations = $AnimationPlayer

func _physics_process(_delta):
	updatAnimation()
	if get_parent().is_sneak:
		self.self_modulate.a = 0.5
	else:
		self.self_modulate.a = 1

func updatAnimation():
	if(get_parent().velocity.length() == 0):
		if(animations.is_playing()): animations.stop()
	else:
		var direction
		if abs(get_parent().velocity.x) > abs(get_parent().velocity.y):
			if(get_parent().velocity.x < 0): direction = "left"
			else: direction = "right"
		else:
			if(get_parent().velocity.y < 0): direction = "up"
			else: direction = "down"
		animations.play("walk_" + direction)

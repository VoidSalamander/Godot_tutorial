extends DirectionalLight2D

func _process(delta):
	if Global.time % 120 == 0:
		$day_timer.start()
	elif Global.time % 60 == 0:
		self.blend_mode = Light2D.BLEND_MODE_SUB
		self.energy = 0
		$night_timer.start()


func _on_night_timer_timeout():
	self.energy += 0.01
	if self.energy < 0.5:
		$night_timer.start()

func _on_day_timer_timeout():
	self.energy -= 0.01
	if self.energy > 0:
		$day_timer.start()
	if self.energy <= 0:
		self.blend_mode = Light2D.BLEND_MODE_ADD
		self.energy = 0.1

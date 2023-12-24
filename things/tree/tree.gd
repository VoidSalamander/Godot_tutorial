extends Node2D


func _ready():
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		$TouchScreenButton.visible = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		$TouchScreenButton.visible = false
		

func _on_touch_screen_button_pressed():
	$TextureProgressBar.visible = true

	# Loop to decrease the progress bar value gradually
	for i in range(40):
		$TextureProgressBar.value -= 2.5
		await get_tree().create_timer(0.05).timeout  
	
	$TouchScreenButton.visible = false	
	$TextureProgressBar.visible = false
	$tree_B.visible = false
	$wood.visible = true
	$wood/AnimationPlayer.play("falling")
	await get_tree().create_timer(1).timeout
	$wood/AnimationPlayer.play("fade")
	await get_tree().create_timer(0.5).timeout
	queue_free()

	

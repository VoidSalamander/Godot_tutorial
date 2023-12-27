extends Node2D

@export var item: PackedScene

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		$TouchScreenButton.visible = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		$TouchScreenButton.visible = false
		
func _on_touch_screen_button_pressed():
	$TextureProgressBar.visible = true
	for i in range(40):
		$TextureProgressBar.value -= 2.5
		await get_tree().create_timer(0.05).timeout
	queue_free()

func _on_tree_exited():
	var node = Global.instance_node(item, Vector2(global_position.x+randf_range(20,-20),global_position.y + randf_range(20,-20)))

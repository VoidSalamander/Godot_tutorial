extends Item

@export var stone : PackedScene
@onready var item_list_node = get_parent().get_node("item_list")


func _on_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("StateModifyer").get_wood(1)

func collect(_inventory: Inventory):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		$TouchScreenButton.visible = true


func _on_touch_screen_button_pressed():
	$TextureProgressBar.visible = true
	
	for i in range(40):
		$TextureProgressBar.value -= 2.5
		await get_tree().create_timer(0.05).timeout
		
	$TouchScreenButton.visible = false	
	$TextureProgressBar.visible = false
	$Sprite2D.visible = false
	$stone2.visible = true
	$stone2/AnimationPlayer.play("falling")
	await get_tree().create_timer(1).timeout
	
	for i in range(2):
		creat_item(stone)
	
	queue_free()


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		$TouchScreenButton.visible = false


func creat_item(item: PackedScene):
	var created_item = item.instantiate()
	created_item.init_item($stone2.global_position)
	item_list_node.call_deferred("add_child", created_item)



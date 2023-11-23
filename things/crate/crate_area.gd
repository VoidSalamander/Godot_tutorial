extends Area2D

@export var item : PackedScene
@export var shield : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if $lid.visible == false:
		$crate_unopen.visible = false
		$lid.visible = true
		$lid.position = Vector2($box.position.x + randf_range(30,-30), $box.position.y + randf_range(30,-30))
		$box.visible = true
		
		var item_list_node = get_parent().get_node("item_list")
		
		for i in range(3):
			var spawn_item = item.instantiate()
			spawn_item.init_item($box.global_position)
			item_list_node.add_child(spawn_item)
			
		if randi_range(0,1) == 1:
			var spawn_item = shield.instantiate()
			spawn_item.init_item($box.global_position)
			item_list_node.add_child(spawn_item)
		$Timer.start()

func _on_child_entered_tree(node):
	pass

func _on_timer_timeout():
	queue_free()

func init_crate():
	global_position = Vector2(randi_range(-1000, 1000), randi_range(-1000, 1000))

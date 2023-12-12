extends Node2D

@export var item : PackedScene
@export var shield : PackedScene

signal open_signal
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func init_crate():
	position = Vector2(randi_range(0,1000),randi_range(0,1000))
	self.connect("open_signal", open_box)

func open_box():
	var bodies = $interact_area.get_overlapping_bodies()
	for body in bodies:
		if 	body.is_in_group("player"):
			if $lid.visible == false:
				$crate_unopen.visible = false
				$lid.visible = true
				$lid.position = Vector2($box.position.x + randf_range(30,-30), $box.position.y + randf_range(30,-30))
				$box.visible = true
				
				var item_list_node = get_parent().get_node("item_list")
				
				for i in range(3):
					var spawn_item = item.instantiate()
					spawn_item.init_item($box.global_position)
					print($box.global_position)
					item_list_node.call_deferred("add_child", spawn_item)
					
				if randi_range(0,1) == 1:
					var spawn_item = shield.instantiate()
					spawn_item.init_item($box.global_position)
					item_list_node.call_deferred("add_child", spawn_item)
				$Timer.start()

func _on_timer_timeout():
	queue_free()

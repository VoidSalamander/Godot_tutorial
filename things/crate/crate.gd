extends Node2D

@export var item : PackedScene
@export var shield : PackedScene
@export var wood : PackedScene
@export var gear : PackedScene
@export var stone : PackedScene

signal open_signal

@onready var item_list_node = get_parent().get_node("item_list")

func init_crate():
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
				
				for i in range(3):
					creat_item(wood)
				creat_item(stone)
				creat_item(gear)
				if randi_range(0,1) == 1:
					creat_item(shield)
				$Timer.start()

func _on_timer_timeout():
	queue_free()

func _on_interact_area_body_entered(body):
	if body.is_in_group("player"):
		open_box()

func creat_item(item: PackedScene):
	var created_item = item.instantiate()
	created_item.init_item($box.global_position)
	item_list_node.call_deferred("add_child", created_item)

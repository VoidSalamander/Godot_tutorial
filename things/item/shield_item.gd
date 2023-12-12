extends Node2D

@export var drop_range: int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

	
func init_item(parent_position):
	self.position = Vector2(parent_position.x + randf_range(drop_range,-1*drop_range), parent_position.y + randf_range(drop_range,-1*drop_range))

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("buff").effect_get_sheild()
		queue_free()


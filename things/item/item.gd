extends Area2D
class_name Item

@export var itemRes: InventoryItem

var audio_player
var se_bus = AudioServer.get_bus_name(2)
var sound = preload("res://art/Music/button_click.mp3")

var drop_range: int = 50

func init_item(parent_position):
	self.position = Vector2(parent_position.x + randf_range(drop_range,-1*drop_range), parent_position.y + randf_range(drop_range,-1*drop_range))
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		pick_sound()
		visible = false
		await get_tree().create_timer(0.5).timeout
		queue_free()

func collect(inventory: Inventory):
	inventory.insert(itemRes)
	
func pick_sound():
	audio_player = AudioStreamPlayer2D.new()
	add_child(audio_player)
	audio_player.stream = sound
	audio_player.bus = se_bus
	audio_player.play()
	


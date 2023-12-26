extends Node

var audio_player
var se_bus = AudioServer.get_bus_name(2)


func _ready():
	audio_player = AudioStreamPlayer2D.new()
	add_child(audio_player)
	get_tree().connect("tree_changed", _on_tree_changed)

		
func connect_buttons():
	for button in get_tree().get_nodes_in_group("buttons"):
		if button is Button or button is TouchScreenButton:
			button.connect("pressed", _on_button_pressed)

func disconnect_buttons():
	for button in get_tree().get_nodes_in_group("buttons"):
		if (button is TouchScreenButton or button is Button) and button.is_connected("pressed", _on_button_pressed):
			button.disconnect("pressed", _on_button_pressed)

func _on_button_pressed():
	var button = get_node_or_null(get_path())
	if button:
		var sound = preload("res://art/Music/button_click.mp3")
		audio_player.stream = sound
		audio_player.bus = se_bus
		audio_player.play()

func _on_tree_changed():
	if get_tree() != null:  
		disconnect_buttons()  
		connect_buttons()     

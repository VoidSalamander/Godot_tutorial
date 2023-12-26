extends CharacterBody2D

@export var attack_position: Array = [200 ,85]
@export var build_position: Array = [160 ,85]
@export var joystick_position: Array = [45 ,95]
@export var inventory: Inventory
@export var tilemap: TileMap

signal player_dead
signal player_shoot
signal player_use_item

var move_vector = Vector2(0,0)
var joystick_active = false
var is_dead = false
var dead_moment = 0
var menu_show = false
var face = Vector2(1,0)
var speed_modify: float
var can_build = true
var can_shoot = true
var is_shooting = false
var use_item_num = 0

#==========#
# resource #
#==========#
var wood: int = 0
var stone: int = 0
var gear: int = 0

#==============#
# Player State #
#==============#
var speed: int = 100
var armor: int = 0
var attack_damage: float = 5.0
var bonus_damage: float = 0
var max_health: float
var health: float
var attack_speed: float = 0.5 #shoot()/seconds
var is_blasphemy: bool = false
var blasphemy_damage:float = 0

var bomb_damage:float =0
var is_sneak: bool = false
@onready var reduce_attack:float = attack_damage
var chain_num:float = 0


func _physics_process(_delta):
	handle_input()
	move_and_slide()
	dead_and_statistics()
	speed_modify = tilemap.get_tile_data(self.position, "speed_modify")
	$HUD/State/Wood/Label.text = str(wood)
	
func handle_input():
	if joystick_active:
		velocity = move_vector * speed * speed_modify
		face = move_vector
	else:
		velocity = Vector2(0,0) * speed
		$HUD/game_button/Joystick_mark.position = $HUD/game_button/Joystick.position
	
	if can_shoot and is_shooting:
		emit_signal("player_shoot")
	
	if use_item_num != 0:
		emit_signal("player_use_item",use_item_num)
		use_item_num = 0

var left_hand_index = -1  
var right_hand_index = -1  

func _input(event):
	if !menu_show:
		if event is InputEventScreenTouch:
			if event.is_pressed():
				# 检查触摸位置以确定左右手
				if event.position.x < get_viewport_rect().size.x *0.22  or (event.position.x < get_viewport_rect().size.x / 2 and event.position.y < get_viewport_rect().size.y *0.77):
					# 左手触摸事件
					left_hand_index = event.index
					handle_left_hand_touch(event.position)
				else:
					right_hand_index = event.index
					if $HUD/game_button/Attack_button.get_global_rect().has_point(event.position):
						$HUD/game_button/Attack_button.modulate = Color.ORANGE
						is_shooting = true
					for i in range(1,8):
						var slot = 'inv_UI_slot' + str(i)
						var button_path = "./HUD/Control/NinePatchRect/GridContainer/"+ slot +"/Button"  
						var button = get_node(button_path)
						if button.get_global_rect().has_point(event.position):
							use_item_num = i 
#					if $HUD/game_button/Build_button.get_global_rect().has_point(event.position):
#						if can_build:
#							emit_signal("build_terret")
					
			if event.is_pressed() == false:
				if event.index == left_hand_index:
					left_hand_index = -1
					joystick_active = false  # 左手触摸事件结束，禁用操控
					# 左手触摸事件结束
				elif event.index == right_hand_index:
					right_hand_index = -1
					$HUD/game_button/Attack_button.modulate = Color.WHITE
					is_shooting = false
					use_item_num = 0
		if event is InputEventScreenDrag:
			if event.index == left_hand_index:
				handle_left_hand_touch(event.position)

func handle_left_hand_touch(touch_position):
	if $HUD/game_button/Joystick/Touch_area.is_pressed():
		move_vector = calculate_move_vector(touch_position)
		$Sprite2D/Face.rotation_degrees = move_vector.angle() * 180 / PI
		joystick_active = true
		var joystick_range = touch_position.distance_to($HUD/game_button/Joystick.position)
		if joystick_range > 15: 
			$HUD/game_button/Joystick_mark.position = calculate_move_vector(touch_position) * 15 + $HUD/game_button/Joystick.position
		else:
			$HUD/game_button/Joystick_mark.position = touch_position

func calculate_move_vector(event_position):
	return (event_position - $HUD/game_button/Joystick.position).normalized()	

func dead_and_statistics():
	if !is_dead:
		dead_moment = Global.time
	else:
		menu_show = true
		joystick_active = false
		$HUD/Menu_button.hide()
		$HUD/Dead.show()
		emit_signal("player_dead",dead_moment,Global.mob_dead)

func _on_hud_pause():
	menu_show = true
	
func _on_hud_back_to_game():
	menu_show = false

func _on_hud_reset_player():
	Global.time = 0
	Global.mob_dead = 0

func _on_menu_reset_player_menu():
	Global.time = 0
	Global.mob_dead = 0


func _on_menu_quit_game():
	is_dead = true

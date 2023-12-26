extends Node2D

var duration_bonus = 0
var sound

func _ready():
	get_pick_sound()

func get_wood(num: int):
	get_parent().wood += num
	sound.play()

func get_stone(num: int):
	get_parent().stone += num
	sound.play()

func get_gear(num: int):
	get_parent().gear += num
	sound.play()

func armor_modify(num: int):
	get_parent().armor += num

func bonus_damage_modify(num: int):
	get_parent().bonus_damage += num

func speed_modify(increas: float, effect_time: float, is_permanent:bool = false):
	if !is_permanent: get_timer(effect_time, _on_speed_modify_Timer_timeout, increas)
	get_parent().speed += increas
func _on_speed_modify_Timer_timeout(arg: float):
	get_parent().speed -= arg


func attack_speed_modify(increas: float, effect_time: float, is_permanent:bool = false):
	if !is_permanent: get_timer(effect_time, _on_attack_speed_modify_Timer_timeout, increas)
	get_parent().attack_speed += increas
func _on_attack_speed_modify_Timer_timeout(arg: float):
	get_parent().attack_speed -= arg
	
func chain_num_modify(increas: float, effect_time: float, is_permanent:bool = false):
	if !is_permanent: get_timer(effect_time, _on_chain_num_modify_Timer_timeout, increas)
	get_parent().chain_num += increas
func _on_chain_num_modify_Timer_timeout(arg: float):
	get_parent().chain_num -= arg
	
func blasphemy_modify(increas: float, effect_time: float):
	get_timer(effect_time, _on_blasphemy_modify_Timer_timeout, increas)
	get_parent().is_blasphemy = true
	get_parent().blasphemy_damage = increas
func _on_blasphemy_modify_Timer_timeout(arg: float):
	get_parent().blasphemy_damage -= arg
	get_parent().is_blasphemy = false
	
func reduce_attack_modify(increas: float, effect_time: float):
	get_timer(effect_time, _on_reduce_attack_modify_Timer_timeout, increas)
	get_parent().reduce_attack = increas
func _on_reduce_attack_modify_Timer_timeout(arg: float):
	get_parent().reduce_attack = get_parent().attack_damage

func bomb_modify(num: int):
	get_parent().bomb_damage = num
	
#percentage
func health_modify(num: float):
	get_parent().health += get_parent().max_health * num
	if get_parent().health > get_parent().max_health: get_parent().health = get_parent().max_health
	$"../HealthComponent".update_health()

func max_health_modify(num: float):
	get_parent().max_health += num
	$"../HealthComponent".update_health()
	
func sneak_modify(effect_time: float, is_permanent:bool = false):
	get_parent().is_sneak = true
	if !is_permanent: get_timer(effect_time, _on_sneak_modify_Timer_timeout, 0)

func _on_sneak_modify_Timer_timeout(_num):
	get_parent().is_sneak = false
	
func duration_modify(num: float):
	duration_bonus += num
 
func get_timer(wait_time:float, time_out_func, arg):
	var timer = get_tree().create_timer(wait_time + duration_bonus)
	timer.connect("timeout", Callable(time_out_func).bind(arg))

func get_pick_sound():
	var player = get_parent()
	if player:
		sound = player.get_node_or_null("Sound/Pick")
	

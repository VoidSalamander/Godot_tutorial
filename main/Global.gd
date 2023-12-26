extends Node

var node_creation_parent = null

var time =  0
var mob_dead = 0
var bullet_direction = Vector2.ZERO


func instance_node(node, location):
	var node_instance = node.instantiate()
	add_child(node_instance)
	node_instance.global_position = location
	return node_instance


var startGame = 0
var CardAmount = 3
var storage = []
var cards = 0
var lastrand = 0
var currentCard = 0
var currentStorage = 0
var currentStorageStart = 0
var cardsizeUnit = 0
var CoinAmount = 0
var GemAmount = 0
var currentAction = 0
var response = {'status': ''}

var reg_func: String = 'register'
var login_func: String = 'login'
var forgot_func: String = 'forget'
var verify_func: String = 'verify'
var rename_func: String = 'rename'
var search_func: String = 'search'
var gacha_func: String = 'gacha'
var leaderboard_func: String = 'leaderboard'
var topup_func: String = 'top_up'
var register_args = {'username': '', 'password': '', 'email': '', 'nickname': ''}
var login_args = {'username': '', 'password': ''}
var forgot_args = {'email': ''}
var verify_args = {'email': '', 'password': '', 'vcode': ''} 
var rename_args = {'username': '', 'nickname': '', 'cookies': ''}
var search_args = {'username': '', 'cookies': ''}
var gacha_args = {'username': '', 'draws': 1, 'cookies': ''}
var leaderboard_args = {'username': '', 'time': 10, 'kills': 10, 'cookies': ''}
var topup_args = {'username': '', 'coin': 0, 'diamond': 0, 'cookies': ''}
var Account = {'username': '', 'nickname': '', 'cookies': '', 'time': 0, 'kills': 0, 'xposition': 0, 'yposition': 0}
var CardUnit = preload("res://Gacha/CardUnit.tscn")

# Cardinfo = [Type, Name]
enum {Ecologist, WarCorrespondent, Bottle}

var Card = {
	Ecologist : 
		["Character", "Ecologist"],
	WarCorrespondent :
		["Character", "WarCorrespondent"],
	Bottle :
		["Tool", "bottle"]
}

var RareCards = [Ecologist, WarCorrespondent]
var RareCardAmount = 2
var Pcard = [10.0, 30.0, 100.0]

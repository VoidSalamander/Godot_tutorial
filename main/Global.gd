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


var playerSpeed = 0
var playerMaxHealth = 0

var CardAmount = 15
var storage = []
var cards = 0
var gacha = 0
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
var Account = {'username': 'Visitor1111', 'nickname': 'Player', 'cookies': '', 'time': 0, 'kills': 0, 'clothing': 'cloth_brown', 'accessory': '', 'cat': '', 'xposition': 0, 'yposition': 0}
var CardUnit = preload("res://Gacha/CardUnit.tscn")
var SAVE_PATH = "user://"+Account["username"]+".bin"

# Cardinfo = [Type, Name]
enum {Ecologist, WarCorrespondent, Bottle, Cake, AccessoryBanana, AccessoryCamera, AccessoryMemo, ClothBananayellow, ClothChristmas, ClothMemoyellow, ClothOrange, ClothWarCorrespondent, CatGrey, CatWhite, CatFlower}

var Card = {
	Ecologist : 
		["Character", "Ecologist"],
	WarCorrespondent :
		["Character", "WarCorrespondent"],
	Bottle :
		["Tool", "bottle"],
	Cake :
		["Tool", "cake"],
	AccessoryBanana :
		["Clothing", "accessory_banana"],
	AccessoryCamera :
		["Clothing", "accessory_camera"],
	AccessoryMemo :
		["Clothing", "accessory_memo"],
	ClothBananayellow :
		["Clothing", "clothing_bananayellow"],
	ClothChristmas :
		["Clothing", "clothing_christmas"],
	ClothMemoyellow :
		["Clothing", "clothing_memoyellow"],
	ClothOrange :
		["Clothing", "clothing_orange"],
	ClothWarCorrespondent :
		["Clothing", "clothing_war_correspondent"],
	CatGrey :
		["Clothing", "cat_grey"],
	CatWhite :
		["Clothing", "cat_white"],
	CatFlower :
		["Clothing", "cat_flower"]
}

var RareCards = [Ecologist, WarCorrespondent, CatFlower]
var RareCardAmount = 2

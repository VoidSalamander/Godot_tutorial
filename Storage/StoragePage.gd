extends Node2D

var StorageUnit = preload("res://Storage/StorageUnit.tscn")
var storageTemp = []


func _ready():
	$Information.visible = false
	$Information/ObjName.position = Vector2(-149,-83)
	$Frame/Frame1/Button1.visible = false
	$Frame/Frame2/Button2.visible = false
	$Frame/Frame3/Button3.visible = false
	$Frame/Frame4/Button4.visible = false
	$Frame/Frame5/Button5.visible = false
	$Frame/Frame6/Button6.visible = false
	$Frame/Frame7/Button7.visible = false
	$Frame/Frame8/Button8.visible = false
	$Frame/Frame9/Button9.visible = false
	$Frame/Frame10/Button10.visible = false
	storageTemp.resize(10)
	Global.currentStorage = Global.RareCardAmount - 1
	Global.currentStorageStart = Global.RareCardAmount
	
	for k in range(2):
		if Global.currentStorage == Global.CardAmount:
			break
		for j in range(5):
			Global.cardsizeUnit = 18
			Global.currentStorage += 1
			#print(Global.currentStorage)
			if Global.currentStorage == Global.CardAmount:
				break
			#print(Global.currentStorage)###################################################
			var cardPosition = Vector2( 0, 0)
			cardPosition = Vector2( 100+205*j , 155+229*k )
			
			#storageTemp.append(StorageUnit.instantiate())
			storageTemp[k*5+j] = StorageUnit.instantiate()
			storageTemp[k*5+j].position = cardPosition
			storageTemp[k*5+j].visible = false
			storageTemp[k*5+j].scale = Vector2(0.23,0.23)
			$Object.add_child(storageTemp[k*5+j])
			storageTemp[k*5+j].visible = true
			
	if Global.currentStorageStart < Global.CardAmount and Global.storage[Global.currentStorageStart] > 0:
		$Frame/Frame1/Button1.visible = true
	if Global.currentStorageStart+1 < Global.CardAmount and Global.storage[Global.currentStorageStart+1] > 0:
		$Frame/Frame2/Button2.visible = true
	if Global.currentStorageStart+2 < Global.CardAmount and Global.storage[Global.currentStorageStart+2] > 0:
		$Frame/Frame3/Button3.visible = true
	if Global.currentStorageStart+3 < Global.CardAmount and Global.storage[Global.currentStorageStart+3] > 0:
		$Frame/Frame4/Button4.visible = true
	if Global.currentStorageStart+4 < Global.CardAmount and Global.storage[Global.currentStorageStart+4] > 0:
		$Frame/Frame5/Button5.visible = true
	if Global.currentStorageStart+5 < Global.CardAmount and Global.storage[Global.currentStorageStart+5] > 0:
		$Frame/Frame6/Button6.visible = true
	if Global.currentStorageStart+6 < Global.CardAmount and Global.storage[Global.currentStorageStart+6] > 0:
		$Frame/Frame7/Button7.visible = true
	if Global.currentStorageStart+7 < Global.CardAmount and Global.storage[Global.currentStorageStart+7] > 0:
		$Frame/Frame8/Button8.visible = true
	if Global.currentStorageStart+8 < Global.CardAmount and Global.storage[Global.currentStorageStart+8] > 0:
		$Frame/Frame9/Button9.visible = true
	if Global.currentStorageStart+9 < Global.CardAmount and Global.storage[Global.currentStorageStart+9] > 0:
		$Frame/Frame10/Button10.visible = true
	
func _process(delta):
	if Global.currentStorageStart == 2:
		$ChangePage/LastPage.visible = false
		if Global.storage[Global.currentStorageStart] > 0:
			$Frame/Frame1/Amount.text = str(Global.storage[Global.currentStorageStart])
		else:
			$Frame/Frame1/Amount.text = ""
		if Global.storage[Global.currentStorageStart+1] > 0:
			$Frame/Frame2/Amount.text = str(Global.storage[Global.currentStorageStart+1])
		else:
			$Frame/Frame2/Amount.text = ""
	else:
		$ChangePage/LastPage.visible = true
		$Frame/Frame1/Amount.text = ""
		$Frame/Frame2/Amount.text = ""
	if Global.currentStorageStart+10 < Global.CardAmount-1:
		$ChangePage/NextPage.visible = true
	else:
		$ChangePage/NextPage.visible = false


func _on_back_pressed():
	#for i in range(10):
	for i in range(len(storageTemp)):
		if storageTemp[i]:
			storageTemp[i].queue_free()
	get_tree().change_scene_to_file("res://MainScene/MainPage.tscn")

var object

func _on_button_1_pressed():
	$Frame/Frame1/Button1.visible = false
	$Frame/Frame2/Button2.visible = false
	$Frame/Frame3/Button3.visible = false
	$Frame/Frame4/Button4.visible = false
	$Frame/Frame5/Button5.visible = false
	$Frame/Frame6/Button6.visible = false
	$Frame/Frame7/Button7.visible = false
	$Frame/Frame8/Button8.visible = false
	$Frame/Frame9/Button9.visible = false
	$Frame/Frame10/Button10.visible = false
	$Back/Back.visible = false
	$Information.visible = true
	$Information/ObjName.text = Global.Card[Global.currentStorageStart][1].replace("_"," ")
	object = Global.currentStorageStart
	if object == 2:
		$Information/ObjName.position = Vector2(-149,-120)
		$Information/ObjInformation.text = "Use to add health in the next game."
		$Information/ObjInformation.visible = true
	else:
		$Information/ObjInformation.visible = false

func _on_button_2_pressed():
	$Frame/Frame1/Button1.visible = false
	$Frame/Frame2/Button2.visible = false
	$Frame/Frame3/Button3.visible = false
	$Frame/Frame4/Button4.visible = false
	$Frame/Frame5/Button5.visible = false
	$Frame/Frame6/Button6.visible = false
	$Frame/Frame7/Button7.visible = false
	$Frame/Frame8/Button8.visible = false
	$Frame/Frame9/Button9.visible = false
	$Frame/Frame10/Button10.visible = false
	$Back/Back.visible = false
	$Information.visible = true
	$Information/ObjName.text = Global.Card[Global.currentStorageStart+1][1].replace("_"," ")
	object = Global.currentStorageStart+1
	if object == 3:
		$Information/ObjName.position = Vector2(-149,-120)
		$Information/ObjInformation.text = "Use to add speed in the next game."
		$Information/ObjInformation.visible = true
	else:
		$Information/ObjInformation.visible = false

func _on_button_3_pressed():
	$Frame/Frame1/Button1.visible = false
	$Frame/Frame2/Button2.visible = false
	$Frame/Frame3/Button3.visible = false
	$Frame/Frame4/Button4.visible = false
	$Frame/Frame5/Button5.visible = false
	$Frame/Frame6/Button6.visible = false
	$Frame/Frame7/Button7.visible = false
	$Frame/Frame8/Button8.visible = false
	$Frame/Frame9/Button9.visible = false
	$Frame/Frame10/Button10.visible = false
	$Back/Back.visible = false
	$Information/ObjInformation.visible = false
	$Information.visible = true
	$Information/ObjName.text = Global.Card[Global.currentStorageStart+2][1].replace("_"," ")
	object = Global.currentStorageStart+2

func _on_button_4_pressed():
	$Frame/Frame1/Button1.visible = false
	$Frame/Frame2/Button2.visible = false
	$Frame/Frame3/Button3.visible = false
	$Frame/Frame4/Button4.visible = false
	$Frame/Frame5/Button5.visible = false
	$Frame/Frame6/Button6.visible = false
	$Frame/Frame7/Button7.visible = false
	$Frame/Frame8/Button8.visible = false
	$Frame/Frame9/Button9.visible = false
	$Frame/Frame10/Button10.visible = false
	$Back/Back.visible = false
	$Information/ObjInformation.visible = false
	$Information.visible = true
	$Information/ObjName.text = Global.Card[Global.currentStorageStart+3][1].replace("_"," ")
	object = Global.currentStorageStart+3

func _on_button_5_pressed():
	$Frame/Frame1/Button1.visible = false
	$Frame/Frame2/Button2.visible = false
	$Frame/Frame3/Button3.visible = false
	$Frame/Frame4/Button4.visible = false
	$Frame/Frame5/Button5.visible = false
	$Frame/Frame6/Button6.visible = false
	$Frame/Frame7/Button7.visible = false
	$Frame/Frame8/Button8.visible = false
	$Frame/Frame9/Button9.visible = false
	$Frame/Frame10/Button10.visible = false
	$Back/Back.visible = false
	$Information/ObjInformation.visible = false
	$Information.visible = true
	$Information/ObjName.text = Global.Card[Global.currentStorageStart+4][1].replace("_"," ")
	object = Global.currentStorageStart+4

func _on_button_6_pressed():
	$Frame/Frame1/Button1.visible = false
	$Frame/Frame2/Button2.visible = false
	$Frame/Frame3/Button3.visible = false
	$Frame/Frame4/Button4.visible = false
	$Frame/Frame5/Button5.visible = false
	$Frame/Frame6/Button6.visible = false
	$Frame/Frame7/Button7.visible = false
	$Frame/Frame8/Button8.visible = false
	$Frame/Frame9/Button9.visible = false
	$Frame/Frame10/Button10.visible = false
	$Back/Back.visible = false
	$Information/ObjInformation.visible = false
	$Information.visible = true
	$Information/ObjName.text = Global.Card[Global.currentStorageStart+5][1].replace("_"," ")
	object = Global.currentStorageStart+5

func _on_button_7_pressed():
	$Frame/Frame1/Button1.visible = false
	$Frame/Frame2/Button2.visible = false
	$Frame/Frame3/Button3.visible = false
	$Frame/Frame4/Button4.visible = false
	$Frame/Frame5/Button5.visible = false
	$Frame/Frame6/Button6.visible = false
	$Frame/Frame7/Button7.visible = false
	$Frame/Frame8/Button8.visible = false
	$Frame/Frame9/Button9.visible = false
	$Frame/Frame10/Button10.visible = false
	$Back/Back.visible = false
	$Information/ObjInformation.visible = false
	$Information.visible = true
	$Information/ObjName.text = Global.Card[Global.currentStorageStart+6][1].replace("_"," ")
	object = Global.currentStorageStart+6

func _on_button_8_pressed():
	$Frame/Frame1/Button1.visible = false
	$Frame/Frame2/Button2.visible = false
	$Frame/Frame3/Button3.visible = false
	$Frame/Frame4/Button4.visible = false
	$Frame/Frame5/Button5.visible = false
	$Frame/Frame6/Button6.visible = false
	$Frame/Frame7/Button7.visible = false
	$Frame/Frame8/Button8.visible = false
	$Frame/Frame9/Button9.visible = false
	$Frame/Frame10/Button10.visible = false
	$Back/Back.visible = false
	$Information/ObjInformation.visible = false
	$Information.visible = true
	$Information/ObjName.text = Global.Card[Global.currentStorageStart+7][1].replace("_"," ")
	object = Global.currentStorageStart+7

func _on_button_9_pressed():
	$Frame/Frame1/Button1.visible = false
	$Frame/Frame2/Button2.visible = false
	$Frame/Frame3/Button3.visible = false
	$Frame/Frame4/Button4.visible = false
	$Frame/Frame5/Button5.visible = false
	$Frame/Frame6/Button6.visible = false
	$Frame/Frame7/Button7.visible = false
	$Frame/Frame8/Button8.visible = false
	$Frame/Frame9/Button9.visible = false
	$Frame/Frame10/Button10.visible = false
	$Back/Back.visible = false
	$Information/ObjInformation.visible = false
	$Information.visible = true
	$Information/ObjName.text = Global.Card[Global.currentStorageStart+8][1].replace("_"," ")
	object = Global.currentStorageStart+8

func _on_button_10_pressed():
	$Frame/Frame1/Button1.visible = false
	$Frame/Frame2/Button2.visible = false
	$Frame/Frame3/Button3.visible = false
	$Frame/Frame4/Button4.visible = false
	$Frame/Frame5/Button5.visible = false
	$Frame/Frame6/Button6.visible = false
	$Frame/Frame7/Button7.visible = false
	$Frame/Frame8/Button8.visible = false
	$Frame/Frame9/Button9.visible = false
	$Frame/Frame10/Button10.visible = false
	$Back/Back.visible = false
	$Information/ObjInformation.visible = false
	$Information.visible = true
	$Information/ObjName.text = Global.Card[Global.currentStorageStart+9][1].replace("_"," ")
	object = Global.currentStorageStart+9


func _on_cancel_button_pressed():
	$Information.visible = false
	$Information/ObjName.position = Vector2(-149,-95)
	$Information/ObjInformation.visible = false
	if Global.currentStorageStart < Global.CardAmount and Global.storage[Global.currentStorageStart] > 0:
		$Frame/Frame1/Button1.visible = true
	if Global.currentStorageStart+1 < Global.CardAmount and Global.storage[Global.currentStorageStart+1] > 0:
		$Frame/Frame2/Button2.visible = true
	if Global.currentStorageStart+2 < Global.CardAmount and Global.storage[Global.currentStorageStart+2] > 0:
		$Frame/Frame3/Button3.visible = true
	if Global.currentStorageStart+3 < Global.CardAmount and Global.storage[Global.currentStorageStart+3] > 0:
		$Frame/Frame4/Button4.visible = true
	if Global.currentStorageStart+4 < Global.CardAmount and Global.storage[Global.currentStorageStart+4] > 0:
		$Frame/Frame5/Button5.visible = true
	if Global.currentStorageStart+5 < Global.CardAmount and Global.storage[Global.currentStorageStart+5] > 0:
		$Frame/Frame6/Button6.visible = true
	if Global.currentStorageStart+6 < Global.CardAmount and Global.storage[Global.currentStorageStart+6] > 0:
		$Frame/Frame7/Button7.visible = true
	if Global.currentStorageStart+7 < Global.CardAmount and Global.storage[Global.currentStorageStart+7] > 0:
		$Frame/Frame8/Button8.visible = true
	if Global.currentStorageStart+8 < Global.CardAmount and Global.storage[Global.currentStorageStart+8] > 0:
		$Frame/Frame9/Button9.visible = true
	if Global.currentStorageStart+9 < Global.CardAmount and Global.storage[Global.currentStorageStart+9] > 0:
		$Frame/Frame10/Button10.visible = true
	$Back/Back.visible = true


func _on_use_button_pressed():
	if object > 1 and object < 4:
		Global.storage[object] -= 1
		if object == 2:
			Global.playerMaxHealth += 10
		elif object == 3:
			Global.playerSpeed += 5
	else:
		if Global.Card[object][1].contains("clothing_"):
			Global.Account["clothing"] = Global.Card[object][1]
		elif Global.Card[object][1].contains("accessory_"):
			Global.Account["accessory"] = Global.Card[object][1]
		elif Global.Card[object][1].contains("cat_"):
			Global.Account["cat"] = Global.Card[object][1]
	$Information.visible = false
	$Information/ObjName.position = Vector2(-149,-95)
	$Information/ObjInformation.visible = false
	
	if Global.currentStorageStart < Global.CardAmount and Global.storage[Global.currentStorageStart] > 0:
		$Frame/Frame1/Button1.visible = true
	if Global.currentStorageStart+1 < Global.CardAmount and Global.storage[Global.currentStorageStart+1] > 0:
		$Frame/Frame2/Button2.visible = true
	if Global.currentStorageStart+2 < Global.CardAmount and Global.storage[Global.currentStorageStart+2] > 0:
		$Frame/Frame3/Button3.visible = true
	if Global.currentStorageStart+3 < Global.CardAmount and Global.storage[Global.currentStorageStart+3] > 0:
		$Frame/Frame4/Button4.visible = true
	if Global.currentStorageStart+4 < Global.CardAmount and Global.storage[Global.currentStorageStart+4] > 0:
		$Frame/Frame5/Button5.visible = true
	if Global.currentStorageStart+5 < Global.CardAmount and Global.storage[Global.currentStorageStart+5] > 0:
		$Frame/Frame6/Button6.visible = true
	if Global.currentStorageStart+6 < Global.CardAmount and Global.storage[Global.currentStorageStart+6] > 0:
		$Frame/Frame7/Button7.visible = true
	if Global.currentStorageStart+7 < Global.CardAmount and Global.storage[Global.currentStorageStart+7] > 0:
		$Frame/Frame8/Button8.visible = true
	if Global.currentStorageStart+8 < Global.CardAmount and Global.storage[Global.currentStorageStart+8] > 0:
		$Frame/Frame9/Button9.visible = true
	if Global.currentStorageStart+9 < Global.CardAmount and Global.storage[Global.currentStorageStart+9] > 0:
		$Frame/Frame10/Button10.visible = true
	$Back/Back.visible = true


func _on_last_p_button_pressed():
	for i in range(len(storageTemp)):
		if storageTemp[i] and (Global.currentStorageStart+i < Global.CardAmount):
			Global.currentStorage = Global.currentStorageStart+i
			storageTemp[i].visible = false
	
	Global.currentStorageStart -= 10
	Global.currentStorage = Global.currentStorageStart - 1
	
	for k in range(2):
		if Global.currentStorage == Global.CardAmount:
			break
		for j in range(5):
			Global.cardsizeUnit = 18
			Global.currentStorage += 1
			
			if Global.currentStorage == Global.CardAmount:
				break
			#print(Global.currentStorage)###################################################
			storageTemp[k*5+j].visible = false
			storageTemp[k*5+j].visible = true
			
	if Global.currentStorageStart < Global.CardAmount and Global.storage[Global.currentStorageStart] > 0:
		$Frame/Frame1/Button1.visible = true
	if Global.currentStorageStart+1 < Global.CardAmount and Global.storage[Global.currentStorageStart+1] > 0:
		$Frame/Frame2/Button2.visible = true
	if Global.currentStorageStart+2 < Global.CardAmount and Global.storage[Global.currentStorageStart+2] > 0:
		$Frame/Frame3/Button3.visible = true
	if Global.currentStorageStart+3 < Global.CardAmount and Global.storage[Global.currentStorageStart+3] > 0:
		$Frame/Frame4/Button4.visible = true
	if Global.currentStorageStart+4 < Global.CardAmount and Global.storage[Global.currentStorageStart+4] > 0:
		$Frame/Frame5/Button5.visible = true
	if Global.currentStorageStart+5 < Global.CardAmount and Global.storage[Global.currentStorageStart+5] > 0:
		$Frame/Frame6/Button6.visible = true
	if Global.currentStorageStart+6 < Global.CardAmount and Global.storage[Global.currentStorageStart+6] > 0:
		$Frame/Frame7/Button7.visible = true
	if Global.currentStorageStart+7 < Global.CardAmount and Global.storage[Global.currentStorageStart+7] > 0:
		$Frame/Frame8/Button8.visible = true
	if Global.currentStorageStart+8 < Global.CardAmount and Global.storage[Global.currentStorageStart+8] > 0:
		$Frame/Frame9/Button9.visible = true
	if Global.currentStorageStart+9 < Global.CardAmount and Global.storage[Global.currentStorageStart+9] > 0:
		$Frame/Frame10/Button10.visible = true


func _on_next_p_button_pressed():
	for i in range(len(storageTemp)):
		if storageTemp[i] and (Global.currentStorageStart+i < Global.CardAmount):
			Global.currentStorage = Global.currentStorageStart+i
			storageTemp[i].visible = false
	
	Global.currentStorageStart += 10
	Global.currentStorage = Global.currentStorageStart - 1
	
	for k in range(2):
		if Global.currentStorage == Global.CardAmount:
			break
		for j in range(5):
			Global.cardsizeUnit = 18
			Global.currentStorage += 1
			
			if Global.currentStorage == Global.CardAmount:
				break
			#print(Global.currentStorage)###################################################
			storageTemp[k*5+j].visible = true
			
	if Global.currentStorageStart < Global.CardAmount and Global.storage[Global.currentStorageStart] > 0:
		$Frame/Frame1/Button1.visible = true
	if Global.currentStorageStart+1 < Global.CardAmount and Global.storage[Global.currentStorageStart+1] > 0:
		$Frame/Frame2/Button2.visible = true
	if Global.currentStorageStart+2 < Global.CardAmount and Global.storage[Global.currentStorageStart+2] > 0:
		$Frame/Frame3/Button3.visible = true
	if Global.currentStorageStart+3 < Global.CardAmount and Global.storage[Global.currentStorageStart+3] > 0:
		$Frame/Frame4/Button4.visible = true
	if Global.currentStorageStart+4 < Global.CardAmount and Global.storage[Global.currentStorageStart+4] > 0:
		$Frame/Frame5/Button5.visible = true
	if Global.currentStorageStart+5 < Global.CardAmount and Global.storage[Global.currentStorageStart+5] > 0:
		$Frame/Frame6/Button6.visible = true
	if Global.currentStorageStart+6 < Global.CardAmount and Global.storage[Global.currentStorageStart+6] > 0:
		$Frame/Frame7/Button7.visible = true
	if Global.currentStorageStart+7 < Global.CardAmount and Global.storage[Global.currentStorageStart+7] > 0:
		$Frame/Frame8/Button8.visible = true
	if Global.currentStorageStart+8 < Global.CardAmount and Global.storage[Global.currentStorageStart+8] > 0:
		$Frame/Frame9/Button9.visible = true
	if Global.currentStorageStart+9 < Global.CardAmount and Global.storage[Global.currentStorageStart+9] > 0:
		$Frame/Frame10/Button10.visible = true

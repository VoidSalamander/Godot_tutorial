extends Node2D

var StorageUnit = preload("res://Storage/StorageUnit.tscn")
var storageTemp = []
var CardSize


func _ready():
	$Information.visible = false
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
			var cardPosition = Vector2( 0, 0)
			cardPosition = Vector2( 104+205*j , 110+200*k )
			CardSize = Vector2(Global.cardsizeUnit*7,Global.cardsizeUnit*7)
			
			storageTemp[k*5+j] = StorageUnit.instantiate()
			storageTemp[k*5+j].position = cardPosition
			storageTemp[k*5+j].visible = false
			storageTemp[k*5+j].scale = CardSize / storageTemp[k*5+j].size
			$Object.add_child(storageTemp[k*5+j])
			storageTemp[k*5+j].visible = true
				
	
func _process(delta):
	if Global.storage[Global.currentStorageStart] > 0:
		$Frame/Frame1/Amount.text = str(Global.storage[Global.currentStorageStart])
	if Global.storage[Global.currentStorageStart+1] > 0:
		$Frame/Frame2/Amount.text = str(Global.storage[Global.currentStorageStart+1])
	if Global.storage[Global.currentStorageStart+2] > 0:
		$Frame/Frame3/Amount.text = str(Global.storage[Global.currentStorageStart+2])
	if Global.storage[Global.currentStorageStart+3] > 0:
		$Frame/Frame4/Amount.text = str(Global.storage[Global.currentStorageStart+3])
	if Global.storage[Global.currentStorageStart+4] > 0:
		$Frame/Frame5/Amount.text = str(Global.storage[Global.currentStorageStart+4])
	if Global.storage[Global.currentStorageStart+5] > 0:
		$Frame/Frame6/Amount.text = str(Global.storage[Global.currentStorageStart+5])
	if Global.storage[Global.currentStorageStart+6] > 0:
		$Frame/Frame7/Amount.text = str(Global.storage[Global.currentStorageStart+6])
	if Global.storage[Global.currentStorageStart+7] > 0:
		$Frame/Frame8/Amount.text = str(Global.storage[Global.currentStorageStart+7])
	if Global.storage[Global.currentStorageStart+8] > 0:
		$Frame/Frame9/Amount.text = str(Global.storage[Global.currentStorageStart+8])
	if Global.storage[Global.currentStorageStart+9] > 0:
		$Frame/Frame10/Amount.text = str(Global.storage[Global.currentStorageStart+9])


func _on_back_pressed():
	for i in range(10):
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
	$Information.visible = true
	$Information/ObjName.text = Global.Card[Global.currentStorageStart+9][1].replace("_"," ")
	object = Global.currentStorageStart+9


func _on_cancel_button_pressed():
	$Information.visible = false
	$Frame/Frame1/Button1.visible = true
	$Frame/Frame2/Button2.visible = true
	$Frame/Frame3/Button3.visible = true
	$Frame/Frame4/Button4.visible = true
	$Frame/Frame5/Button5.visible = true
	$Frame/Frame6/Button6.visible = true
	$Frame/Frame7/Button7.visible = true
	$Frame/Frame8/Button8.visible = true
	$Frame/Frame9/Button9.visible = true
	$Frame/Frame10/Button10.visible = true
	$Back/Back.visible = true


func _on_use_button_pressed():
	if object > 1 and object < 4:
		Global.storage[object] -= 1
	else:
		pass
	$Information.visible = false
	$Frame/Frame1/Button1.visible = true
	$Frame/Frame2/Button2.visible = true
	$Frame/Frame3/Button3.visible = true
	$Frame/Frame4/Button4.visible = true
	$Frame/Frame5/Button5.visible = true
	$Frame/Frame6/Button6.visible = true
	$Frame/Frame7/Button7.visible = true
	$Frame/Frame8/Button8.visible = true
	$Frame/Frame9/Button9.visible = true
	$Frame/Frame10/Button10.visible = true
	$Back/Back.visible = true

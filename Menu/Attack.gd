extends Sprite2D

var newDeltaX
var newDeltaY
var deltaX
var deltaY
var touchPos = Vector2()
var areaEnt = false
 
func _ready():
	#set_position(Vector2(attack_position[0]+11, attack_position[1]+11))
	pass
	

func _on_touch_screen_button_pressed():
	areaEnt = true

func _on_touch_screen_button_released():
	areaEnt = false
	
func _input(event):
	if areaEnt == true:
		if event is InputEventScreenTouch and event.is_pressed():
			touchPos = event.get_position()
			deltaX = touchPos.x - position.x
			deltaY = touchPos.y - position.y
			
		elif  event is InputEventScreenDrag:
			touchPos = event.get_position()
			newDeltaX = touchPos.x - deltaX
			newDeltaY = touchPos.y - deltaY
			if newDeltaX  < get_viewport_rect().size.x *0.825 and newDeltaY  > get_viewport_rect().size.y *0.695 and newDeltaX  > get_viewport_rect().size.x *0.54:
				if position.x > get_viewport_rect().size.x *0.825:
					set_position(Vector2(position.x, newDeltaY))
				elif position.y < get_viewport_rect().size.y *0.695:
					set_position(Vector2(newDeltaX, position.y))
			elif newDeltaX  <= get_viewport_rect().size.x *0.54:
				if newDeltaY <= get_viewport_rect().size.y *0.695:
					set_position(Vector2(position.x, newDeltaY))
			else:
				set_position(Vector2(newDeltaX, newDeltaY))
				

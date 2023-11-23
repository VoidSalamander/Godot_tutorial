extends CharacterBody2D

@export var speed: int = 35
@onready var animations = $AnimationPlayer

var item_num = 0
var health = 5

func handle_input():
	var mone_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = mone_direction*speed
	
			
func updatAnimation():
	
	if(velocity.length() == 0): 
		if(animations.is_playing()): animations.stop()
	else:
		var direction = "down"
		if(velocity.y < 0): direction = "up"
		elif(velocity.x < 0): direction = "left"
		elif(velocity.x > 0): direction = "right"
		animations.play("walk_" + direction)
	
func _physics_process(delta):
	handle_input()
	move_and_slide()
	updatAnimation()

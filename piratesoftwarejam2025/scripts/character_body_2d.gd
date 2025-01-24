extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

var alive = true
const SPEED = 200
const JUMP_VELOCITY = -200.0


func _physics_process(delta: float) -> void:
	# Add gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if alive == true:
		var direction := Input.get_axis("move_left", "move_right")
		move(direction)
		flip(direction)
	elif alive == false:
		velocity.x = 0
		animated_sprite.modulate = Color(1,0.33,0.33,1)
		
	
	move_and_slide()

func player():
	pass #function check whether a body is the player
func move(direction):
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
func flip(direction):
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false
		

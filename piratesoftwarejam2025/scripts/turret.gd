extends Node2D
@onready var node_2d = $Node2D
@onready var barrel = $Barrel
@onready var marker_2d = $Node2D/Marker2D

const bulletPath = preload("res://Scenes/bullet.tscn")
var bulletSpeed = 50
var bodyEntered = false
var newBody
var fireRate = 2000000 # This seems very inefficient
var counter = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bodyEntered == true:
		barrel.look_at(newBody.position) # default look_at() is 90 degrees off
		barrel.rotate(3*TAU/4) # TAU == 2pi radians
		if counter >= fireRate*delta:
			fire()
		else:
			counter += 1
	pass

func _on_area_2d_body_entered(body):
	newBody = body
	if body.has_method("player"):
		bodyEntered = true
	
func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		bodyEntered = false
	

func fire():
	counter = 0
	print("FIRE!")
	newBody.position
	
	 
	#newBody.position * bulletSpeed
	var bulletInstance = bulletPath.instantiate()
	add_child(bulletInstance)
	bulletInstance.position = marker_2d.position
	# rotate the starting position to be looking at the player
	node_2d.look_at(newBody.position)
	node_2d.rotate(3*TAU/4)
	bulletInstance.velocity = newBody.position - bulletInstance.position
	#bulletInstance.velocity.x = move_toward(newBody.position.x, 0, bulletSpeed)
	#bulletInstance.velocity.y = move_toward(newBody.position.y, 0, bulletSpeed)  
	#bulletInstance.move_and_slide()

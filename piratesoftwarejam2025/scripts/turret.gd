extends Node2D
@onready var BulletSpawn = $BulletSpawn
@onready var barrel = $Barrel
@onready var marker_2d = $BulletSpawn/Marker2D
@onready var barrel_2 = $Barrel/Barrel2

const bulletPath = preload("res://Scenes/bullet.tscn")
var bulletSpeed = 50
var bodyEntered = false
var newBody
var fireRate = 2000000 # This seems very inefficient
var counter = 0
func _process(delta):
	if bodyEntered == true:
		barrel.look_at(newBody.position) # default look_at() is 90 degrees off
		barrel.rotate(3*TAU/4) # TAU == 2pi radians
		if counter >= fireRate*delta:
			fire()
		else:
			counter += 1

func _on_area_2d_body_entered(body):
	newBody = body
	if body.has_method("player"):
		bodyEntered = true
	
func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		bodyEntered = false

func fire():
	counter = 0
	var bullet = bulletPath.instantiate()
	add_child(bullet)
	bullet.global_position = marker_2d.global_position
	# rotate the turret barrel to be looking at the player
	BulletSpawn.look_at(newBody.position)
	BulletSpawn.rotate(3*TAU/4)
	bullet.look_at(newBody.position)
	bullet.rotate(3*TAU/4)
	bullet.velocity = newBody.global_position - bullet.global_position
	barrel_2.play("fire")

	

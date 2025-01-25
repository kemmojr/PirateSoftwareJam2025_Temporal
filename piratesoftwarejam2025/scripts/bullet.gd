extends CharacterBody2D

var bulletVelocity = Vector2(0, 0)
var bulletSpeed = 5000

func _physics_process(delta):
		velocity = velocity.normalized() * delta * bulletSpeed
		move_and_slide()

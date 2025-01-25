extends Node2D

@onready var static_body_2d = $StaticBody2D
@onready var gate = $Gate
@onready var anchor = $Anchor
var newBody
var entered = false

func _ready(): 
	await get_tree().create_timer(0.1).timeout # wait a second for the other assets to load in
	static_body_2d.position.y = -33
	gate.speed_scale = 1
	gate.play("default")
	entered = false
	
func _on_area_2d_body_entered(body): # used _body because body is not used within the method
	static_body_2d.position.y = 0
	gate.speed_scale = -1 # play the animation in reverse to close the gate
	gate.play("default")
	newBody = body
	entered = true
	
func _on_area_2d_body_exited(_body):
	static_body_2d.position.y = -33
	gate.speed_scale = 1 
	gate.play("default")
	entered = false
	
func _process(delta):	
	if entered == true:
		anchor.look_at(newBody.position)

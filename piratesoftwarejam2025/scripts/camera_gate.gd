extends Node2D

@onready var static_body_2d = $StaticBody2D

func _ready(): 
	await get_tree().create_timer(1).timeout # wait a second for the other assets to load in
	static_body_2d.position.y = -33

func _on_area_2d_body_entered(_body): # used _body because body is not used within the method
	static_body_2d.position.y = 0
	
func _on_area_2d_body_exited(_body):
	static_body_2d.position.y = -33

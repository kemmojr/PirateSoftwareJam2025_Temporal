extends Area2D

@onready var timer = $"Respawn Timer"


func _on_body_entered(body):
	if body.has_method("player"):
		body.alive = false	# disables player controls
		timer.start() # respawn timer		
	elif body.has_method("enemy"): # if an enemy
		body.queue_free()

func _on_respawn_timer_timeout():
	get_tree().reload_current_scene()
	

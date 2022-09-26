extends KinematicBody2D

func _on_stompdetector_body_entered(body):
	if body.global_position.y > get_node("stompdetector").global_position.y:
		return
	get_node("CollisionShape2D").disabled = true	
	queue_free()
			

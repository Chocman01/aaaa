extends PlayerState2


func enter() -> void:
	playerr.animation_state.travel("run")


func exit() -> void:
	pass
	
	

func physics_update(delta: float) -> void:

	if not playerr.is_on_floor():
		if playerr.velocity.y > 0:
			state_machine.transition_to("Fall")
			return

	var input_direction_x: float = (
		Input.get_action_strength("move_left") 
		- Input.get_action_strength("move_right")
	)

	# Keep left or keep right if left and right are pressed together
	if Input.get_action_strength("move_right") && \
		Input.get_action_strength("move_left") :
		if playerr.direction == "right":
			input_direction_x = 1
		else:
			input_direction_x = -1



	playerr.update_direction(input_direction_x)
	playerr.velocity.x = playerr.walk_speed * input_direction_x
	playerr.apply_gravity(delta)
#	playerr.velocity = playerr.move_and_slide(playerr.velocity, Vector2.UP)
	playerr.velocity = playerr.move_and_slide(playerr.velocity, Vector2.UP)
	
	
	# handle collisions in future tutorial

				
	# handle other transitions
	if Input.is_action_just_pressed("move_up"):
		state_machine.transition_to("Jump")
	elif is_equal_approx(input_direction_x, 0.0):
		state_machine.transition_to("Idle")

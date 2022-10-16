extends PlayerState2
# Step 3 (all the different states, idle, walk, fall, etc.)
# The actual isolated/encapsulated state node with code only relevant to the state

# Overrides the function you see in State.gd
func enter() -> void:
	playerr.velocity.x = 0
	playerr.animation_state.travel("idle")

# Overrides the function you see in State.gd
func exit() -> void:
	pass
	
	
# Overrides the function you see in State.gd
func physics_update(delta: float) -> void:

	if not playerr.is_on_floor():
		if playerr.velocity.y > 0:
			state_machine.transition_to("Fall")
			return
			
	elif Input.is_action_pressed("move_left") or \
		Input.is_action_pressed("move_right"):
		state_machine.transition_to("Run")
		
	playerr.apply_gravity(delta)
#	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	playerr.velocity = playerr.move_and_slide_with_snap(playerr.velocity, 
														playerr.snap_vector, 
														Vector2.UP, 
														true, 
														4, 
														playerr.floor_max_angle,
														false)
	if Input.is_action_just_pressed("move_up"):
		state_machine.transition_to("Jump")

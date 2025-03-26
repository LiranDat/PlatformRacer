extends CharacterBody3D

func _physics_process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("P1Jump"):
		velocity.y = 10.0
	velocity.y += get_gravity().y*delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var verticalDirection := Input.get_axis("P1Left", "P1Right")
	velocity.x = move_toward(velocity.x,verticalDirection*10.0, 10.0)
	var horizontalDireciton = Input.get_axis("P1Up", "P1Down")
	velocity.z = move_toward(velocity.z,horizontalDireciton*10.0, 10.0)
	#Wind in between player and body, affect by wind
	move_and_slide()

func _process(delta: float) -> void:
	pass

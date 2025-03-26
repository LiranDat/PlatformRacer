extends CharacterBody3D

func _physics_process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("up"):
		velocity.y = 10.0
	if Input.is_action_pressed("up"):
		velocity.y -= get_gravity().y/2.0*delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	velocity.x = move_toward(velocity.x,direction*10.0, 10.0)
	#Wind in between player and body, affect by wind
	move_and_slide()

func _process(delta: float) -> void:
	pass

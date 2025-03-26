extends CharacterBody3D

@export var movementCamera : Camera3D

var timer = 60

func _physics_process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("P1Jump"):
		velocity.y = 5.0
	velocity.y += get_gravity().y*delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector3(Input.get_axis("P1Down","P1Up"),0.0,Input.get_axis("P1Left", "P1Right")).rotated(Vector3(0.0,1.0,0.0),movementCamera.rotation.y)
	#horizontalDirection = movementCamera.get_camera_transform()*verticalDirection
	velocity += direction*10.0*delta
	#velocity.z = move_toward(velocity.z,horizontalDireciton*10.0, 0.5)
	#Wind in between player and body, affect by wind
	if(move_and_slide()):
		var collider = get_slide_collision(0).get_collider(0)
		reparent(collider,true)
	pass
func _process(delta: float) -> void:
	# timer läuft runter und modifiziert die länge vom balken
	timer -= 1*delta
	print(timer)
	$timer.scale.x = 0.5 * timer / 60

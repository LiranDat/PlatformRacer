extends CharacterBody3D

@export var movementCamera : Camera3D

const ROTATION_SPEED = 10.0
const VELOCITY_MULTIPLIER = 10.0
const MAX_SPEED = 6.0
const BRAKE_FACTOR_GROUND = 10.0
const BRAKE_FACTOR_AIR = 2.0
var timer = 60
var last_direction = Vector3.FORWARD

func _physics_process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("P1Jump") and is_on_floor():
		velocity.y = 3.0
	velocity.y += get_gravity().y*delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector3(Input.get_axis("P1Left", "P1Right"),0.0,Input.get_axis("P1Up","P1Down")).rotated(Vector3(0.0,1.0,0.0),movementCamera.global_rotation.y).normalized()
	if(direction):
		last_direction = direction
		velocity = velocity + direction*delta*VELOCITY_MULTIPLIER
	else:
		var velocityXZ = Vector3(1.0,0.0,1.0)*velocity
		if(is_on_floor()):
			velocity -= velocityXZ.normalized()*BRAKE_FACTOR_GROUND*delta
		else:
			velocity -= velocityXZ.normalized()*BRAKE_FACTOR_AIR*delta
	rotation.y = lerp_angle(rotation.y,atan2(last_direction.x, last_direction.z),delta * ROTATION_SPEED)
	#horizontalDirection = movementCamera.get_camera_transform()*verticalDirection
	
	if(velocity.length()>= MAX_SPEED):
		velocity = velocity.normalized()*MAX_SPEED
	
	#velocity.z = 
	#Reparent node to get affected by transformations of ground
	if(move_and_slide()):
		var collider = get_slide_collision(0).get_collider(0)
	pass
	
func _process(delta: float) -> void:
	# timer läuft runter und modifiziert die länge vom balken
	timer -= 1*delta
	$Timer.scale.x = 0.5 * timer / 60

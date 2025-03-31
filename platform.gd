extends Node3D
@export var platformSpeed : float = 1.0 
@export var platformPath : PathFollow3D

var previousPosition : Vector3
var platformVelocity : Vector3

const MAX_OFFSET = 2.0
const OFFSET_SPEED = 1.0
var platformOffset = 0.0
func _ready() -> void:
	previousPosition = global_position
	pass
	
func _process(delta: float) -> void:
	if(platformPath):
		platformPath.progress += platformSpeed * delta
	if($Button.active):
		platformOffset -= OFFSET_SPEED*delta
	if($Button2.active):
		platformOffset += OFFSET_SPEED*delta
	if(abs(platformOffset)>MAX_OFFSET):
		platformOffset = MAX_OFFSET*sign(platformOffset)
	platformPath.get_child(0).position.x = platformOffset
	pass

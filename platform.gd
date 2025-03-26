extends Node3D
@export var platformSpeed : float = 1.0 
@export var platformPath : PathFollow3D

var previousPosition : Vector3
var platformVelocity : Vector3

func _ready() -> void:
	previousPosition = global_position
	pass
	
func _process(delta: float) -> void:
	if(platformPath):
		platformPath.progress += platformSpeed * delta
	platformVelocity = global_position-previousPosition
	previousPosition = global_position
	pass

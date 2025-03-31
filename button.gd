extends Node3D

@export var active : bool

func _process(delta):
	if($Button/Area3D.get_overlapping_bodies()):
		active = true
	else:
		active = false
	$Button/OmniLight3D.omni_range = float(active) * 10.0

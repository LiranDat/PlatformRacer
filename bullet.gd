extends MeshInstance3D
@export var velocity = 1.0
@export var power = 10.0
@export var lifetime = 5.0

func _ready():
	$Timer.start(lifetime)

func _process(delta):
	self.position += velocity * Vector3(0.0,0.0,1.0) * delta
	if($Area3D.get_overlapping_bodies()):
		var body = $Area3D.get_overlapping_bodies()[0]
		body.velocity += global_basis.y * power
		self.queue_free()


func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.

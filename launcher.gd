extends Node3D
var bulletScene = preload("res://bullet.tscn")
@export var bulletDelay = 1.0
@export var bulletSpeed = 5.0
@export var bulletPower = 10.0

func _ready():
	$Timer.wait_time=bulletDelay
	
func _on_timer_timeout():
	var bullet = bulletScene.instantiate()
	bullet.power = bulletPower
	bullet.velocity = bulletSpeed
	self.add_child(bullet)
	pass # Replace with function body.

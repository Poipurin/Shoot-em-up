extends Area2D


var speed = 600

func _physics_process(delta):
	position.y -= delta * speed

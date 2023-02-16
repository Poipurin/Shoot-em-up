extends Area2D


var speed = 600

var bullet_status = 0

func _physics_process(delta):
	position.y -= delta * speed
	if bullet_status == 0:
		$PlayerBullets.animation = "spawn"
		if $PlayerBullets.animation_finished() == true:
			bullet_status = 1
	if bullet_status == 1:	
		$PlayerBullets.animation = "idle"

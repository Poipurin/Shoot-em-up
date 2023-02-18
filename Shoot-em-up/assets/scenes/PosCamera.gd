extends Position2D


export(int) var speed: int = 20

func _physics_process(delta):
	if Input.is_action_pressed("move_up"):
		position.y -= speed * delta
	elif Input.is_action_pressed("move_down"):
		position.y += speed * delta
	elif Input.is_action_pressed("move_left"):
		position.x -= speed * delta
	elif Input.is_action_pressed("move_right"):
		position.y -= speed * delta
	print(position)

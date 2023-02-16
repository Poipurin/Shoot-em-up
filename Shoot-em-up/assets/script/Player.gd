extends KinematicBody2D
signal hit

export var speed = 400 
var screen_size
var movement = Vector2.ZERO
var Bullet = preload("res://assets/scenes/bullets.tscn")
var canShoot = true
onready var spawn = $Spawn

func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(240, 600)
	
func _physics_process(delta):
	var velocity = Vector2.ZERO 
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	elif Input.is_action_pressed("move_left"):
		velocity.x -= 1
	elif Input.is_action_pressed("move_down"):
		velocity.y += 1
	elif Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
		position += velocity * delta
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
		$AnimatedSprite.animation = "fly"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = false
		
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_Player_body_entered(body):
	emit_signal("hit")
	
	movement = movement.normalized()
	move_and_slide(movement * speed)
	
func _on_ShootSpeed_timeout():
	canShoot = true
	
func _process(delta):
	if	Input.is_action_pressed("shoot") and canShoot:
		shoot()
		
func shoot():
	var bullet = Bullet.instance()
	bullet.position = spawn.global_position
	get_tree().current_scene.add_child(bullet)
	
	$ShootSpeed.start()
	canShoot = false
	

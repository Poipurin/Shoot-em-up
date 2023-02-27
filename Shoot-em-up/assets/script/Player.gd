extends KinematicBody2D
signal hit

var screen_size
var movement = Vector2.ZERO
var health = 3
export var bulletScene : PackedScene
export var speed = 400 

	
	
func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(240, 600)
	$AnimationPlayer.play("RedScarf")
	
func _physics_process(delta):
	var velocity = Vector2.ZERO 
	if Input.is_action_pressed("move_right"):
		$AnimationPlayer.play("RSRight")
		velocity.x += 1	
	elif Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$AnimationPlayer.play("RSLeft")
	else:
		$AnimationPlayer.play("RedScarf")
		
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		position += velocity * delta
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
		print(position)
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
func _on_Player_body_entered(body):
	emit_signal("hit")
	
	movement = movement.normalized()
	move_and_slide(movement * speed)
	
func _unhandled_input(event):
	if (event.is_action_pressed("shoot")):
		var bullet = bulletScene.instance() as Node2D
		get_parent().add_child(bullet)
		bullet.global_position = self.global_position
		bullet.direction = Vector2(0, -1)

func player_hit():
	health -= 1
	if health == 0:
		$AnimationPlayer.play("RSEscape")
		queue_free()

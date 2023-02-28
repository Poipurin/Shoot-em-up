extends KinematicBody2D

var player = null
var velocity = Vector2(0, 0)
var speed = 40
var screen_size
var Bullet = preload ("res://assets/scenes/CloudBullet.tscn")
var canshoot = true
export var health = 6

func _ready():
	$AnimationPlayer.play("IdleCloud")
	velocity.x = +speed
	screen_size = get_viewport_rect().size
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

		
func _physics_process(delta):
	move_character()
	position += velocity * delta
	
func move_character():
	if position.x > 220:
		velocity.x = -speed
	elif position.x < -210:
		velocity.x = +speed
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func _on_Detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		$ShootSpeed.start()
		print(player)
		
func _on_ShootSpeed_timeout():
	canshoot = true
	if player != null:
		$AnimationPlayer.play("PreparingA")
		shoot()
	
func shoot():
	if canshoot:
		var bullet = Bullet.instance()
		bullet.position = $Cloud.position
		get_parent().add_child(bullet)
		$AnimationPlayer.play("Attack")
		
		canshoot = false
		
func enemy_hit():
	health -=1
	if health == 0:
		$AnimationPlayer.play("Death")

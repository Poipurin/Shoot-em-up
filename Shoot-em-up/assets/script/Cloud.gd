extends KinematicBody2D

var player = null
var velocity = Vector2(0, 0)
var speed = 40
var screen_size


func _ready():
	$AnimationPlayer.play("IdleCloud")
	velocity.x = +speed
	screen_size = get_viewport_rect().size
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		
func _process(delta):
	move_character()
	
	
func move_character():
	if position.x > 220:
		velocity.x = -speed
	elif position.x < -210:
		velocity.x = +speed
	
	
	velocity = move_and_slide(velocity, Vector2.UP)

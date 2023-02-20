extends KinematicBody2D

var player = null
var velocity = Vector2(0, 0)
var speed = 32
var gravity = 2

func _ready():
	$AnimationPlayer.play("idle")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		
func _process(delta):
	move_character()
	
func move_character():
	velocity.x = -speed
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)

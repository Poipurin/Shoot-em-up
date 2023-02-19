extends KinematicBody2D

var player = null
var velocity = Vector2()
export var idleCloud : PackedScene

func _ready():
	pass
	#anim_state = animState.idle
	#$AnimatedSprite.play("idle")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		
func _process(delta):
	var idle = idleCloud.instance() as Node2D
	get_parent().add_child(idle)
	queue_free()

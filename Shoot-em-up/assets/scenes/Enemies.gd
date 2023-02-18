extends KinematicBody2D

var player = null
var velocity = Vector2()
export var speed = 2
export var eDirection = 1

enum animState{
	attack,
	death,
	idle,
	loadingAttack,
}

var anim_state = null

func _ready():
	anim_state = animState.idle
	$AnimatedSprite.play("idle")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		
func _physics_process(delta):
	move_char()
	
func move_char():
	velocity.y += 0
	velocity.x = speed * eDirection
	velocity = move_and_slide(velocity,Vector2.RIGHT)
	if player:
		anim_state = animState.loadingAttack
		$AnimatedSprite.play("loadingAttack")
	#	movement = position.direction_to(player.position) * speed
	#	movement = move_and_collide(movement)



func _on_AnimatedSprite_animation_finished():
	if (anim_state == animState.loadingAttack):
		anim_state = animState.attack
		$AnimatedSprite.play("attack")
	elif (anim_state == animState.attack):
			_ready()

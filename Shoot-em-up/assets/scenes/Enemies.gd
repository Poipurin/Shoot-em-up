extends KinematicBody2D

var player = null

export var speed = 2

func _ready():
	$AnimatedSprite.playing = true
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	#$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body
func _physics_process(delta):
	var movement = Vector2(-2, 0)
	
	if player:
		movement = position.direction_to(player.position) * speed
		movement = move_and_collide(movement)

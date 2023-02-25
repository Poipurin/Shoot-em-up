extends KinematicBody2D


var speed = 600
export var bulletImpact : PackedScene
var direction = Vector2.UP

func _ready():
	$AnimationPlayer.play("idlebullet")
	
func _process(delta):
	var collisionResult = move_and_collide(direction * speed * delta)
	if collisionResult != null:
		var impact = bulletImpact.instance() as Node2D
		get_parent().add_child(impact)
		impact.global_position = collisionResult.position
		queue_free()

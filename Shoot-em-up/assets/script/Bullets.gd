extends Area2D


var speed = 600
export var bulletImpact : PackedScene
var direction = Vector2.UP

func _ready():
	$AnimationPlayer.play("idlebullet")
	
func _physics_process(delta):
	position.y -= delta * speed
	
	
func _on_Bullet_body_entered(body):
	if body.has_method("enemy_hit"):
		body.enemy_hit()
		var impact = bulletImpact.instance() as Node2D
		get_parent().add_child(impact)
		impact.global_position = position
		queue_free()

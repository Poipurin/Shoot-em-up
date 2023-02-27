extends Area2D

var speed = 400

func _ready():
	$AnimationPlayer.play("shoot")

func _physics_process(delta):
	position.y -= delta * speed



func _on_CloudBullet_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit()
		queue_free()



func _on_Despawnbullet_timeout():
	queue_free()

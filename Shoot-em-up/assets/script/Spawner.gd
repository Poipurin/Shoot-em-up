extends Node2D

export var bulletScene : PackedScene

func _ready():
	pass

func _unhandled_input(event):
	if (event.is_action_pressed("shoot")):
		var bullet = bulletScene.instance() as Node2D
		get_parent().add_child(bullet)
		bullet.global_position = self.global_position

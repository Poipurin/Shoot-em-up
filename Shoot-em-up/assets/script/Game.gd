extends Node2D



func _ready():
	pass # Replace with function body.


func new_game():
	#score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()



extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func new_game():
	#score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

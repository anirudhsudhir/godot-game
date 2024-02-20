extends Area2D


@onready var game_manager = %GameManager

func _on_body_entered(body):
	if (body.name == "RedCar") and (body.velocity.x<0):
		game_manager.increment_laps_car1()
	if (body.name == "BlueCar") and (body.velocity.x<0):
		game_manager.increment_laps_car2()
	if (game_manager.laps_car1>5 or game_manager.laps_car2 > 5):
		if (game_manager.laps_car1 > game_manager.laps_car2):
			game_manager.winner = "car1"
		else:
			game_manager.winner = "car2"
		get_tree().change_scene_to_file("res://scenes/finish.tscn")	


extends CharacterBody2D

@onready var game_manager = %GameManager

@export var speed = 300
@export var rotation_speed = 2

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("left", "right")
	var new_velocity = transform.x * Input.get_axis("up", "down") * speed
	game_manager.increment_car1_distance(abs(new_velocity-velocity))
	velocity = new_velocity

func _physics_process(delta):
	get_input()
	game_manager.check_drs()
	if (Input.is_action_just_pressed("ui_accept")):
		game_manager.use_drs("car1")
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()

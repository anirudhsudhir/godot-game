extends Node

@onready var laps_label = %LapsLabel
@onready var car2 = %BlueCar
@onready var car1 = %RedCar

var laps_car1 = 0
var laps_car2 = 0

var dist_car1 = 0
var dist_car2 = 0

var car1_has_drs = false
var car2_has_drs = false

var winner = ""

#var car1_drs_timeout = false
#var car2_drs_timeout = false

func print_data_label():
	var temp = "Current Lap\n"+"Car 1: " + str(laps_car1) + "\nCar 2: " + str(laps_car2) + "\nCar 1 DRS: " + str(car1_has_drs) + "\nCar 2 DRS: " + str(car2_has_drs)
	laps_label.text = temp
		
func increment_laps_car1():
	laps_car1 += 1
	print_data_label()

func increment_laps_car2():
	laps_car2 += 1
	print_data_label()
	
func increment_car1_distance(distance):
	dist_car1 += distance.x + distance.y
	
func increment_car2_distance(distance):
	dist_car2 += distance.x + distance.y
	
func check_drs():
	if (abs(dist_car1-dist_car2) >= 100000):
#		if (dist_car1>dist_car2) and (car1_drs_timeout == false):
		if (dist_car1>dist_car2):
			car2_has_drs = true
			print_data_label()
#	elif (dist_car2>dist_car1) and (car2_drs_timeout == false):
		else:
			car1_has_drs = true
			print_data_label()

func use_drs(car):
	if (car == "car1") and (car1_has_drs):
		print("car1 got drs")
		car1.speed = 600
		set_drs_timer(car)
	elif (car == "car2") and (car2_has_drs):
		print("car2 got drs")
		car2.speed = 600
		set_drs_timer(car)
		
func set_drs_timer(car):
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.autostart = false
	timer.wait_time = 3.0
	if (car  == "car1"):
		timer.timeout.connect(end_drs_timer_car1)
	else:
		timer.timeout.connect(end_drs_timer_car2)
	timer.start()
	
func end_drs_timer_car1():
	car1.speed = 300
	car1_has_drs = false
#	car1_drs_timeout = true
	print_data_label()
#	timeout_drs("car1")
	
func end_drs_timer_car2():
	car2.speed = 300
	car2_has_drs = false
#	car2_drs_timeout = true
	print_data_label()
#	timeout_drs("car2")
	
#func timeout_drs(car):
#	var timer: Timer = Timer.new()
#	add_child(timer)
#	timer.autostart = false
#	timer.wait_time = 15.0
#	if (car  == "car1"):
#		timer.timeout.connect(end_timeout_drs_car1)
#	else:
#		timer.timeout.connect(end_timeout_drs_car2)
#	timer.start()
	
#func end_timeout_drs_car1():
#	car1_drs_timeout = false
	
#func end_timeout_drs_car2():
#	car2_drs_timeout = false
	
	

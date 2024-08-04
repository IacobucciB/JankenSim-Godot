extends Node

func _ready():
	print("Global Variables Init")

# Time variables
var hours: int = 0
var minutes: int = 0
var seconds: int = 0
var days: int = 0

# Time constants
const SECONDS_IN_MINUTE: int = 60
const MINUTES_IN_HOUR: int = 60
const HOURS_IN_DAY: int = 24

func advance_time(hours_to_advance: int, minutes_to_advance):
	minutes = minutes + minutes_to_advance
	hours = hours + hours_to_advance + int(minutes / MINUTES_IN_HOUR)
	minutes = minutes % MINUTES_IN_HOUR
	if hours >= HOURS_IN_DAY:
		days = days + int(hours / HOURS_IN_DAY)
		hours = hours % HOURS_IN_DAY
	seconds = 0
	
func set_time(new_hour: int, new_minute: int):
	hours = new_hour % HOURS_IN_DAY
	minutes = minutes % MINUTES_IN_HOUR
	seconds = 0

func get_formatted_time():
	var hours_str = str(hours).pad_zeros(2)
	var minutes_str = str(minutes).pad_zeros(2)
	return "Dia %d\n %s:%s" % [days, hours_str, minutes_str]
	

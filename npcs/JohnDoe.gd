extends Node

var john_gold = 0
var time_john = 0

var current_state = 'Sleep'


func _ready():
	var time_manager = get_node("/root/Global")

func receive_message(message: String):
	print(message)
	
func update_fsm():
	if current_state == 'Play':
		john_gold = john_gold + 5
		if time_john == 20:
			current_state = 'Sleep'
	if current_state == 'Sleep':
		if time_john == 8:
			current_state = 'Play'


func receive_current_time(time: int):
	time_john = time
	update_fsm()
	print(time_john)
	print(current_state)
	print(john_gold)
	
var state_stack = []

@onready var states_map = {
	'STATE_PLAY': $States/Play,
	'STATE_SLEEP': $States/Sleep,
}

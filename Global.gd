extends Node

# Time variables
var hours: int = 0
var days: int = 0

# Time constants
const HOURS_IN_DAY: int = 24

# NPC registration
var npc_registry: Dictionary = {}

func start_tick_system():
	advance_time(1)

@onready var npc_scene = preload("res://npcs/JohnDoe.tscn")
@onready var npc_instance = npc_scene.instantiate()
func instantiate_npc():
	if npc_scene:
		var npc_instance = npc_scene.instantiate()
		add_child(npc_instance)
	else:
		print("Faile to load NPC scene")

func _ready():
	print("Global Variables Init")
	start_tick_system()
	print("Started Tick Sytem")
	instantiate_npc()
	print("Intantiate NPC")

func notify_npcs():
	var npcs_to_notify = npc_registry.get(hours, [])
	for npc in npcs_to_notify:
		npc.receive_message("The time is now: %d" % hours)
	if hours in npc_registry:
		npc_registry[hours].clear()

func advance_time(hours_to_advance: int):
	hours += hours_to_advance
	days += hours / HOURS_IN_DAY
	hours %= HOURS_IN_DAY
	notify_npcs()
	npc_instance.receive_current_time(hours)

func register_npc(hour: int, npc):
	if hour not in npc_registry:
		npc_registry[hour] = []
	npc_registry[hour].append(npc)

func get_formatted_time():
	var hours_str = str(hours).pad_zeros(2)
	return "Dia %d\n Hora: %s" % [days, hours_str]

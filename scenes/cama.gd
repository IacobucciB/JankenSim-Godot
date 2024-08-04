extends Node2D

@onready var tiempo = $tiempo

func _ready():
	tiempo.clear()
	tiempo.add_text(Global.get_formatted_time())


func _on_sleep_pressed():
	Global.advance_time(8, 0)
	tiempo.clear()
	tiempo.add_text(Global.get_formatted_time())


func _on_hub_pressed():
	get_tree().change_scene_to_file("res://scenes/hub.tscn")

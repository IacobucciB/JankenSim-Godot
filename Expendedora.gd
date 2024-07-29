extends Node2D

@onready var oro = $ORO

func _ready():
	oro.clear()
	oro.add_text("ORO: " + str(Player.gold))

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_jugo_pressed():
	if Player.gold > 0:
		Player.gold -= 5
		oro.clear()
		oro.add_text("ORO: " + str(Player.gold))
	else:
		get_tree().change_scene_to_file("res://main.tscn")

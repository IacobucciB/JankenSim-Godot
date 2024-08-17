extends Node2D

@onready var log_tlabel = $TextControl/LogTextLabel
@onready var open_window_sprite = $OpenedWindowSprite2D
@onready var closed_window_sprite = $ClosedWindowSprite2D

var is_window_open = false

func _on_ready():
	randomize()

func _on_hub_button_pressed():
	get_tree().change_scene_to_file("res://location/hub/hub.tscn")

func _on_move_away_button_pressed():
	if is_window_open == true:
		log_tlabel.add_text("You approached the window \n")
		open_window_sprite.visible = true
		closed_window_sprite.visible = false
		is_window_open = false
	else:
		log_tlabel.add_text("You moved away from the window \n")
		open_window_sprite.visible = false
		closed_window_sprite.visible = true
		is_window_open = true

func _on_rock_button_pressed():
	pass # Replace with function body.

func _on_paper_button_pressed():
	pass # Replace with function body.

func _on_scissors_button_pressed():
	pass # Replace with function body.

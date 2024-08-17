extends Node2D


func _on_vending_machine_button_pressed():
	get_tree().change_scene_to_file("res://location/vending_machine/vending_machine.tscn")


func _on_window_button_pressed():
	get_tree().change_scene_to_file("res://location/window/window.tscn")


func _on_bed_button_pressed():
	get_tree().change_scene_to_file("res://location/bed/bed.tscn")

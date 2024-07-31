extends Node2D


func _on_ventana_pressed():
	get_tree().change_scene_to_file("res://scenes/ventana.tscn")


func _on_expendedora_pressed():
	get_tree().change_scene_to_file("res://scenes/expendedora.tscn")

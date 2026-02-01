extends Node2D

func _ready() -> void:
	Globals.keys = 0

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Pantallas/mainMenu.tscn")

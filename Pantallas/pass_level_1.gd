extends Node2D

func _on_retry_pressed() -> void:
	Globals.keys = 0
	get_tree().change_scene_to_file(Globals.currentLevel)

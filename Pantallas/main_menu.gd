extends Node2D

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Pantallas/level1.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_controls_pressed() -> void:
	get_node("ControlesTab").show()

func _on_volver_pressed() -> void:
	get_node("ControlesTab").hide()

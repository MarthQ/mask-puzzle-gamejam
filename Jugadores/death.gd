extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D and body.is_in_group("darts"):
		prints("Queee")
		get_tree().change_scene_to_file("res://Pantallas/Game Over.tscn")


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("spikes"):
		get_tree().change_scene_to_file("res://Pantallas/Game Over.tscn")

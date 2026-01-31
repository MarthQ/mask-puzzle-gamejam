class_name AreaMascara
extends Area2D

func _on_area_entered(body: Node2D) -> void:
	if body.is_in_group("doors"):
		body.open()
		
func _on_area_exited(body: Node2D) -> void:
	if body.is_in_group("doors"):
		body.close()

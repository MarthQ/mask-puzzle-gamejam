extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlatformerCharacter2D:
		Globals.keys += 1
		prints(Globals.keys)
		queue_free()

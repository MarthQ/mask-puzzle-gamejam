extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlatformerCharacter2D:
		SoundManager.get_node("Channel3").stream = load("res://Sonidos/ggj multiplayer boton.ogg")
		SoundManager.get_node("Channel3").play()
		$Platform/PlatformBody/AnimationPlayer.play("platform_move")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is PlatformerCharacter2D:
		$Platform/PlatformBody/AnimationPlayer.pause()

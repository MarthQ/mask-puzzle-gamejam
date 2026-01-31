extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlatformerCharacter2D:
		$Platform/PlatformBody/AnimationPlayer.play("platform_move")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is PlatformerCharacter2D:
		$Platform/PlatformBody/AnimationPlayer.pause()

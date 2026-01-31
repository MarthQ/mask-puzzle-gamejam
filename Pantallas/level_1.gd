extends Node2D
	
func _process(delta: float) -> void:	
	if Globals.keys == 2 and Globals.player1ready and Globals.player2ready:
		get_tree().change_scene_to_file("res://Pantallas/Game Over.tscn")

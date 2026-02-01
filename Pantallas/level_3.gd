extends Node2D
	
func _process(delta: float) -> void:	
	if Globals.keys == 2: 
		$Exitdoor/Sprite2D.texture = load("res://Sprites/mobs/salida.png")
		$Exitdoor/Sprite2D.position = Vector2(-38, 97)
		$Exitdoor/Sprite2D.rotation_degrees = 5.9
		$Exitdoor/Sprite2D.scale = Vector2(1.243, 1.243)
	
	if Globals.keys == 2 and Globals.player1ready and Globals.player2ready:
		Globals.currentLevel = "res://Pantallas/level3.tscn"
		get_tree().change_scene_to_file("res://Pantallas/Pass Level1.tscn")

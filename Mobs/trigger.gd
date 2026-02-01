extends Area2D

func open():
	SoundManager.get_node("Channel3").stream = load("res://Sonidos/ggj multiplayer puerta.ogg")
	SoundManager.get_node("Channel3").play()
	get_parent().get_node("MainCollision").position.y = -4000
	
func close():
	get_parent().get_node("MainCollision").position.y = 0

extends Area2D

func open():
	get_parent().get_node("MainCollision").position.y = -4000
	
func close():
	get_parent().get_node("MainCollision").position.y = 0

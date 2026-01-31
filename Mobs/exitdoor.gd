extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player1"):
		Globals.player1ready = true
	if body.is_in_group("player2"):
		Globals.player2ready = true
	prints(Globals.keys,Globals.player1ready, Globals.player2ready)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player1"):
		Globals.player1ready = false
	if body.is_in_group("player2"):
		Globals.player2ready = false

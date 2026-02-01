extends Node2D

@export var dartPrefab : PackedScene

func _ready() -> void:
	SoundManager.get_node("Channel4").stream = load("res://Sonidos/ggj multiplayer dardos.ogg")
	shootDart()

func shootDart():
	while true:
		await get_tree().create_timer(1.0).timeout
		SoundManager.get_node("Channel4").play()
		var dartInstance = dartPrefab.instantiate()
		dartInstance.position = Vector2(0, 0)
		add_child(dartInstance)

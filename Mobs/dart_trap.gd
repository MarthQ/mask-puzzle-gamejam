extends Node2D

@export var dartPrefab : PackedScene

func _ready() -> void:
	shootDart()

func shootDart():
	while true:
		await get_tree().create_timer(1.0).timeout
		var dartInstance = dartPrefab.instantiate()
		dartInstance.position = Vector2(0, 0)
		add_child(dartInstance)

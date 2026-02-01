extends RigidBody2D
@export var dartSpeed : float = -500

func _ready() -> void:
	gravity_scale = 0
	await get_tree().create_timer(3.0).timeout
	selfDestruct()

func _physics_process(delta: float) -> void:
	linear_damp = 0
	linear_velocity = Vector2(dartSpeed, linear_velocity.y)
	#moveDart()

#func moveDart():
	#add_constant_force(Vector2(dartSpeed, 0), position)
	
func selfDestruct():
	queue_free()

func _on_body_entered(body: Node) -> void:
	if body is TileMapLayer:
		prints("choque")
		queue_free()

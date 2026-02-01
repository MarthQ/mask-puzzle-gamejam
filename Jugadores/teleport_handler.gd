extends Node2D

var is_teleport_available = true

func _ready() -> void:
	SoundManager.get_node("Channel3").stream = load("res://Sonidos/ggj multiplayer tp.ogg")

func _teleport():
	is_teleport_available = false
	SoundManager.get_node("Channel3").play()
	$PlayerTiger/CPUParticles2D.emitting = true
	$PlayerHawk/CPUParticles2D.emitting = true
	Engine.time_scale = 0.1
	$PlayerHawk.add_collision_exception_with($PlayerTiger)
	$PlayerTiger.add_collision_exception_with($PlayerHawk)
	
	var p1coords = $PlayerHawk.position
	var p2coords = $PlayerTiger.position	
	
	$PlayerHawk.position = p2coords
	$PlayerTiger.position = p1coords

	await get_tree().create_timer(0.05).timeout
	Engine.time_scale = 1
	await get_tree().create_timer(1).timeout
	is_teleport_available = true
	
	$PlayerHawk.remove_collision_exception_with($PlayerTiger)
	$PlayerTiger.remove_collision_exception_with($PlayerHawk)
	
func _physics_process(delta: float) -> void:

	if $PlayerHawk.is_masked and $PlayerTiger.is_masked and is_teleport_available:
		prints("TP!!!")
		_teleport()

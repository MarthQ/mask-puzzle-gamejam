extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D and body.is_in_group("darts"):
		body.queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("spikes") and get_parent().is_masked:
		get_parent().get_node("Hurtbox").set_collision_layer_value(1, false)
		get_parent().get_node("Hurtbox").set_collision_mask_value(1, false)

	if get_parent().is_masked == false:
		get_parent().get_node("Hurtbox").set_collision_layer_value(1, true)
		get_parent().get_node("Hurtbox").set_collision_mask_value(1, true)

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("spikes") and get_parent().is_masked:
		get_parent().get_node("Hurtbox").set_collision_layer_value(1, false)
		get_parent().get_node("Hurtbox").set_collision_mask_value(1, false)
		
	if get_parent().is_masked == false:
		get_parent().get_node("Hurtbox").set_collision_layer_value(1, true)
		get_parent().get_node("Hurtbox").set_collision_mask_value(1, true)

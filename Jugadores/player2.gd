class_name Player2
extends PlatformerCharacter2D

@export_range(0, 200, .2, "or_greater") var move_speed : float = 300.0
@export_range(0, 800, .2, "or_greater") var jump_force : float = 700.0
@export var actions : Player2InputActions
@export var is_masked = false
var coyote_timer: float  = 0
var coyote_time_duration: float = 0.2

func _physics_process(delta: float) -> void:
	
	var direction = Input.get_vector(actions.left, actions.right, actions.up, actions.down)
	
	velocity.x = move_speed * direction.x
	_apply_gravity(delta)
	
	if !is_masked:
		if velocity.x < 0:
			$Facing.scale.x = -1
			$Facing/AnimatedSprite2D.play("walking")
		if velocity.x > 0:
			$Facing.scale.x = 1
			$Facing/AnimatedSprite2D.play("walking")
		if velocity.x == 0:
			$Facing/AnimatedSprite2D.play("idle")
		if !is_on_floor():
			$Facing/AnimatedSprite2D.play("jumping")
	if is_masked:
		if velocity.x < 0:
			$Facing.scale.x = -1
			$Facing/AnimatedSprite2D.play("walking mask")
		if velocity.x > 0:
			$Facing.scale.x = 1
			$Facing/AnimatedSprite2D.play("walking mask")
		if velocity.x == 0:
			$Facing/AnimatedSprite2D.play("idle mask")
		if !is_on_floor():
			$Facing/AnimatedSprite2D.play("jumping mask")

	move_and_slide()
	
	if !is_masked:
		if Input.is_action_pressed(actions.left) or Input.is_action_pressed(actions.right):
			$Facing/AnimatedSprite2D.play("walking")
		if Input.is_action_just_released(actions.left) or Input.is_action_just_released(actions.right):
			$Facing/AnimatedSprite2D.play("idle")
	if is_masked:
		if Input.is_action_pressed(actions.left) or Input.is_action_pressed(actions.right):
			$Facing/AnimatedSprite2D.play("walking mask")
		if Input.is_action_just_released(actions.left) or Input.is_action_just_released(actions.right):
			$Facing/AnimatedSprite2D.play("idle mask")
		
	if Input.is_action_just_pressed(actions.down):
		SoundManager.get_node("Channel2").stream = load("res://Sonidos/ggj multiplayer mascara.ogg")
		SoundManager.get_node("Channel2").play()
		
	if Input.is_action_pressed(actions.down):
		is_masked = true
		$Facing/AnimatedSprite2D.play("new_animation")
		$AreaMask/CollisionMask.disabled = false
	if Input.is_action_just_released(actions.down):
		is_masked = false
		$Facing/AnimatedSprite2D.play("idle")
		$AreaMask/CollisionMask.disabled = true
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(actions.up):
		try_jump()
		
	if event.is_action_released(actions.up) and velocity.y < 0:
		velocity.y *= 0.5 # Reduce vertical speed

func try_jump() -> bool:
	if is_on_floor() or coyote_timer > 0:
		SoundManager.get_node("Channel2").stream = load("res://Sonidos/ggj multiplayer nene.ogg")
		SoundManager.get_node("Channel2").play()
		_jump()
		return true
	return false

func _jump():
	velocity.y -= jump_force

func _apply_gravity(delta: float):
	var gravity = get_gravity()
	velocity.y += gravity.y * delta
	velocity.x += gravity.x * delta

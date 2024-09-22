extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -600.0
const DECELERATION_FRAMES = 5

var within_edge_grace_period = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if $EdgeGrace.is_stopped():
			$EdgeGrace.start()
	else:
		$EdgeGrace.stop()
		within_edge_grace_period = true

	# Handle jump.
	if (
		Input.is_action_just_pressed("action")
		and (
			is_on_floor()
			or within_edge_grace_period
			or $EarlyGrace.is_colliding()
			)
	):
		velocity.y = JUMP_VELOCITY
		within_edge_grace_period = false
	
	# Allow controllable jump height.
	if Input.is_action_just_released("action"):
		velocity.y *= 0.5

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		$Sprite.play("run")
		$Sprite.flip_h = direction > 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED / DECELERATION_FRAMES)
		$Sprite.play("idle")
	
	move_and_slide()


func _on_edge_grace_timeout() -> void:
	within_edge_grace_period = false

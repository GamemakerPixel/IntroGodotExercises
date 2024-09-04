extends CharacterBody2D

# Pixels per second
const SPEED = 300

# Typically better for physics, uses a fixed
# delta.
func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO
	
	# Delta shouldn't be nessesary since I'm
	# using velocity, and _physics_process
	# uses a fixed frame rate (always called
	# at 60Hz.)
	if Input.is_action_pressed("right"):
		velocity += Vector2.RIGHT * SPEED
	if Input.is_action_pressed("left"):
		velocity += Vector2.LEFT * SPEED
	move_and_slide()

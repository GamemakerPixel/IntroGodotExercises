extends CharacterBody2D

# Pixels per second
const SPEED = 256

# 1 for right, -1 for left
var input_direction = 0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("right") or event.is_action_released("left"):
		input_direction += 1
	elif event.is_action_pressed("left") or event.is_action_released("right"):
		input_direction -= 1

func _physics_process(delta: float) -> void:
	velocity.x = input_direction * SPEED
	
	move_and_slide()

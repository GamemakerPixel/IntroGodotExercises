extends CharacterBody2D

const initial_velocity = Vector2(400, 400)


func _ready() -> void:
	velocity = initial_velocity


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())

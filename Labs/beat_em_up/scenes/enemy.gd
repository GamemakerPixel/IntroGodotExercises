extends CharacterBody2D

const MAX_HEALTH = 7
const DAMPENING = 0.9

var health = MAX_HEALTH : set = _set_health


func _ready() -> void:
	$HealthBar.max_health = MAX_HEALTH
	$HealthBar.health = MAX_HEALTH


func _physics_process(_delta: float) -> void:
	# Yes, I should be using delta here to ensure that the frequency of physics
	# frames doesn't impact how quickly the enemies movement is dampened. I don't
	# feel like solving for that equation right now though.
	velocity *= DAMPENING
	move_and_slide()


func on_attacked(damage: int, attack_impulse: Vector2 = Vector2.ZERO) -> void:
	health -= damage
	velocity += attack_impulse


func _set_health(new_health: int) -> void:
	health = new_health
	
	if health <= 0:
		queue_free()
	
	$HealthBar.health = new_health

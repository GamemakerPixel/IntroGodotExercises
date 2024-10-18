extends CharacterBody2D

# Pixels per second
const SPEED = 256
const DAMAGE = 1
const KNOCKBACK = 512

@onready var animation_tree: AnimationTree = $AnimationTree


func _physics_process(_delta: float) -> void:
	var move_direction = Input.get_vector("left", "right", "up", "down")
	
	# Actually, you don't shouldn't need to multiply by delta. That's only
	# for when you need to change something dependant on how much time has 
	# passed since the previous frame. In our program, the magnitude of velocity
	# is constant (not time dependant, like position.)
	velocity = SPEED * move_direction
	animation_tree["parameters/conditions/running"] = (velocity.length() != 0)
	
	move_and_slide()


func _process(_delta: float) -> void:
	if velocity.x != 0:
		var facing_left = velocity.x < 0
		# There is a property so you don't have to use scale.x *= -1
		$Sprite.flip_h = facing_left
		$AttackOrigin.rotation = PI if (facing_left) else 0.0
	
	animation_tree[
		"parameters/conditions/attack"
	] = Input.is_action_just_pressed("action")


func _on_attack_area_body_entered(body: Node2D) -> void:
	# We can assume that since the body is using collision layer "enemy", they
	# can take damage.
	var attack_impulse = (
		body.global_position - $AttackOrigin.global_position
	).normalized() * KNOCKBACK
	body.on_attacked(DAMAGE, attack_impulse)

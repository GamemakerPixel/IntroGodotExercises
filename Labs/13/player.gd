extends FirstPersonPlayer

const BOX_GROUP = "box"

var current_joint: Joint3D = null


func _unhandled_input(event: InputEvent) -> void:
	super._unhandled_input(event)
	if (
		event.is_action_pressed("click")
		and not current_joint
		and $Camera/GrabRay.is_colliding()
	):
		var collider: Node3D = $Camera/GrabRay.get_collider()
		if collider.is_in_group(BOX_GROUP):
			var joint = PinJoint3D.new()
			$Camera/GrabTarget.position = collider.global_position - $Camera.global_position
			add_child(joint)
			joint.node_a = $Camera/GrabTarget.get_path()
			joint.node_b = collider.get_path()
			current_joint = joint
	
	if event.is_action_released("secondary_interact") and current_joint:
		current_joint.queue_free()


func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	$Camera/GrabTarget.position = $Camera/GrabTarget.position


func _process(delta: float) -> void:
	$UI.box_in_range = (
		$Camera/GrabRay.is_colliding()
		and $Camera/GrabRay.get_collider().is_in_group(BOX_GROUP)
	)

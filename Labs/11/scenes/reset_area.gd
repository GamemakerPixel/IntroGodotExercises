extends Area3D


func _on_body_entered(_body: Node3D) -> void:
	get_tree().call_deferred("reload_current_scene")

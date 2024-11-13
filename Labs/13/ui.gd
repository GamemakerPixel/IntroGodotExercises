extends CanvasLayer

var box_in_range := false : set = _set_box_in_range


func _set_box_in_range(new_box_in_range: bool) -> void:
	box_in_range = new_box_in_range
	if box_in_range:
		$Animation.play("can_grab")
	else:
		$Animation.play("cannot_grab")

extends Node

const ESCAPE_CAPTURED = "escape"


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(ESCAPE_CAPTURED):
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)


func capture_mouse() -> void:
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_CAPTURED)

extends Node3D

const MAX_CORRECT_BOXES = 3

var correct_boxes = 0


func increment_correct_boxes() -> void:
	correct_boxes += 1
	if correct_boxes == MAX_CORRECT_BOXES:
		$WinSound.play()


func decrement_correct_boxes() -> void:
	correct_boxes -= 1

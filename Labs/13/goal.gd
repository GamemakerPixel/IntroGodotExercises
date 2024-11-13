@tool
extends Area3D

signal target_box_entered
signal target_box_exited

enum BoxColor {
	RED,
	GREEN,
	BLUE,
}

const MATERIALS = {
	BoxColor.RED: preload("res://Labs/13/red.tres"),
	BoxColor.GREEN: preload("res://Labs/13/green.tres"),
	BoxColor.BLUE: preload("res://Labs/13/blue.tres")
}

const BOX_GROUP = "box"

@export var color: BoxColor : set = _set_color

var box: Node3D


func _set_color(new_color: BoxColor) -> void:
	color = new_color
	$Mesh.set_surface_override_material(0, MATERIALS[color])


func _on_body_entered(body: Node3D) -> void:
	if Engine.is_editor_hint():
		return
	if body.is_in_group(BOX_GROUP):
		if body.color == color:
			box = body
			target_box_entered.emit()


func _on_body_exited(body: Node3D) -> void:
	if Engine.is_editor_hint():
		return
	if body == box:
		box = null
		target_box_exited.emit()

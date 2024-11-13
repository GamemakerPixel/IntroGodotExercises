@tool
extends RigidBody3D

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

@export var color: BoxColor : set = _set_color


func _set_color(new_color: BoxColor) -> void:
	color = new_color
	$Mesh.set_surface_override_material(0, MATERIALS[color])

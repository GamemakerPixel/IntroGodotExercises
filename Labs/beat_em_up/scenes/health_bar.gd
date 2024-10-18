extends ProgressBar

@export var percentage_gradient: Gradient


var max_health: int = 1 : set = _set_max_health
var health: int = 1 : set = _set_health


func _set_max_health(new_max_health: int) -> void:
	max_health = new_max_health
	max_value = new_max_health


func _set_health(new_health: int) -> void:
	health = new_health
	value = new_health
	
	get_theme_stylebox("fill").bg_color = percentage_gradient.sample(
		float(health) / max_health
	)

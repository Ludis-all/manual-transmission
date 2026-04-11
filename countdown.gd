extends Node2D

func _on_timer_timeout() -> void:
	get_child(1).visible = false
	get_child(0).get_child(0).visible = true

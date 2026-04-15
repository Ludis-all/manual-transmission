extends Area2D

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		get_parent().get_parent().drawer2open = true
		get_parent().get_parent().drawer1open = false
		get_parent().texture = preload("res://roomrightdrawer.png")

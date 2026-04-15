extends Area2D


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		if (get_child(1).visible == true):
			get_child(1).visible = false
		else:
			get_child(1).visible = true

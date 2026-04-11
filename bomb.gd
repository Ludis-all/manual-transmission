extends Sprite2D

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click")):
		self.global_position = Vector2(20,0)

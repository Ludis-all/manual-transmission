extends Area2D

@export var openCount = 0

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		if (openCount < 4):
			openCount += 1
		else:
			get_parent().get_parent().drawer1open = true
			get_parent().get_parent().drawer2open = false
			get_parent().texture = preload("res://image.png")

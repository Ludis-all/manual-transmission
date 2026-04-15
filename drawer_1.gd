extends Sprite2D

@export var openCount = 0
@export var open = false


func _on_clicker_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		if (openCount < 4):
			openCount += 1
		else:
			self.open = true
			#self.texture = preload("res://Roll1_141556OF207882-R1-E006.jpg")

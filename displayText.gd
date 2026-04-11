extends RichTextLabel

@onready var currentManual = "res://text.txt";


func _on_clicker_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click")):
		currentManual = "res://text.txt"
		displayPage()

func displayPage() -> void:
	clear()
	var file = FileAccess.open(currentManual, FileAccess.READ)
	while (get_line_count() < 16 && !file.eof_reached()):
		append_text(file.get_line())
		newline()

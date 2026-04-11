extends RichTextLabel

@onready var currentManual = "res://topSecret.txt"
@onready var page = 1
@onready var timer = get_parent().get_parent().get_child(3)

func _on_clicker_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click")):
		currentManual = "res://topSecret.txt"
		displayPage()

func displayPage() -> void:
	clear()
	var file = FileAccess.open(currentManual, FileAccess.READ)
	var contents = file.get_line()
	while (!contents.contains("Page " + str(page)) && !file.eof_reached()):
		contents = file.get_line()
	contents = file.get_line()
	while (!contents.contains("Page " + str(page + 1)) && !file.eof_reached()):
		append_text(contents)
		newline()
		contents = file.get_line()

func _process(delta: float) -> void:
	if (Input.is_action_just_released("Left") && page > 1):
		page -= 1
	if (Input.is_action_just_released("Right")):
		page += 1
	displayPage()
	
	if (currentManual == "res://topSecret.txt" && page == 3 && timer.is_stopped()):
		timer.start()

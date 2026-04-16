extends RichTextLabel

@onready var currentManual = ""
@onready var page = 1
@onready var timer = get_parent().get_parent().get_child(3)

func displayPage() -> void:
	get_child(0).visible = true
	get_child(1).visible = true
	clear()
	if (currentManual != ""):
		var file = FileAccess.open(currentManual, FileAccess.READ)
		var contents = file.get_line()
		get_child(0).clear()
		get_child(0).append_text(contents.split(": ")[1])
		while (!contents.contains("Page " + str(page)) && !file.eof_reached()):
			contents = file.get_line()
		contents = file.get_line()
		while (!contents.contains("Page " + str(page + 1)) && !file.eof_reached()):
			append_text(contents)
			newline()
			contents = file.get_line()

func hidePage() -> void:
	get_child(0).visible = false
	get_child(1).visible = false
	get_child(2).visible = false
	clear()
	page = 1

func _process(delta: float) -> void:
	if (Input.is_action_just_released("Escape")):
		currentManual = ""
	if (currentManual != "" && currentManual != "Map"):
		if (Input.is_action_just_released("Left") && page > 1):
			page -= 1
		if (Input.is_action_just_released("Right")):
			page += 1
		displayPage()
	else:
		hidePage()
	
	if (currentManual == "res://topSecret.txt" && page == 3 && timer.is_stopped()):
		timer.start()
		get_parent().get_parent().gameOn = true
		
	if (currentManual == "Map"):
		get_child(2).visible = true


func _on_wall_map_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "Map"

func _on_top_secret_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click")):
		currentManual = "res://topSecret.txt"

func _on_peacefire_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://newstoday.txt"

func _on_intercept_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://intercept.txt"

func _on_carlson_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://carlson.txt"

func _on_panelproblem_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://panelproblem.txt"

func _on_grost_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://grost.txt"

func _on_karazalstan_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://karazalstan.txt"

func _on_nightraid_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).drawer1open):
		currentManual = "res://nightraid.txt"

func _on_partmanifest_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).drawer2open):
		currentManual = "res://partmanifest.txt"

func _on_ship_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://ship1.txt"

func _on_ship_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://ship2.txt"

func _on_ship_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://ship3.txt"

func _on_relations_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://relations.txt"

func _on_siltco_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://siltco.txt"

func _on_battlefield_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://battlefield.txt"

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://bombinfo.txt"

func _on_company_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		currentManual = "res://company.txt"

func _on_bombmanual_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).get_child(0).get_child(2).panelmanual):
		currentManual = "res://bombmanual.txt"

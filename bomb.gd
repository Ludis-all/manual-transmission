extends Sprite2D

var panel = preload("res://bombBottomPanel.png");
var panelmanual = false
var switch = false
var disarming = false
var codeRight = false

var wire1 = false
var wire2 = false
var wire3 = false
var wire12 = false
var wire22 = false
var wire32 = false

func displayBomb() -> void:
	texture = panel

func hideBomb() -> void:
	visible = false

func _process(delta) -> void:
	if (Input.is_action_just_pressed("Escape") && get_tree().root.get_child(0).gameOn):
		visible = false
		panelmanual = false
	displayBomb()
	if (get_tree().root.get_child(0).get_child(0).get_child(3).text == "7824593645" && switch):
		codeRight = true
	if (wire12 && wire22 && wire32):
		get_tree().root.get_child(0).get_child(0).get_child(3).text = "0000003000"

func _on_bombleft_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		panel = preload("res://bombSidePanel.png")
		visible = true

func _on_bombright_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		panel = preload("res://bombBottomPanel.png")
		visible = true

func _on_panelmanual_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && !panelmanual && !disarming):
		panel = preload("res://bombOtherPanel.png")
		panelmanual = true
		visible = true

func _on_bombtop_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		panel = preload("res://switchoff.png")
		visible = true
		disarming = true
		get_tree().root.get_child(0).gameOn = false
		get_tree().root.get_child(0).get_child(0).get_child(1).visible = false
		get_tree().root.get_child(0).get_child(0).get_child(3).visible = true

func _on_switch_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && disarming):
		panel = preload("res://switchon.png")
		visible = true
		switch = true

func _on_wire_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && disarming):
		wire1 = true
		wire2 = false
		wire3 = false

func _on_wire_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && disarming):
		wire1 = false
		wire2 = true
		wire3 = false

func _on_wire_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && disarming):
		wire1 = false
		wire2 = false
		wire3 = true

func _on_end_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (wire1 && event.is_action_released("Left Click") && disarming):
		wire12 = true
		$wire1.visible = true

func _on_end_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (wire2 && event.is_action_released("Left Click") && disarming):
		wire22 = true
		$wire2.visible = true

func _on_end_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (wire3 && event.is_action_released("Left Click") && disarming):
		wire32 = true
		$wire3.visible = true

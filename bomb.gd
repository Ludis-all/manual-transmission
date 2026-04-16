extends Sprite2D

var panel = preload("res://bombBottomPanel.png");
var panelmanual = false
var switch = false
var disarming = false
var codeRight = false

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

func _on_bombleft_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		panel = preload("res://bombSidePanel.png")
		visible = true

func _on_bombright_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_tree().root.get_child(0).gameOn):
		panel = preload("res://bombBottomPanel.png")
		visible = true

func _on_panelmanual_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && !panelmanual):
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

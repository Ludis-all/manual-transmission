extends Node2D

var gameOn = false
var gameOver = false
var drawer1open = false
var drawer2open = false
@onready var timer = get_child(3)

func _on_timer_timeout() -> void:
	get_child(1).visible = false
	get_child(1).set_process(PROCESS_MODE_DISABLED)
	get_child(0).get_child(0).visible = true
	get_child(0).get_child(1).visible = false
	get_child(0).get_child(2).visible = false
	get_tree().root.get_child(0).get_child(0).get_child(3).visible = false
	get_child(0).get_child(1).set_process(PROCESS_MODE_DISABLED)
	get_child(1).get_child(1).set_process(PROCESS_MODE_DISABLED)
	gameOver = true

func _process(delta: float) -> void:
	if (gameOver && Input.is_action_just_pressed("Restart")):
		get_tree().reload_current_scene()

func _on_redbutton_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_released("Left Click") && get_child(0).get_child(2).codeRight):
		timer.stop()
		get_child(1).visible = false
		get_child(1).set_process(PROCESS_MODE_DISABLED)
		get_child(0).get_child(0).text = "Mission Accomplished!\nManual Transmitted.\nWell done, agent."
		get_child(0).get_child(0).visible = true
		get_child(0).get_child(1).visible = false
		get_child(0).get_child(2).visible = false
		get_tree().root.get_child(0).get_child(0).get_child(3).visible = false
		get_child(0).get_child(1).set_process(PROCESS_MODE_DISABLED)
		get_child(1).get_child(1).set_process(PROCESS_MODE_DISABLED)

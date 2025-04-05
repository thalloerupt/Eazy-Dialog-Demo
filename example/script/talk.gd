class_name Talk extends State

@onready var dialog: PanelContainer = $"/root/Main/CanvasLayer/Dialog"

const runtime_cs = preload("res://addons/eazy_dialog/components/EazyDialogRuntime.cs")
var runtime
func enter(previous_state_path: String, data := {}) -> void:
	runtime = runtime_cs.new()
	dialog.visible = true
	runtime.DialogueSignal.connect(_dialogue_signal)
	runtime.DialogueEndSignal.connect(_dialogue_end_signal)
	runtime.PlayNext("res://eazy_dialog_data/Player/NPC/Hello.txt",-1)

func physics_update(delta: float) -> void:
	if(Input.is_action_just_pressed("mouse_left")):
		runtime.PlayNext("res://eazy_dialog_data/Player/NPC/Hello.txt",-1)

func _dialogue_signal(character,content,answers)->void:
	var _name:Label = dialog.get_node("Name")
	var _content:Label = dialog.get_node("Content")
	_name.text = character
	_content.text = content
	
func _dialogue_end_signal()->void:
	dialog.visible = false
	finished.emit(IDLE)

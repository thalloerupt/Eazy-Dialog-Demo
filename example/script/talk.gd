class_name Talk extends State

@onready var dialog: VBoxContainer = $"/root/Main/CanvasLayer/Dialog"
@onready var item_list: ItemList = $"/root/Main/CanvasLayer/Dialog/ItemList"
@onready var button: Button = $"/root/Main/CanvasLayer/Dialog/Button"

const runtime_cs = preload("res://addons/eazy_dialog/components/EazyDialogRuntime.cs")
var runtime
func enter(previous_state_path: String, data := {}) -> void:
	runtime = runtime_cs.new()
	dialog.visible = true
	runtime.DialogueSignal.connect(_dialogue_signal)
	runtime.DialogueSelectionSignal.connect(_dialogue_selection_signal)
	runtime.DialogueEndSignal.connect(_dialogue_end_signal)
	if(!button.pressed.has_connections()):
		item_list.item_clicked.connect(_on_item_list_item_selected)
		button.pressed.connect(_pressed)

	runtime.PlayNext("res://eazy_dialog_data/Cat/Dog/A.txt",-1)


func physics_update(delta: float) -> void:
	pass
		

func _pressed()->void:
	runtime.PlayNext("res://eazy_dialog_data/Cat/Dog/A.txt",-1)
	
	
func _on_item_list_item_selected(index:int,p,m)->void:
	runtime.PlayNext("res://eazy_dialog_data/Cat/Dog/A.txt",index)
	item_list.visible = false


func _dialogue_signal(character,content)->void:
	var _name:Label = dialog.get_node("Name")
	var _content:Label = dialog.get_node("Content")
	_name.text = character
	_content.text = content
	
	
func _dialogue_selection_signal(answers:Array)->void:
	item_list.clear()
	item_list.visible = true
	
	for answer in answers:
		item_list.add_item(answer)

	
func _dialogue_end_signal()->void:
	dialog.visible = false
	item_list.clear()
	finished.emit(IDLE)

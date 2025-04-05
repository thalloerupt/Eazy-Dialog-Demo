class_name PlayerStateMachine extends StateMachine

@export var initial_state: State = null

@onready var state: State = (func get_initial_state() -> State:
	return initial_state if initial_state != null else get_child(0)
).call()

func _ready() -> void:
	# Connect to every state's finished signal to transition to the next state.
	for state_node: State in find_children("*", "State"):
		if(!state_node.finished.is_connected(_transition_to_next_state)):
			state_node.finished.connect(_transition_to_next_state)

	# State machines usually access data from the root node of the scene they're part of: the owner.
	# We wait for the owner to be ready to guarantee all the data and nodes the states may need are available.
	await owner.ready
	state.enter("")

func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)

func _process(delta: float) -> void:

	state.update(delta)


func _physics_process(delta: float) -> void:
	state.physics_update(delta)

	
func _transition_to_next_state(target_state_path: String, data: Dictionary = {}) -> void:
	if not has_node(target_state_path):
		printerr(owner.name + ": Trying to transition to state " + target_state_path + " but it does not exist.")
		return

	var previous_state_path := state.name
	if (state.exit_condition()):
		state.exit()
		var state_temp = get_node(target_state_path)
		if(state_temp.enter_condition()):
			state = state_temp
			state.enter(previous_state_path, data)

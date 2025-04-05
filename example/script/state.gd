class_name State extends Node
const IDLE = "Idle"
const WALKING = "Walk"
const TALKING = "Talk"
const INTERACTING = "Interact"



## 获取状态机节点的角色
var player: Player

signal finished(next_state_path: String, data: Dictionary)

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null)

## Called by the state machine when receiving unhandled input events.
func handle_input(_event: InputEvent) -> void:
	pass


## Called by the state machine on the engine's main loop tick.
func update(_delta: float) -> void:
	pass


## Called by the state machine on the engine's physics update tick.
func physics_update(_delta: float) -> void:
	pass


func enter_condition() -> bool:
	return true

func exit_condition() -> bool:
	return true

## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter(previous_state_path: String, data := {}) -> void:
	pass


## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
	pass

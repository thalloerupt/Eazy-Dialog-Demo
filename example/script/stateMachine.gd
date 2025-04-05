class_name StateMachine extends Node

const PLAYER = "PlayerStateMachine"
const SETTING = "SettingStateMachine"

signal  transform(next_state_machine:String)

func ready() -> void:
	pass

func unhandled_input(event: InputEvent) -> void:
	pass

func process(delta: float) -> void:
	pass

func physics_process(delta: float) -> void:
	pass

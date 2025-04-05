class_name Player extends CharacterBody2D


@onready var player_state_machine: PlayerStateMachine =$PlayerStateMachine
@onready var figure: AnimatedSprite2D = $Figure
@onready var area_2d: Area2D = $Area2D



@export var gravity := 4000.0
@export var speed := 500.0
@export var friction:=500.0


func _process(_delta: float) -> void:
	pass

class_name Idle extends State


func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.x = 0.0
	player.velocity.y = 0.0

func physics_update(_delta: float) -> void:
	player.figure.play("idle")
	for node in player.area_2d.get_overlapping_bodies():

		if(node.name == "NPC" && Input.is_action_pressed("interact")):
			finished.emit(TALKING)
			print(node.name)

	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right") or Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down"):
		finished.emit(WALKING)

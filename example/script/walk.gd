class_name Walk extends State


func physics_update(delta: float) -> void:
	var input_direction := Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		player.figure.play("walk_left")
		input_direction.x-=1
	elif Input.is_action_pressed("move_right"):
		player.figure.play("walk_right")
		input_direction.x+=1
	elif Input.is_action_pressed("move_up"):
		player.figure.play("walk_back")
		input_direction.y-=1
	elif Input.is_action_pressed("move_down"):
		player.figure.play("walk_front")
		input_direction.y+=1
	
	input_direction = input_direction.normalized()



	if input_direction != Vector2.ZERO:
		player.velocity = input_direction*player.speed
	else:
		player.velocity = player.velocity.move_toward(Vector2.ZERO, player.friction * delta)
		finished.emit(IDLE)
	player.move_and_slide()
	for node in player.area_2d.get_overlapping_bodies():
		
		if(node.name == "NPC" && Input.is_action_pressed("interact")):
			finished.emit(TALKING)
			print(node.name)


		

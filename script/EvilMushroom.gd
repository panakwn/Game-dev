extends CharacterBody2D


func _physics_process(delta: float) -> void:
	#print("velo", velocity)
	move_and_slide()



	if velocity.length() > 0:
		$AnimatedSprite2D.play("Run")
	else:
		$AnimatedSprite2D.play("Idle")
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true

		

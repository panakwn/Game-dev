extends CharacterBody2D


var is_attacking: bool = false
func _physics_process(delta: float) -> void:
	#print("velo", velocity)
	if is_attacking:
		return
	move_and_slide()



	if velocity.length() > 0:
		$AnimatedSprite2D.play("Run")
	else:
		$AnimatedSprite2D.play("Idle")
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true

		
func attack()-> void:
	if is_attacking:
		return
	is_attacking = true
	$AnimatedSprite2D.play("Attack")
	$AnimationPlayer.play("attac")
	var attack_timer = Timer.new()
	attack_timer.wait_time = 1
	attack_timer.one_shot = true
	attack_timer.connect("timeout", self._on_attack_timeout)
	add_child(attack_timer)
	attack_timer.start()
func _on_attack_timeout() -> void:
	# After the attack finishes, return to idle state
	is_attacking = false
	
	

extends CharacterBody2D

var player: CharacterBody2D
var is_attacking: bool = false
var has_changed_bigger: bool
var has_changed_small: bool
var attack_flip_delay: float


func _ready() -> void:
	$HitBox/CollisionShape2D.disabled = true
	has_changed_bigger = false
	has_changed_small = false
	player = get_tree().get_first_node_in_group("Player")
	attack_flip_delay = 0.0

func _process(delta: float) -> void:
	#print(attack_flip_delay)
	if attack_flip_delay > 0:
		attack_flip_delay -= delta
func _physics_process(delta: float) -> void:
	#print("velo", velocity)
	if is_attacking:
		return
	move_and_slide()



	if velocity.length() > 0:
		$AnimatedSprite2D.play("Run")
		$Walk_Anim.play("step")
		
	else:
		$AnimatedSprite2D.play("Idle")
	
	if velocity.x > 0:
		if !has_changed_bigger:
			$AnimatedSprite2D.flip_h = false
			$HitBox/CollisionShape2D.position.x *= -1
			has_changed_bigger = true
			has_changed_small = false
	elif velocity.x < 0:
		if !has_changed_small:
			$AnimatedSprite2D.flip_h = true
			$HitBox/CollisionShape2D.position.x *= -1
			has_changed_bigger = false
			has_changed_small = true


		
func attack()-> void:
	if is_attacking:
		attackFlip()
		return
	is_attacking = true
	$AnimatedSprite2D.play("Attack")
	$Attack_Anim.play("attac")
	var attack_timer = Timer.new()
	attack_timer.wait_time = 1
	attack_timer.one_shot = true
	attack_timer.connect("timeout", self._on_attack_timeout)
	add_child(attack_timer)
	attack_timer.start()
func _on_attack_timeout() -> void:
	# After the attack finishes, return to idle state
	is_attacking = false
	
func attackFlip():
	if (global_position.x - player.global_position.x) < 0 and !has_changed_bigger and attack_flip_delay <= 0.0:
		# add delay here
		$AnimatedSprite2D.flip_h = false
		$HitBox/CollisionShape2D.position.x *= -1
		has_changed_bigger = true
		has_changed_small = false
		attack_flip_delay = 3
	if (global_position.x - player.global_position.x) > 0 and !has_changed_small and attack_flip_delay <= 0.0:
		#add delay here
		$AnimatedSprite2D.flip_h = true
		$HitBox/CollisionShape2D.position.x *= -1
		has_changed_bigger = false
		has_changed_small = true
		attack_flip_delay = 3

	
	

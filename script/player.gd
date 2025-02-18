extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var world_interaction: CollisionShape2D = $world_interaction
@onready var collision_shape: CollisionShape2D = $CollisionShape

const SPEED = 300.0

const SPRINT_SPEED = 750.0

func _physics_process(delta: float) -> void:

	var directionx := Input.get_axis("left", "right")
	var directiony := Input.get_axis("up", "down")
	var sprint := Input.is_action_pressed("sprint")
	
	var current_speed
	
	if sprint:
		current_speed = SPRINT_SPEED
		animated_sprite.speed_scale = 2
	else:
		current_speed = SPEED
		animated_sprite.speed_scale  = 1
	
	if directionx:
		if directiony:
			velocity.x = directionx * current_speed * 0.75
		else:
			velocity.x = directionx * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
	
	if directiony:
		if directionx:
			velocity.y = directiony * current_speed * 0.75
		else:
			velocity.y = directiony * current_speed
	else:
		velocity.y = move_toward(velocity.y, 0, current_speed)
		
	if velocity.x != 0 or velocity.y != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
		
		
	if directionx > 0:
		animated_sprite.flip_h = false
	if directionx < 0:
		animated_sprite.flip_h = true
		
	move_and_slide()

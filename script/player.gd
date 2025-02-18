extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite

const SPEED = 400.0

func _physics_process(delta: float) -> void:

	var directionx := Input.get_axis("left", "right")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var directiony := Input.get_axis("up", "down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if velocity.x != 0 or velocity.y != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
		
	if directionx > 0:
		animated_sprite.flip_h = false
	if directionx < 0:
		animated_sprite.flip_h = true
		
	move_and_slide()

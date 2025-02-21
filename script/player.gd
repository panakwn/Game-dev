extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var world_interaction: CollisionShape2D = $world_interaction
@onready var collision_shape: CollisionShape2D = $CollisionShape

#Constants
const SPEED = 300.0
const SPRINT_SPEED = 750.0
const SLIDE_SPEED = SPRINT_SPEED * 10.0
const SLIDE_DECREMENT = 10
const SLIDE_INTERVAL = 0.01

#Inputs
var input_x
var input_y
var move_dir
var is_sprinting
var is_sliding
var slide_cool
var has_cooled: bool

#Health
var health
var slide_timer = 0.0  
var is_dead

func getInput():
	input_x = Input.get_axis("left", "right")
	input_y = Input.get_axis("up", "down")
	move_dir = Vector2(input_x, input_y)
	is_sprinting = Input.is_action_pressed("sprint")
	is_sliding = Input.is_action_pressed("slide")
	

func getHealth():
	return health

func _ready() -> void:
	health = 100
	slide_cool = 0.0
	has_cooled = true
	is_dead = false

func _physics_process(delta: float) -> void:
	getInput()
	if is_dead:
		$AnimatedSprite.play("death")
		$AnimationPlayer.play("new_animation")
	else:
		if velocity.length() > 0 and is_sliding and has_cooled:
			$AnimatedSprite.play("slide")
		elif velocity.length() > 0:
			$AnimatedSprite.play("run")
		else:
			$AnimatedSprite.play("idle")
	
	if input_x != 0 and input_y != 0:
		velocity.x = velocity.x * 0.75
		velocity.y = velocity.y * 0.75

	if velocity.x < 0:
		animated_sprite.flip_h = true
	elif velocity.x > 0:
		animated_sprite.flip_h = false
		
	move_and_slide()
	#loll
	
func take_damage(damage):
	health -= 10

func die():
	is_dead = true

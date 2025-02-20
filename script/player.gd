extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var world_interaction: CollisionShape2D = $world_interaction
@onready var collision_shape: CollisionShape2D = $CollisionShape

var sliding_timer = 0.0
var is_sliding = false
const SPEED = 300.0
const SPRINT_SPEED = 750.0
const SLIDE_SPEED = SPRINT_SPEED * 10.0
const SLIDE_DECREMENT = 10
const SLIDE_INTERVAL = 0.01

var health
var slide_timer = 0.0  

func getHealth():
	return health

func _ready() -> void:
	health = 100

func _physics_process(delta: float) -> void:

<<<<<<< Updated upstream
	var input_x = Input.get_axis("left", "right")
	var input_y = Input.get_axis("up", "down")
	var move_dir = Vector2(input_x, input_y)
=======
	var directionx := Input.get_axis("left", "right")
	var directiony := Input.get_axis("up", "down")
	var sprint := Input.is_action_pressed("sprint")
	var slide := Input.is_action_just_pressed("slide")
>>>>>>> Stashed changes
	
	var is_sprinting := Input.is_action_pressed("sprint")
	var is_sliding := Input.is_action_pressed("slide")
	
	var speed = SPEED
	if is_sprinting:
		speed = SPRINT_SPEED
		animated_sprite.speed_scale = 2
	else:
<<<<<<< Updated upstream
		animated_sprite.speed_scale = 1
=======
		current_speed = SPEED
		animated_sprite.speed_scale  = 1
	if slide and sprint: # animation gia to slide
			animated_sprite.play("slide")
			current_speed = SLIDE_SPEED
			# tha to afjanei gia liga ms to speed kai meta tha to mionei stadiaka kai proodeutika
			#while Input.action_press("slide"):
				#tha mionei to speed nexri na stamatisei teleios (speed = 0) oso krataei patimeno to space
			# otan to afinei to space apistrefei sto run speed
>>>>>>> Stashed changes
	
	if move_dir != Vector2.ZERO:
		move_dir = move_dir.normalized()
		
<<<<<<< Updated upstream
		# elenxos gia slide otan kanei sprint
		if is_sliding and is_sprinting:
			if animated_sprite.animation != "slide":
				animated_sprite.animation = "slide"
=======
	if velocity.x != 0 or velocity.y != 0:
	
		animated_sprite.play("run")
>>>>>>> Stashed changes
				
				animated_sprite.play()
				speed = SLIDE_SPEED
				print("Slide animation started, speed set to ", speed)
			# mionei taxitita oso krataei to koumpi tou slide
			
			# THELEI WHILE GIA NA MIONEI STADIAKA TO DIRECTION SPEED
			
			if Input.is_action_pressed("slide"):
				slide_timer += delta
				if slide_timer >= SLIDE_INTERVAL:
					speed -= SLIDE_DECREMENT
					slide_timer -= SLIDE_INTERVAL
					print("Sliding: speed decreased to ", speed)
			else:
				# SPRINT_SPEED
				speed = SPRINT_SPEED
				slide_timer = 0.0
				print("Slide released: speed reset to ", speed)
		else:
			# alios paizei to run
			if animated_sprite.animation != "run":
				animated_sprite.animation = "run"
				
				animated_sprite.play()
		
		velocity = move_dir * speed
	else:
		velocity = Vector2.ZERO
		if animated_sprite.animation != "idle":
			animated_sprite.animation = "idle"
			animated_sprite.play()
	
	if input_x < 0:
		animated_sprite.flip_h = true
	elif input_x > 0:
		animated_sprite.flip_h = false
		
	move_and_slide()
	
	
func take_damage(damage):
	health -= 10

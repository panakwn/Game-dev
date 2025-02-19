extends State
class_name EnemyIdle

var move_direction: Vector2
var wander_time: float
var chill_time: float
@export var enemy: CharacterBody2D
var player: CharacterBody2D

#@onready var enemy: CharacterBody2D = $"../.."

@export var move_speed:= 100

func RandomizeWander():
	move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1, 3)
	chill_time = randf_range(5, 7)
	print(wander_time)
func Enter():
	RandomizeWander()
	player = get_tree().get_first_node_in_group("Player")

func Update(delta: float):
	if chill_time > 0:
		chill_time -= delta
	elif wander_time > 0:
		wander_time -= delta
	else:
		RandomizeWander()
		
func PhysicsUpdate(delta: float):
	#print("there")
	if enemy:
		if chill_time > 0:
			enemy.velocity.x = 0
			enemy.velocity.y = 0
		else:
			enemy.velocity = move_direction * move_speed
			print("move direction ", move_direction)
			print(enemy.velocity)
		var direction = player.global_position - enemy.global_position
		
		if direction.length() < 700 :
			Transitioned.emit(self, "Follow")
			
			
func Exit():
	pass
	

extends State
class_name EnemyFollow

var move_direction: Vector2
var wander_time: float
var chill_time: float
@export var enemy: CharacterBody2D
var player: CharacterBody2D
#@onready var enemy: CharacterBody2D = $"../.."
@export var move_speed:= 100

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func PhysicsUpdate(delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 300:
		enemy.velocity= direction.normalized() *move_speed
	else:
		enemy.velocity = Vector2()
	if direction.length() > 1000:
		Transitioned.emit(self, "EnemyIdle")	
	
func Exit():
	pass

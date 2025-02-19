extends State


@export var enemy: CharacterBody2D
var player: CharacterBody2D


func Enter():
	player = get_tree().get_first_node_in_group("Player")

func PhysicsUpdate(delta: float):
	var direction = player.global_position - enemy.global_position
	if direction.length() > 300:
		Transitioned.emit(self, "Follow")	
	else:
		enemy.attack()
		
	
func Exit():
	pass

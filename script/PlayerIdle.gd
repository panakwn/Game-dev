extends State
class_name PlayerIdle

@export var player: CharacterBody2D

func Enter():
	pass
	

func Exit():
	pass

func Update(delta: float):
	if player.slide_cool > 0:
		player.slide_cool -= delta * 1.5

func PhysicsUpdate(_delta: float):
	if player.move_dir.length() > 0  and player.is_sprinting:
		Transitioned.emit(self, "Sprint")
	elif player.move_dir.length() > 0:
		Transitioned.emit(self, "Walk")

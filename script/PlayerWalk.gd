extends State
class_name PlayerWalk

@export var player: CharacterBody2D

const SPEED = 300.0

func Enter():
	pass
	

func Exit():
	pass

func Update(delta: float):
	if player.slide_cool > 0:
		player.slide_cool -= delta * 0.7

func PhysicsUpdate(_delta: float):
	player.animated_sprite.speed_scale = 1
	player.velocity = player.move_dir * SPEED
	if !player.move_dir.length() > 0:
		Transitioned.emit(self, "Idle")
	elif player.move_dir.length() > 0 and player.is_sprinting:
		Transitioned.emit(self, "Sprint")

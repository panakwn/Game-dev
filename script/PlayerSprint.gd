extends State
class_name PlayerSprint

@export var player: CharacterBody2D

const SPEED = 750.0

func Enter():
	pass
	

func Exit():
	pass

func Update(delta: float):
	if player.slide_cool > 0:
		player.slide_cool -= delta * 0.2

func PhysicsUpdate(_delta: float):
	player.animated_sprite.speed_scale = 2
	player.velocity = player.move_dir * SPEED
	if !player.move_dir.length() > 0:
		Transitioned.emit(self, "Idle")
	elif player.move_dir.length() > 0 and player.is_sprinting and player.is_sliding and !(player.slide_cool > 0):
		Transitioned.emit(self, "Slide")
	elif player.move_dir.length() > 0 and !player.is_sprinting:
		Transitioned.emit(self, "Walk")

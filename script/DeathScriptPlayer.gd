extends State
class_name PlayerDeath

@export var player: CharacterBody2D

var death_time
func Enter():
	player.die()
	death_time = 3

func Exit():
	pass

func Update(delta: float):
	if death_time > 0:
		death_time -= delta
	else:
		get_tree().reload_current_scene()#reset game

func PhysicsUpdate(delta: float):
	player.velocity = Vector2.ZERO
	player.animated_sprite.speed_scale = 1
	
	

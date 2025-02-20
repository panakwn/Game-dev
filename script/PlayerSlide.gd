extends State
class_name PlayerSlide

@export var player: CharacterBody2D

const SPEED = 2000.0
const DRAG_RATE = 2

var slide_time
var drag

func Enter():
	slide_time = 0.5
	drag = 1
	player.has_cooled = true

func Exit():
	player.has_cooled = false

func Update(delta: float):
	if slide_time > 0:
		if player.slide_cool < 2:
			player.slide_cool += delta * 4
		slide_time -= delta
		if drag > 0:
			drag -= delta * DRAG_RATE
	else:
		if player.move_dir.length() > 0 and player.is_sprinting:
			Transitioned.emit(self, "Sprint")

func PhysicsUpdate(_delta: float):
	player.animated_sprite.speed_scale = 1
	player.velocity = player.move_dir * SPEED * drag
	if !player.move_dir.length() > 0:
		Transitioned.emit(self, "Idle")
	elif player.move_dir.length() > 0 and player.is_sprinting and !player.is_sliding:
		Transitioned.emit(self, "Sprint")
	elif player.move_dir.length() > 0 and !player.is_sprinting:
		Transitioned.emit(self, "Walk")

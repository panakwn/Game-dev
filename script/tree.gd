extends Node2D

@onready var world_interaction: CollisionShape2D = $world_interaction
@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

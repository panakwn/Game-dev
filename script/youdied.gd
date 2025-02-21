extends Sprite2D

var player: CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	player = get_tree().get_first_node_in_group("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if  player.is_dead:
		visible = true

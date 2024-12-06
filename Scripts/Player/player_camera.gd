extends Camera2D

@onready var player: CharacterBody2D = get_node("../Player")

var bordered = 1

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta: float) -> void:
	var camera_left_bound = global_position.x - get_viewport_rect().size.x / 2 / zoom.x

	if (player.global_position.x < camera_left_bound + 4 && Input.is_action_pressed("move_left")):
		player.global_position.x = camera_left_bound + 4
		#WILL NEED THIS IF I MOVE THE CAMERA FUNCTIONS TO PHYSICS MOVEMENT LATER: player.SPEED = 0
		return


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player.global_position.x > global_position.x:
		global_position.x = player.global_position.x

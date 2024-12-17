@tool
extends Area2D
class_name Pipe_Entrance

@export var Horizontal: bool = true:
	set(new_value):
		Horizontal = new_value
		_update_rotation()
		
@export_enum("Overworld", "Underworld") var pipeIndex: int

@onready var player: CharacterBody2D = $"../../../../Player"
@onready var camera: Camera2D = $"../../../../Camera2D"
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	_update_rotation()

func _update_rotation() -> void:
	if Horizontal:
		rotation_degrees = 0
	else:
		rotation_degrees = 90
		
func enter_pipe() -> void:
	#TODO: enter pipe animation
	if pipeIndex == 0:
		player.position = Vector2(712, 74)
		camera.position = Vector2(800, 153)
	elif pipeIndex == 1:
		player.position = Vector2(2624, -40)
		camera.position.y = -90
	
func _process(delta: float) -> void:
	var overlapping_areas = self.get_overlapping_areas()
	if overlapping_areas:
		
		var body = overlapping_areas[0].get_parent()	
		var sprite: AnimatedSprite2D = body.sprite
		if body is Player and ((Horizontal and body.is_crouching) or (not Horizontal and sprite.animation == "Walk" and body.velocity.y == 0)) and not body.entering_pipe:
			body.entering_pipe = true
			enter_pipe()
			body.entering_pipe = false
	

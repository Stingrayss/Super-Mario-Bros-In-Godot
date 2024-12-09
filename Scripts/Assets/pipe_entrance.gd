@tool
extends Area2D
class_name Pipe_Entrance

@export var Horizontal: bool = true:
	set(new_value):
		Horizontal = new_value
		_update_rotation()

@onready var player: CharacterBody2D = $"../Player"
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	_update_rotation()

func _update_rotation() -> void:
	if Horizontal:
		rotation_degrees = 0
	else:
		rotation_degrees = 90
		
func enter_pipe() -> void:
	#TODO: enter pipe animation and warp
	pass
	
func _process(delta: float) -> void:
	var overlapping_areas = self.get_overlapping_areas()
	if overlapping_areas:
		var body = overlapping_areas[0].get_parent()
		if body is Player and body.is_crouching and not body.entering_pipe:
			body.entering_pipe = true
			enter_pipe()
	

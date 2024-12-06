extends StaticBody2D

class_name BaseBlock

@onready var Block = $AnimatedSprite2D
@onready var hitBlock = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.position)
	

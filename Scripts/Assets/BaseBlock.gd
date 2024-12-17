extends StaticBody2D

class_name BaseBlock

@onready var hitBlock = $HitBlock

var isActivated: bool = false

func bump():
	var bump_tween = get_tree().create_tween()
	bump_tween.tween_property(self, "position", position + Vector2(0, -5), .12)
	bump_tween.chain().tween_property(self, "position", position, .12)

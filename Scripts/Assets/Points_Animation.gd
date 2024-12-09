extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var label_tween = get_tree().create_tween()
	label_tween.tween_property(self, "position", position + Vector2(0, - 10), .4)
	label_tween.tween_callback(queue_free)

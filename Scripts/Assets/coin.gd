extends Area2D

func _on_area_entered(area: Area2D) -> void:
	var body = area.get_parent()
	if body is Player:
		Game.coins += 1
		Game.score += 200
		queue_free()

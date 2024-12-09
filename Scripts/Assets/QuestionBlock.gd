extends BaseBlock

func _on_area_2d_area_entered(area: Area2D) -> void:
	var body = area.get_parent()
	print(body)
	if body is Player and not isActivated:
		bump()
		isActivated = true

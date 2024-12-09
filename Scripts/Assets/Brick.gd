extends BaseBlock

func _on_area_2d_area_entered(area: Area2D) -> void:
	var body = area.get_parent()
	if body is Player:
		if body.state != Player.State.SMALL:
			pass
			#TODO: Break block
		else:
			bump()

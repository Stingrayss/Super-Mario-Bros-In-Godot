extends BaseBlock

@onready var animatedSprite = $AnimatedSprite2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	var body = area.get_parent()
	if body is Player and not isActivated:
		bump()
		Game.score += 200
		isActivated = true
		animatedSprite.visible = false
		hitBlock.visible = true

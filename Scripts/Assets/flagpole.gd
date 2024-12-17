extends Node2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	var body = area.get_parent()
	
	if body is Player:
		AudioManager.stop_music()
		Game.change_level("Level1-1", "res://Scenes/Levels/MainMenu.tscn")
		

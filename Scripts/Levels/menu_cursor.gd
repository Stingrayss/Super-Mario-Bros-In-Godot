extends TextureRect

var menuPosition = 0

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("select")):
		if (menuPosition == 1):
			menuPosition = 0
			set_position(Vector2(73, -65))
		else:
			set_position(Vector2(73, -49))
			menuPosition = 1
		
	if(Input.is_action_just_released("start")):
		get_viewport().set_input_as_handled()
		
		Game.reset_game()
	
		Game.change_level("MainMenu", "res://Scenes/Levels/Transition.tscn")

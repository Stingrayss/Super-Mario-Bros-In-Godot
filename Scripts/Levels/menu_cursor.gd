extends TextureRect

var menuPosition = 0

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("select")):
		if (menuPosition == 1):
			menuPosition = 0
			set_position(Vector2(73, 146))
		else:
			set_position(Vector2(73, 162))
			menuPosition = 1
		
	if(Input.is_action_just_released("start")):
		get_viewport().set_input_as_handled()
		#unload menu and load level transition
		var root_node = get_tree().get_root()
		var scene_node = root_node.get_node("MainMenu")
		scene_node.queue_free()

		#load level
		var newScene = load("res://Scenes/Levels/Transition.tscn")
		var newScene_node = newScene.instantiate()	
		root_node.add_child(newScene_node)

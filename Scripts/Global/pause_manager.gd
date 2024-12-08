extends Node

@onready var coin_texture: AnimatedTexture = $"../Camera2D/HUD/HUDContainer/UI/BottomLine/Coins/Coin".texture

func _input(_event: InputEvent) -> void:
	if(Input.is_action_just_released("start") && get_tree().paused):
		get_viewport().set_input_as_handled()
		get_tree().paused = false
		coin_texture.pause = false
		AudioManager.play_pause_sfx()

extends Control

@onready var Coin: TextureRect = $HUD/HUDContainer/UI/BottomLine/Coins/Coin
@onready var Transition_Coin: TextureRect = $HUD/HUDContainer/UI/BottomLine/Coins/Transition_Coin

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Coin.visible = false
	Transition_Coin.visible = true
	$Load_Timer.start()

func _on_load_timer_timeout() -> void:
	Coin.visible = true
	Transition_Coin.visible = false
	var root_node = get_tree().get_root()
	var scene_node = root_node.get_node("Transition")
	scene_node.queue_free()

	#load level
	var newScene = load("res://Scenes/Levels/level_1_1.tscn")
	var newScene_node = newScene.instantiate()	
	root_node.add_child(newScene_node)
	Game.level = 1

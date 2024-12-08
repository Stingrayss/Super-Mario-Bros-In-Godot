extends Node2D

#game instance variables
var score = 0
var coins = 0 
var level = 1 #0 = menu, 1 = 1-1
var time = 400
var lives = 3

@onready var time_label: Label = $Camera2D/HUD/HUDContainer/UI/BottomLine/Time
@onready var score_label: Label = $Camera2D/HUD/HUDContainer/UI/BottomLine/Score

@onready var camera := get_viewport().get_camera_2d()

var time_frame_count = 0

var camera_spawnpoint = Vector2(128, -89)
func reset_game():
	score = 0
	coins = 0 
	level = 1 #0 = menu/transition, 1 = 1-1
	time = 400
	lives = 3

func change_level(unload_name, load_name):
	var root_node = get_tree().get_root()
	var scene_node = root_node.get_node(unload_name)
	scene_node.queue_free()
	#load level
	var newScene = load(load_name)
	var newScene_node = newScene.instantiate()	
	root_node.add_child(newScene_node)
		
	if load_name == "res://Scenes/Levels/level_1_1.tscn":
		level = 1
	else:
		level = 0

# Helper Functions
func update_time() -> void:
	time_frame_count += 1
	if (time_frame_count == 24):
		Game.time -= 1.00
		time_frame_count = 0
	
func get_score():
	var score = ""
	var digits = len(str(Game.score))
	for i in range(6 - digits):
		score += '0'
	score += str(Game.score)
	return score

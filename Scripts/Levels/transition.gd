extends Control

@onready var Coin: TextureRect = $Camera2D/HUD/HUDContainer/UI/BottomLine/Coins/Coin
@onready var Transition_Coin: TextureRect = $Camera2D/HUD/HUDContainer/UI/BottomLine/Coins/Transition_Coin
@onready var Lives: Label = $Lives
@onready var time_label: Label = $"Camera2D/HUD/HUDContainer/UI/BottomLine/Time"
@onready var score_label: Label = $"Camera2D/HUD/HUDContainer/UI/BottomLine/Score"

func update_HUD():
	var score = Game.get_score()
	time_label.text = str(Game.time)
	score_label.text = str(score)
	Lives.text = str(Game.lives)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_HUD()	
	Coin.visible = false
	Transition_Coin.visible = true
	$Load_Timer.start()	
	

func _on_load_timer_timeout() -> void:
	Coin.visible = true
	Transition_Coin.visible = false
	
	Game.change_level("Transition", "res://Scenes/Levels/level_1_1.tscn")

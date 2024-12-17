extends Node2D

@onready var time_label: Label = $"Camera2D/HUD/HUDContainer/UI/BottomLine/Time"
@onready var score_label: Label = $"Camera2D/HUD/HUDContainer/UI/BottomLine/Score"
@onready var coin_label: Label = $"Camera2D/HUD/HUDContainer/UI/BottomLine/Coins"
@onready var coin_texture: AnimatedTexture = $"Camera2D/HUD/HUDContainer/UI/BottomLine/Coins/Coin".texture

@onready var player: CharacterBody2D = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#load the user's top score
	AudioManager.play_music()
	Game.time_label = $"Camera2D/HUD/HUDContainer/UI/BottomLine/Time"
	Game.score_label = $"Camera2D/HUD/HUDContainer/UI/BottomLine/Score"
	Physics._level = self
	
func update_HUD():
	if player.isDead:
		return
	Game.update_time()
	var score = Game.get_score()
	var coins = Game.get_coins()
	time_label.text = str(Game.time)
	score_label.text = score
	coin_label.text = coins
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_HUD()

# pause event
func _input(_event: InputEvent) -> void:
	if(Input.is_action_just_released("start") && Game.level > 0):		
		get_tree().paused = true
		coin_texture.pause = true
		AudioManager.play_pause_sfx()

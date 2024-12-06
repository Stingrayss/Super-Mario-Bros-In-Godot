extends Node2D

@onready var time_label: Label = $"PlayerCamera/HUD/HUDContainer/UI/BottomLine/Time"
@onready var coin_texture: AnimatedTexture = $"PlayerCamera/HUD/HUDContainer/UI/BottomLine/Coins/Coin".texture

var time_frame_count = 0

# Helper Functions
func update_time() -> void:
	time_label.text = str(Game.time)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#load the user's top score
	AudioManager.play_music()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#time logic
	time_frame_count += 1
	if (time_frame_count == 24):
		Game.time -= 1.00
		update_time()
		time_frame_count = 0
	pass

# pause event
func _input(_event: InputEvent) -> void:
	if(Input.is_action_just_released("start") && Game.level > 0):		
		get_tree().paused = true
		coin_texture.pause = true
		AudioManager.play_pause_sfx()

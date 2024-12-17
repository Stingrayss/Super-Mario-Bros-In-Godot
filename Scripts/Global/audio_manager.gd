extends Node

@export var mute: bool = false
@onready var music_position: float = 0.00
@onready var music_paused: bool = false

func play_music() -> void:
	$Music.play()
		
func play_pause_sfx() -> void:
	if (get_tree().paused):
		pause_music()
	$Pause.play()
	
func play_death_sfx() -> void:
	if (music_paused):
		$Music.stop()
	$Dying.play()
	
func pause_music() -> void:
	music_paused = true
	music_position = $Music.get_playback_position()
	$Music.stop()
	
func stop_music() -> void:
	$Music.stop()
	
func resume_music() -> void:
	$Music.play(music_position)

func _on_pause_finished() -> void:
	if (!get_tree().paused):
		music_paused = false
		resume_music()

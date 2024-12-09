extends Enemy

@onready var death_timer: Timer = $Death_Timer

func stomp():
	sprite.play("Stomped")
	stomped = true
	
	set_collision_layer_value(3, false)
	set_collision_mask_value(1, false)
	set_collision_mask_value(3, false)
	
	Game.score += 100
	
	death_timer.start()	

func _on_death_timer_timeout() -> void:
	queue_free()

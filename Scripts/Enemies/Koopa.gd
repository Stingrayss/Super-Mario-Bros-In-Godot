extends Enemy

@onready var shell_collision = preload("res://Assets/Spritesheets/Enemies/shell_collision.tres")
@onready var body_collision = preload("res://Assets/Spritesheets/Enemies/body_collision.tres")

@onready var hitbox: CollisionShape2D = $Hitbox/Collision
@onready var collision: CollisionShape2D = $Collision

func _ready():
	collision.shape = body_collision

func stomp():
	if !shell:
		Game.score += 100
		sprite.play("Shell")
		shell = true
		
		collision.shape = shell_collision
		hitbox.shape = shell_collision
		
		set_collision_mask_value(1, false)
		set_collision_layer_value(3, false)
		set_collision_layer_value(4, true)	
		
	elif pushed:
		pushed = false
		MOVEMENT_SPEED = 0.00
	
	else:
		Game.score += 500
		push()

func push():
	Game.score += 400
	pushed = true
	var movement_direction = 1 if player.position.x <= global_position.x else -1
	MOVEMENT_SPEED = -movement_direction * 200.0

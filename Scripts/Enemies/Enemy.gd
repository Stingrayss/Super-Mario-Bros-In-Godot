extends CharacterBody2D

class_name Enemy

@onready var player: CharacterBody2D = get_node("../../Player")

@onready var MOVEMENT_SPEED = Physics.MOVE_SPEED
@onready var FALL_SPEED = Physics.MAX_FALL_SPEED

@onready var sprite: AnimatedSprite2D = $Sprite
@export var is_facing_left: bool = true

const DESPAWN_TIME_SEC: float = 1.0

var stomped: bool = false
var shell: bool = false
var pushed: bool = false

var last_x_position: float = 0.00

func kill():
	queue_free()

func _physics_process(delta):
	var collision = get_last_slide_collision()
	
	if pushed and last_x_position == position.x:
		MOVEMENT_SPEED = -MOVEMENT_SPEED
	
	if collision:
		var normal = collision.get_normal()
		if normal.x:
			is_facing_left = normal.x < 0

	if !stomped and !shell or pushed:
		velocity.x = -MOVEMENT_SPEED if is_facing_left else MOVEMENT_SPEED
	else:
		velocity.x = 0.0
	
	if pushed:
		last_x_position = position.x	

	velocity.y = min(Physics.MAX_FALL_SPEED, velocity.y + Physics.GRAVITY * delta)

	move_and_slide()
	
func _on_hitbox_area_entered(area: Area2D):
	var body = area.get_parent()

	if body is Player and body.has_cooldown:
		return
		
			
	if pushed and body is Enemy:
		body.kill()
		MOVEMENT_SPEED = MOVEMENT_SPEED

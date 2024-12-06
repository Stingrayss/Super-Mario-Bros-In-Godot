extends CharacterBody2D

class_name Player

@export var SPEED: float = 350.0
const JUMP_VELOCITY = -300.0

const MIN_SPEED = 4.453125
const MAX_SPEED = 153.75
const MAX_WALK_SPEED = 93.75
const MAX_FALL_SPEED = 270.0
const MAX_FALL_SPEED_CAP = 240.0
const MIN_SLOW_DOWN_SPEED = 33.75

const WALK_ACCELERATION = 133.59375
const RUN_ACCELERATION = 200.390625
const WALK_FRICTION = 182.8125
const SKID_FRICTION = 365.625

# Jump physics vary based on horizontal speed thresholds
const JUMP_SPEED = [-240.0, -240.0, -300.0]
const LONG_JUMP_GRAVITY = [450.0, 421.875, 562.5]
const GRAVITY = [1575.0, 1350.0, 2025.0]

const SPEED_THRESHOLDS = [60, 138.75]

const STOMP_SPEED = 240.0
const STOMP_SPEED_CAP = -60.0

const COOLDOWN_TIME_SEC = 3.0

enum STATE {SMALL, BIG, FIRE}

#var MARIO_POWER = STATE.SMALL:
	#set(value):
		#if STATE != value:
			#STATE = value
			#
			#match STATE:
				#STATE.SMALL:
					#transition_sprite.animation = "shrink"
				#STATE.BIG:
					#transition_sprite.animation = "grow"
			#
			#transition_sprite.flip_h = sprite.flip_h
			#animation_player.play("transition")
			#
			#Physics.disable()

var lives = 3
var isDead = false

func _physics_process(delta: float) -> void:	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if direction == -1:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()	

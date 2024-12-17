extends CharacterBody2D

class_name Enemy

@onready var player: CharacterBody2D = get_node("../../Player")
@onready var points_animation = preload("res://Scenes/Assets/Points_Animation.tscn")

@onready var MOVEMENT_SPEED = Physics.MOVE_SPEED
@onready var FALL_SPEED = Physics.MAX_FALL_SPEED

@onready var sprite: AnimatedSprite2D = $Sprite
@export var is_facing_left: bool = true
@onready var in_range: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

const DESPAWN_TIME_SEC: float = 1.0

var stomped: bool = false
var shell: bool = false
var pushed: bool = false

var last_x_position: float = 0.00

func kill():
	queue_free()

func _physics_process(delta):
	if not in_range.is_on_screen():
		return
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
		
	if shell and body is Enemy:
		body.is_facing_left = not body.is_facing_left
			
	if pushed and body is Enemy:
		body.die_from_hit()
		MOVEMENT_SPEED = MOVEMENT_SPEED


func die_from_hit():
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	
	rotation_degrees = 180
	MOVEMENT_SPEED = 0
	FALL_SPEED = 0
	
	var die_tween = get_tree().create_tween()
	die_tween.tween_property(self, "position", position + Vector2(0, -25), .2)
	die_tween.chain().tween_property(self, "position", position + Vector2(0, 500), 2)
	
	var points_animation = points_animation.instantiate()
	points_animation.position = self.position + Vector2(-20, -20)
	get_tree().root.add_child(points_animation)

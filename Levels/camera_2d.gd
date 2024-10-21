extends Camera2D

@export var speed: float = 1000.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Viewport window
	#Window.size = Vector2i(256, 240)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_physical_key_pressed(KEY_LEFT)):
			position.x -= speed * delta
	if Input.is_physical_key_pressed(KEY_RIGHT):
		position.x += speed * delta
	if Input.is_physical_key_pressed(KEY_UP):
		position.y -= speed * delta
	if Input.is_physical_key_pressed(KEY_DOWN):
		position.y += speed * delta

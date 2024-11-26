extends Node

enum MARIO_STATES {IDLE, WALKING, RUNNING, JUMPING, TURNING, DYING, FLAGPOLE, BOTTOMFLAGPOLE}
var MARIO_STATUS = MARIO_STATES.IDLE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	MARIO_STATUS = MARIO_STATES.IDLE
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	#change sprites based on MARIO_STATUS
	if (MARIO_STATUS == MARIO_STATES.IDLE):
		pass
	if (MARIO_STATUS == MARIO_STATES.WALKING):
		pass
	if (MARIO_STATUS == MARIO_STATES.RUNNING):
		pass
	if (MARIO_STATUS == MARIO_STATES.JUMPING):
		pass
	if (MARIO_STATUS == MARIO_STATES.TURNING):
		pass
	if (MARIO_STATUS == MARIO_STATES.DYING):
		pass
	if (MARIO_STATUS == MARIO_STATES.FLAGPOLE):
		pass
	if (MARIO_STATUS == MARIO_STATES.BOTTOMFLAGPOLE):
		pass
	
	return
	

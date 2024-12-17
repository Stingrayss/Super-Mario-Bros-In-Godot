extends Node2D

@onready var top_score_label = $"TopScoreContainer/TopScore"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Game.score > Game.top_score:
		Game.top_score = Game.score
	
	top_score_label.text = "TOP- " + Game.get_score(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends Control

var score: int = 0
var increment: int = 10

@onready var score_label:Label = $ScoreLabel
@onready var clicker_button:Button = $ClickerButton

@export var coin_scene:PackedScene

# Called upon initialization
func _ready() -> void:
	score = 0

# Continuously called during main loop
func _process(delta:float) -> void:
	pass

# Add the argument to the score and label
func change_score(change:int) -> int:
	score += change
	score_label.text = "Score: " + str(score)
	return score

# Add the argument to the increment
func change_increment(change:int) -> int:
	increment += change
	return increment

func click() -> void:
	change_score(increment)
	var coin = coin_scene.instantiate()
	add_child(coin)
	coin.global_position = get_viewport().get_mouse_position()

# Receever function for button
#func _on_pressed() -> void:
	#click()
	



func _on_clicker_button_button_down() -> void:
	print("coin")
	click()

extends Control

var score: int = 0
var increment: int = 10
var upgrade_cost: int = 100
var upgrade_auto_cost:int = 250
@onready var score_label:Label = $ScoreLabel
@onready var upgrade_button:Button = $UpgradeButton
@onready var auto_button:Button = $AutoClickerButton
@onready var auto_timer:Timer = $"AutoClickerButton/Autoclicker Timer"


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

# Rciever function for button
func _on_pressed() -> void:
	click()

# If the player has a high enough score, increase the increment,
# decrease the score, and raise the next upgrade cost
func _on_upgrade_button_pressed() -> void:
	if score >= upgrade_cost:
		change_score(-1 * upgrade_cost)
		change_increment(increment)
		upgrade_cost *= 2
		upgrade_button.text = "Upgrade Clicker\nCost: " + str(upgrade_cost)
		



func _on_autoclicker_timer_timeout() -> void:
	click()


func _on_auto_clicker_button_pressed() -> void:
	if score >= upgrade_auto_cost:
		change_score(-1 * upgrade_auto_cost)
		upgrade_auto_cost *= 2
		auto_button.text = "Upgrade Autoclicker\nCost: " + str(upgrade_auto_cost)
		if auto_timer.is_stopped():
			auto_timer.start()
		else:
			auto_timer.wait_time /= 2

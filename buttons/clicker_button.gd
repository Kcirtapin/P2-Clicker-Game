extends Button

@onready var upgrade_button:Button = $UpgradeButton
var upgrade_cost: int = 100
@export var game_manager:Node 

func set_upgrade_cost(new_cost:int) -> void:
	upgrade_cost = new_cost
	upgrade_button.text = "Upgrade Clicker\nCost: " + str(new_cost)

func _on_upgrade_button_pressed() -> void:
	if game_manager.score >= upgrade_cost:
		game_manager.change_score(-1 * upgrade_cost)
		game_manager.change_increment(game_manager.increment)
		set_upgrade_cost(upgrade_cost*2)

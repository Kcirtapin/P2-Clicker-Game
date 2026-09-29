extends Button

@onready var upgrade_button:Button = $UpgradeButton
var upgrade_cost: int = 100
@export var game_manager:Node 

# Upgrades the clicker button if score is high enough. Subtracts from score
# Updates label with new upgrade price
func _on_upgrade_button_pressed() -> void:
	if game_manager.score >= upgrade_cost:
		game_manager.change_score(-1 * upgrade_cost)
		game_manager.change_increment(game_manager.increment)
		upgrade_cost = upgrade_cost*2
		upgrade_button.text = "Upgrade Clicker\nCost: " + str(upgrade_cost)

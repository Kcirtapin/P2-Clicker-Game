extends Button

signal upgrade_pressed(cost:int)
@onready var upgrade_button:Button = $UpgradeButton
var upgrade_cost: int = 100

func set_upgrade_cost(new_cost:int) -> void:
	upgrade_cost = new_cost
	upgrade_button.text = "Upgrade Clicker\nCost: " + str(new_cost)

func _on_upgrade_button_pressed() -> void:
	upgrade_pressed.emit(upgrade_cost)

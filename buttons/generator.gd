extends Button

@export var generator_cost:int = 250
@export var strength:int = 1
@export var display_name:String = "Generator"
@export var game_manager:Node
@export var dand_seed:PackedScene

@onready var auto_timer:Timer = $"Autoclicker Timer"

var original_strength:int

# On init, displays correct name and cost, sets original strength
func _ready() -> void:
	text = display_name + "\nCost: " + str(generator_cost)
	original_strength = strength

# Adds to score and spawns a dandelion seed for each generator bought
func _on_autoclicker_timer_timeout() -> void:
	game_manager.change_score(strength)
	for num in range(strength / original_strength):
		add_child(dand_seed.instantiate())

# Checks if the player has enough coins for the generator.
# If so, subtracts the coins from score.
# Updates generator label
# If there are no current generators, start the timer.
func _on_pressed() -> void:
	if auto_timer.is_stopped() and game_manager.score >= generator_cost:
		game_manager.change_score(-1 * generator_cost)
		auto_timer.start()
		text = "Generates " + str(strength) + " coins per " + str(auto_timer.wait_time) + "s"
	elif game_manager.score >= generator_cost:
		game_manager.change_score(-1 * generator_cost)
		strength += original_strength
		text = "Generates " + str(strength) + " coins per " + str(auto_timer.wait_time) + "s"

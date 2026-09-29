extends RigidBody2D

# Plays the animation of the sprite
func _ready() -> void:
	$AnimatedSprite2D.play()

# Removes the sprite when it leaves the screen
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

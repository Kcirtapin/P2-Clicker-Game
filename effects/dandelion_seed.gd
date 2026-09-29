extends RigidBody2D


func _ready() -> void:
	$AnimatedSprite2D.play()
	constant_force.x += randi_range(-300,300)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

extends Node2D
const ARROW = preload("res://Scenes/arrow.tscn")

func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("Click"):
		var arrow = ARROW.instance()
		arrow.position = $Position2D.global_position
		get_parent().add_child(arrow)

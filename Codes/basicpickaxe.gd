extends Node2D


var damage = 1

func _input(event):
	$workzone/CollisionShape2D.set_deferred("disabled", true)
	if Input.is_action_just_pressed("Click"):
		if $Sprite.flip_h == false:
			$workzone/CollisionShape2D.set_deferred("disabled", false)
			$AnimationPlayer.play("work")
			yield($AnimationPlayer, "animation_finished")
		else:
			$workzone/CollisionShape2D.set_deferred("disabled", false)
			$AnimationPlayer.play("work1")
			yield($AnimationPlayer, "animation_finished")
		$workzone/CollisionShape2D.set_deferred("disabled", true)

func _process(delta):
	if get_viewport().get_mouse_position().x > get_viewport_rect().size.x / 2:
		$Sprite.flip_h = false
		$Sprite.offset.x = 0
		$workzone/CollisionShape2D.position.x = 15
	else:
		$Sprite.flip_h = true
		$Sprite.offset.x = -16
		$workzone/CollisionShape2D.position.x = -15

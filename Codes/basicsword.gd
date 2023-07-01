extends Node2D

var damage = 5

func _input(event):
	$attackzone/CollisionShape2D.set_deferred("disabled", true)
	if Input.is_action_just_pressed("Click"):
		if $Sprite.flip_h == false:
			$attackzone/CollisionShape2D.set_deferred("disabled", false)
			$AnimationPlayer.play("attack")
			yield($AnimationPlayer, "animation_finished")
		else:
			$attackzone/CollisionShape2D.set_deferred("disabled", false)
			$AnimationPlayer.play("attack1")
			yield($AnimationPlayer, "animation_finished")
		$attackzone/CollisionShape2D.set_deferred("disabled", true)

func _process(delta):
	if get_viewport().get_mouse_position().x > get_viewport_rect().size.x / 2:
		$Sprite.flip_h = false
		$Sprite.offset.x = 0
		position.x = 2
		$attackzone/CollisionShape2D.position.x = 15
	else:
		$Sprite.flip_h = true
		$Sprite.offset.x = -16
		position.x = -2
		$attackzone/CollisionShape2D.position.x = -15


func _on_attackzone_body_entered(body):
	if body.is_in_group("Enemy"):
		body.take_damage()
		body.hp -= damage
	if body.is_in_group("Player"):
		body.hp -= damage

extends KinematicBody2D

var speed = 100
var velocity: Vector2
var hp = 100
var max_hp = 100
var satiety = 100
var max_satiety = 100

func _get_input():
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("D"):
		velocity.x = speed
	if Input.is_action_pressed("A"):
		velocity.x = -speed
	if Input.is_action_pressed("S"):
		velocity.y = speed
	if Input.is_action_pressed("W"):
		velocity.y = -speed
	
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)

func _animation():
	if velocity.x != 0 || velocity.y != 0:
		$AnimatedSprite.play("walk")
	if velocity.x == 0 && velocity.y == 0:
		$AnimatedSprite.play("idle")

func _direction():
	if get_viewport().get_mouse_position().x > get_viewport_rect().size.x / 2:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	_get_input()
	_animation()
	_direction()
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)

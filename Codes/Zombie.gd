extends KinematicBody2D

var speed = 100
var player_chase = false
var velocity = Vector2()
var hp = 100
onready var Player = get_parent().get_node("Player")

func _ready():
	player_chase = false
	$AnimatedSprite.play("idle")


func _physics_process(_delta):
	if player_chase == true:
		position += (Player.position - position) / speed
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")
	
	if (Player.position.x - position.x) < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	if hp <= 0:
		queue_free()
	move_and_collide(velocity)


func _on_Detection_body_entered(body):
	if body != self:
		player_chase = true

func _on_Detection_body_exited(body):
	player_chase = false

func take_damage():
	$AnimationPlayer.play("taking damage")

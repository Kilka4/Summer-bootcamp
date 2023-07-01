extends Control
onready var hp_bar = $MarginContainer/VBoxContainer/HBoxContainer/HPbar
onready var hp_label= $MarginContainer/VBoxContainer/HBoxContainer/HPLabel
onready var satiety_bar = $MarginContainer/VBoxContainer/HBoxContainer2/Satietybar
onready var satiety_label = $MarginContainer/VBoxContainer/HBoxContainer2/SatietyLabel
var max_hp 
var max_satiety
var hp
var satiety

func _process(delta):
	hp_bar.max_value = max_hp
	hp_bar.value = hp
	hp_label.text = str(hp)
	satiety_bar.max_value = max_satiety
	satiety_bar.value = satiety
	satiety_label.text = str(satiety)

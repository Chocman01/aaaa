extends MarginContainer


onready var play= $VBoxContainer/Play
onready var settings= $VBoxContainer/Settings
onready var exit = $VBoxContainer/Exit

func _ready():
	exit.connect("pressed", self, "_on_exit_pressed")
	play.connect("pressed", self, "_on_play_pressed")
func _on_exit_pressed():
	get_tree().quit()
func _on_play_pressed():
	get_tree().change_scene(("res://scenes/level01.tscn"))
	
	

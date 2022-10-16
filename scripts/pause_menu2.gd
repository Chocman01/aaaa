extends CanvasLayer
func _ready():
	get_tree().paused = true

func _on_Resume_pressed():
	get_tree().paused = false
	queue_free()





func _on_Main_Menu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/Main menu.tscn")

extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/OptionsMenu.tscn")


func _on_quit_pressed():
	get_tree().quit()

extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/PlaySolo or Multi Menu/PlayMenu.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/OptionsMenu.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_texture_button_pressed():
	get_tree().quit()

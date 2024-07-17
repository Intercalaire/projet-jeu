extends Node2D

@onready var cursor = $"."
@onready var pause_menu = $GUI/InputSettings

var game_paused = true
var mouse = load("res://Scenes/Character/mouse/mouse viseur grand.png")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Input.set_custom_mouse_cursor(mouse)


func _unhandled_input(event):
	if event.is_action_pressed("paused"):
		game_paused = !game_paused
		if game_paused:
			Engine.time_scale = 0
			pause_menu.visible = true
		else:
			Engine.time_scale = 1
			pause_menu.visible = false
		get_tree().root.get_viewport().set_input_as_handled()

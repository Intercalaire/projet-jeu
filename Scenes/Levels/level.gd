extends Node2D

@onready var cursor = $"."
@onready var pause_menu = $GUI/InputSettings

var Menu_touche = true
var mouse = load("res://Scenes/Character/mouse/mouse viseur grand.png")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Input.set_custom_mouse_cursor(mouse)


func _unhandled_input(event):
	if event.is_action_pressed("paused"):
		Menu_touche = !Menu_touche
		if Menu_touche:
			pause_menu.visible = true
		else:
			pause_menu.visible = false
		get_tree().root.get_viewport().set_input_as_handled()

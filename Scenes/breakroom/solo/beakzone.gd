extends Node2D

var mouse = load("res://Scenes/Character/mouse/mouse viseur grand.png")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Input.set_custom_mouse_cursor(mouse)

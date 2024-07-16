extends CharacterBody2D

@onready var animated_sprite = get_node("ennemisSprite")    # appel d'une librairie

func _ready():
	animated_sprite.play("ennemi1")

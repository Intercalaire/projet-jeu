extends CharacterBody2D

@onready var animated_sprite = get_node("ennemisSprite")    # appel d'une librairie
var speed = 150
var player_chase = false
var player = null


func _ready():
	pass

#https://youtu.be/9u59U-DWNJs?feature=sharedsd

func _physics_process(delta):
	if player_chase:
		position += (player.position - position) / speed
		move_and_collide(Vector2(0,0))
		$ennemisSprite.play("ennemi1")
	else:
		$ennemisSprite.stop()

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

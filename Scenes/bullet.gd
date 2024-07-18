extends Area2D

@onready var audio_player = $AudioStreamPlayer2D

var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta
	#audio_player.play()

func _on_area_entered(area):
	if area.is_in_group("zone_detections"):
		print("tg")
		area.explode()
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	

extends Area2D

var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()





#extends CharacterBody2D
#
#var speed = 500
#
#func _physic_process(delta):
	#print("toto")
	#var collision_info = move_and_collide(velocity.normalized() * delta * speed)

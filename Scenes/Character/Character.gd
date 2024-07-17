extends CharacterBody2D

@onready var animated_sprite = get_node("AnimatedSprite")    # appel d'une librairie

var bulletPath = load("res://Scenes/bullet.tscn")

var dir_dict : Dictionary = {
	"_left": Vector2.LEFT,
	"_right": Vector2.RIGHT,
	"_up": Vector2.UP,
	"_down": Vector2.DOWN
}

var speed : float = 300.0 # de combien je me deplace
var direction = Vector2.ZERO #les vecteur X/Y (haut, bas, gauche, droite)

var is_attacking = false
var is_moving = false

func _ready():
	animated_sprite.play("start")

func _process(delta):
	velocity = Vector2(direction.x, direction.y) * speed #determine l'axe X/Y de mon mouvement
	move_and_slide()                                     #appel la fonction CharacterBody2D qui permet de bouger
	
	$Weapons.look_at(get_global_mouse_position())

func _input(event):
	direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")) # controle la direction gauche droite
	direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))    # controle la direction haut bas
	
	direction = direction.normalized() #permet davoir un vecteur de toujours de longueur 1 (car sinon le deplacement en diagonal fais bouger le perso tres vite)
	
	var dir_name = _find_dir_name(direction)
	if Input.is_action_pressed("shoot"):
		animated_sprite.play("attack" + dir_name)
		shoot()

	#animation de mouvement:
	else:
		animated_sprite.play("move" + dir_name) #appel d'une data struct
	
#data struct me ressort un mot qui va se combiner au animated_sprite.play("move" + XX pour cree la direction
func _find_dir_name(dir: Vector2): #se balade dans un dictionnaire et regarde ou est dans le dico pour ressotir l'index de la ou on est pour la cle aka la direction de notre perse
	var dir_values_array = dir_dict.values()
	var dir_index = dir_values_array.find(dir)
	if dir_index == -1:                       #code d'erreur de find 
		return ""
	var dir_keys_array = dir_dict.keys()
	var dir_key = dir_keys_array[dir_index]

	return dir_key 

#LES BALLES
func shoot():
	var bullet = bulletPath.instantiate()
	
	owner.add_child(bullet)
	bullet.transform = $Weapons/Position2D.global_transform

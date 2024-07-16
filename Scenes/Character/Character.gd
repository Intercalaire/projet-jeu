extends CharacterBody2D

@onready var animated_sprite = get_node("AnimatedSprite")    # appel d'une librairie

var dir_dict : Dictionary = {
	"Left": Vector2.LEFT,
	"Right": Vector2.RIGHT,
	"Up": Vector2.UP,
	"Down": Vector2.DOWN
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

func _input(event):
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")) # controle la direction gauche droite
	direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))    # controle la direction haut bas
	
	direction = direction.normalized() #permet davoir un vecteur de toujours de longueur 1 (car sinon le deplacement en diagonal fais bouger le perso tres vite)
	
	
	var dir_name = _find_dir_name(direction)
	#animation de mouvement:
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

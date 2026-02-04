extends Node2D

@onready var cursor=$Cursor
@onready var seleccion_objetivo = Vector2()

var enemigo=""

var damage=2
var vida = 20

func _ready():
	$AnimationPlayer.play("idle")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("tecla_F"):
		if Main.ataque_jugador == true:
			_seleccionar_objetivo()
			_animacion_ataque()

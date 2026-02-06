extends CharacterBody2D
var objetivo: Vector2
@export var punto_a = Vector2(203.0, 168.0)
@export var punto_b = Vector2(296.0, 231.0)
var moviendose = true
@export var velocidad = 200

func _ready():
	objetivo = punto_b
	$AnimationPlayer.play("idle")
	add_to_group("orco")

func _physics_process(_delta):
	if moviendose:
		var direccion = position.direction_to(objetivo)
		velocity = direccion * velocidad
		move_and_slide()
		
		if velocity.x != 0:
			$Sprite2D.flip_h = velocity.x < 0
		
		if position.distance_to(objetivo) < 5:
			frenar()

func frenar():
	moviendose = false
	velocity = Vector2.ZERO
	$AnimationPlayer.play("idle")
	$Timer.start(1.5)

func _on_timer_timeout():
	if objetivo == punto_b:
		objetivo = punto_a
	else:
		objetivo = punto_b
	
	$AnimationPlayer.play("walk")
	moviendose = true

func _on_colision_combate_area_entered(area):
	if area.is_in_group("player"):
		print("Colisión detectada - Iniciando combate")
		
		var transicion = get_tree().get_nodes_in_group("transicion")
		if transicion.size() > 0:
			transicion[0].siguiente_combate_nombre = "Colision_combate"
			transicion[0].orcos_eliminados.append(self.name)
			print("Orco añadido a lista de eliminados: ", self.name)
			transicion[0]._verificar_combate()
		else:
			print("No se encontró nodo de transición")
		
		queue_free()

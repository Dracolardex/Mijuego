extends Node2D
var seleccion_objetivo = null
var enemigo = ""
var damage = 6
var vida = 10
var posicion_inicial = Vector2()

func _ready():
	print("Mago iniciado: ", name)
	posicion_inicial = global_position
	add_to_group("jugador")
	
	if has_node("AnimationPlayer"):
		$AnimationPlayer.play("idle")
		print("Animación idle iniciada")

func ejecutar_ataque():
	if Main.turno_actual != "jugador":
		print("No es tu turno")
		return
	
	print("Mago intenta atacar...")
	print("Objetivo enemigo seleccionado: ", Main.objetivo_enemigo)
	
	_seleccionar_objetivo()
	
	if seleccion_objetivo != null:
		print("Hechizo lanzado contra: ", seleccion_objetivo.name)
		_animacion_ataque()
	else:
		print("No hay objetivo seleccionado. Selecciona un enemigo primero.")

func _animacion_ataque():
	if seleccion_objetivo == null:
		return
	
	$AnimationPlayer.play("attack1")

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"attack1":
			print("Animación attack1 del Mago terminada")
			
			var enemigos = get_tree().get_nodes_in_group(enemigo)
			
			if enemigos.size() > 0:
				print("Mago aplicando daño de ", damage, " a: ", enemigos[0].name)
				enemigos[0].damage_recibido = damage
				enemigos[0].vida -= damage
				print("Vida del enemigo ahora: ", enemigos[0].vida)
				enemigos[0]._damage()
			
			self.global_position = posicion_inicial
			$AnimationPlayer.play("idle")
			
			Main.ataque_en_curso = false

func _seleccionar_objetivo():
	match Main.objetivo_enemigo:
		1:
			var slot = get_node_or_null("/root/Transicion/zona_batalla/Enemigos/enemi001")
			if slot and slot.get_child_count() > 0:
				seleccion_objetivo = slot.get_child(0)
				enemigo = "enemi001"
				print("Objetivo del Mago encontrado: ", seleccion_objetivo.name)
			else:
				print("ERROR: No se encontró el slot en /root/Transicion/zona_batalla/Enemigos/enemi001")

func recibir_damage(cantidad):
	vida -= cantidad
	print(name, " recibe ", cantidad, " de daño. Vida restante: ", vida)
	
	if has_node("ProgressBar"):
		var vida_max = 10  
		$ProgressBar.value = vida * 100 / vida_max
	
	if vida <= 0:
		print(name, " ha muerto")
		queue_free()

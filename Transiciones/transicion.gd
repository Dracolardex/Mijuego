extends Node2D
@onready var animacion = $AnimationPlayer
var siguiente_combate_nombre: String = ""
var escena_actual = null
var posicion_player_guardada = Vector2.ZERO
var posicion_mago_guardada = Vector2.ZERO
var orcos_eliminados = []

func _ready():
	add_to_group("transicion")
	print("Transicion iniciada")
	
	var ruta_mapa = "res://MapaInterseccion/MapaInterseccion.tscn"
	print("Intentando cargar desde: ", ruta_mapa)
	
	if ResourceLoader.exists(ruta_mapa):
		print("El archivo existe")
		var escena_cargada = load(ruta_mapa)
		print("Escena cargada: ", escena_cargada)
		
		var mapa1 = escena_cargada.instantiate()
		print("Instancia creada: ", mapa1)
		print("Hijos de la instancia: ", mapa1.get_child_count())
		
		add_child(mapa1)
		escena_actual = mapa1
		print("Mapa agregado a la escena")
	else:
		print("ERROR: El archivo NO existe en la ruta: ", ruta_mapa)

func _verificar_combate():
	var player = get_tree().get_nodes_in_group("player")
	if player.size() > 0:
		posicion_player_guardada = player[0].global_position
		print("Posicion del player guardada: ", posicion_player_guardada)
	
	var magos = get_tree().get_nodes_in_group("mago")
	if magos.size() > 0:
		posicion_mago_guardada = magos[0].global_position
		print("Posicion del mago guardada: ", posicion_mago_guardada)
	
	print("Verificando combate: ", siguiente_combate_nombre)
	$AnimationPlayer.play("Entrando_combate")

func _siguiente_combate():
	print("Cargando combate...")
	
	var combate = null
	match siguiente_combate_nombre:
		"Colision_combate":
			combate = load("res://Escenario de Batalla/zona_batalla.tscn").instantiate()
		_:
			print("Combate no reconocido: ", siguiente_combate_nombre)
			return
	
	if escena_actual != null:
		escena_actual.queue_free()
	
	add_child(combate)
	escena_actual = combate
	print("Combate cargado")

func _volver_al_mapa():
	print("Volviendo al mapa...")
	$AnimationPlayer.play("Entrando_combate") 
	await $AnimationPlayer.animation_finished
	
	if escena_actual != null:
		escena_actual.queue_free()
	
	var mapa = load("res://MapaInterseccion/MapaInterseccion.tscn").instantiate()
	add_child(mapa)
	escena_actual = mapa
	
	await get_tree().create_timer(0.5).timeout
	
	var player = get_tree().get_nodes_in_group("player")
	print("Jugadores encontrados: ", player.size())
	if player.size() > 0 and posicion_player_guardada != Vector2.ZERO:
		player[0].global_position = posicion_player_guardada
		print("Posicion del player restaurada: ", posicion_player_guardada)
	
	var magos = get_tree().get_nodes_in_group("mago")
	print("Magos encontrados: ", magos.size())
	print("Posicion guardada del mago: ", posicion_mago_guardada)
	if magos.size() > 0:
		print("Posicion actual del mago antes de restaurar: ", magos[0].global_position)
		if posicion_mago_guardada != Vector2.ZERO:
			magos[0].global_position = posicion_mago_guardada
			print("Posicion del mago restaurada: ", posicion_mago_guardada)
			print("Posicion actual del mago despues de restaurar: ", magos[0].global_position)
		else:
			print("ERROR: Posicion guardada del mago es Vector2.ZERO")
	else:
		print("ERROR: No se encontraron magos en grupo mago")
	
	_eliminar_orcos_muertos()
	
	$AnimationPlayer.play("Saliendo_combate")
	
	print("Mapa cargado")

func _eliminar_orcos_muertos():
	for orco_nombre in orcos_eliminados:
		var orcos = get_tree().get_nodes_in_group("orco")
		for orco in orcos:
			if orco.name == orco_nombre:
				print("Eliminando orco muerto: ", orco_nombre)
				orco.queue_free()

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"Entrando_combate":
			print("Animación 'Entrando_combate' terminada")
			_siguiente_combate()
			$AnimationPlayer.play("Saliendo_combate")
		
		"Saliendo_combate":
			print("Animación 'Saliendo_combate' terminada")

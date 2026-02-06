extends Node2D
var enemigo_orco = preload("res://Orco/orco_de_batalla.tscn")
@onready var slot1 = $Enemigos/enemi001

func _ready() -> void:
	$AudioStreamPlayer2D.playing = true
	_instanciar_enemigos()
	
	$Control.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Control/VBoxContainer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$Control/VBoxContainer/Button.mouse_filter = Control.MOUSE_FILTER_PASS
	$Control/VBoxContainer/Button.visible = true
	
	if has_node("PantallaGameOver"):
		$PantallaGameOver.visible = false
	
	if has_node("Area2D"):
		if not $Area2D.mouse_entered.is_connected(_on_area_2d_mouse_entered):
			$Area2D.mouse_entered.connect(_on_area_2d_mouse_entered)
		if not $Area2D.mouse_exited.is_connected(_on_area_2d_mouse_exited):
			$Area2D.mouse_exited.connect(_on_area_2d_mouse_exited)
		print("Señales de Area2D en zona_batalla conectadas")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("tecla_F"):
		Main.jugador_activo = "jugador1"
		print("Player (Caballero) seleccionado con tecla F")
	
	if Input.is_action_just_pressed("tecla_G"):
		Main.jugador_activo = "jugador2"
		print("Mago seleccionado con tecla G")
	
	if slot1.get_child_count() == 0 and not get_tree().paused:
		_victoria()
	var jugadores_vivos = get_tree().get_nodes_in_group("jugador")
	if jugadores_vivos.size() == 0 and not get_tree().paused:
		_game_over()

func _instanciar_enemigos():
	var enemigo1 = enemigo_orco.instantiate()
	enemigo1.add_to_group("enemi001")
	enemigo1.position = Vector2(283.0, 399.0)
	slot1.add_child(enemigo1)
	
	print("Enemigo instanciado: ", enemigo1.name)
	print("Enemigo en grupo 'enemi001': ", enemigo1.is_in_group("enemi001"))

func _victoria():
	print("Victoria! Todos los enemigos derrotados")
	
	await get_tree().create_timer(2.0).timeout
	
	var transicion = get_tree().get_nodes_in_group("transicion")
	if transicion.size() > 0:
		transicion[0]._volver_al_mapa()
	else:
		print("No se encontró nodo de transición")

func _game_over():
	print("GAME OVER")
	
	if has_node("PantallaGameOver"):
		$PantallaGameOver.visible = true
	
	get_tree().paused = true

func _on_button_pressed():
	if Main.ataque_en_curso:
		print("Espera a que termine el ataque actual")
		return
	
	if Main.turno_actual != "jugador":
		print("No es tu turno")
		return
	
	if Main.jugador_activo == "":
		print("Selecciona un personaje primero (tecla F para Player, tecla G para Mago)")
		return
	
	Main.objetivo_enemigo = 1
	
	print("Boton presionado - Personaje seleccionado: ", Main.jugador_activo)
	
	Main.ataque_jugador = true
	Main.ataque_en_curso = true
	
	if Main.jugador_activo == "jugador1":
		var player = get_node("Player/jugador1/Player_Batalla")
		if player:
			player.ejecutar_ataque()
		else:
			print("No se encontró Player_Batalla")
			Main.ataque_en_curso = false
			
	elif Main.jugador_activo == "jugador2":
		var mago = get_node("Player/jugador2/Mago_batalla")
		if mago:
			mago.ejecutar_ataque()
		else:
			print("No se encontró Mago_batalla")
			Main.ataque_en_curso = false

func _on_area_2d_mouse_entered():
	print("Mouse entro en Area2D de zona_batalla")
	$Control/VBoxContainer/Button.visible = true

func _on_area_2d_mouse_exited():
	print("Mouse salio de Area2D de zona_batalla")
	$Control/VBoxContainer/Button.visible = false

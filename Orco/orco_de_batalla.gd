extends Node2D

var vida = 20
var damage = 5
var vida_max = 20
var damage_recibido = 0
var posicion_inicial = Vector2()

func _ready() -> void:
	$Node2D.visible = false
	$ProgressBar.value = vida * 100 / vida_max
	posicion_inicial = global_position
	
	$AnimationPlayer.play("idle")
	print("Orco iniciado - Animacion idle comenzada")

func _process(delta: float) -> void:
	pass

func _damage():
	$Node2D.visible = true
	$Node2D/Label.text = str(damage_recibido)
	$AnimationPlayer.play("damage")
	$ProgressBar.value = vida * 100 / vida_max
	print("Orco recibio daño - Animacion damage iniciada")

func _on_animation_player_animation_finished(anim_name):
	print("Animacion terminada: ", anim_name)
	
	match anim_name:
		"damage":
			if vida <= 0:
				print("Enemigo eliminado")
				queue_free()
			else:
				print("Turno del enemigo - Volviendo a idle")
				$AnimationPlayer.play("idle")
				Main.turno_actual = "enemigo"
				await get_tree().create_timer(0.5).timeout
				_ataque()
		
		"attack1":
			print("Ataque del orco terminado - Volviendo a posicion")
			self.global_position = posicion_inicial
			$AnimationPlayer.play("idle")
			print("Animacion idle reiniciada")
			
			Main.turno_actual = "jugador"
			Main.ataque_en_curso = false

func _ataque():
	if vida <= 0:
		return
	
	print("Orco preparando ataque")
	
	var jugadores = get_tree().get_nodes_in_group("jugador")
	
	if jugadores.size() == 0:
		print("No hay jugadores disponibles")
		Main.turno_actual = "jugador"
		$AnimationPlayer.play("idle")
		return
	
	var objetivo = jugadores[randi() % jugadores.size()]
	print("Orco ataca a: ", objetivo.name)
	
	var offset_x = 50
	var offset_y = 0
	self.global_position = objetivo.global_position + Vector2(offset_x, offset_y)
	
	$AnimationPlayer.play("attack1")
	print("Animacion attack1 iniciada")
	
	await get_tree().create_timer(0.5).timeout
	
	if objetivo.has_method("recibir_damage"):
		objetivo.recibir_damage(damage)
	else:
		if objetivo.has("vida"):
			objetivo.vida -= damage
			print("Orco hace ", damage, " de daño. Vida del jugador: ", objetivo.vida)

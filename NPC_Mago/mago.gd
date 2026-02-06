extends CharacterBody2D
var player = null
var speed = 145

func _ready():
	add_to_group("mago")
	_buscar_player()

func _buscar_player():
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0]
		print("Mago encontró al player: ", player.name)
	else:
		print("Mago no encontró al player en grupo player")

func _physics_process(_delta):
	if player == null:
		_buscar_player()
		return
	
	if not is_instance_valid(player):
		player = null
		return
	
	var distance = global_position.distance_to(player.global_position)
	var stop_distance = 50.0
	
	if distance > stop_distance:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		$AnimationPlayer.play("Walk")
		
		if direction.x < 0:
			$Wizard.flip_h = true
		elif direction.x > 0:
			$Wizard.flip_h = false
	else:
		velocity = Vector2.ZERO
		$AnimationPlayer.play("Idle")
	
	move_and_slide()

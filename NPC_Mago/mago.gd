extends CharacterBody2D

@onready var player = get_node("/root/Interseccion/TimemapLayers/Player")
var speed = 145


func _physics_process(_delta):
	if player:
		var distance = global_position.distance_to(player.global_position)
		var stop_distance = 50.0
		
		if distance > stop_distance:
			var direction = global_position.direction_to(player.global_position)
			velocity = direction * speed
			$AnimationPlayer.play("Walk")
			if direction.x < 0:
				$Wizard.flip_h = true
			elif direction.x>0:
				$Wizard.flip_h = false
		else:
			velocity = Vector2.ZERO
			$AnimationPlayer.play("Idle")

		move_and_slide()

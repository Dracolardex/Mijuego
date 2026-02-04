extends Node2D

var vida = 14
var damage = 2
var vida_max= 14

var damage_recibido = 0

func _ready() -> void:
	$Node2D.visible = false
	$ProgressBar.value = vida * 100 / vida_max

func _process(delta: float) -> void:
	pass

func _damage():
	$Node2D.visible=true
	$Node2D/Label.text = str(damage_recibido)
	$AnimationPlayer.play("damage")
	$ProgressBar.value=vida*100/vida_max

func _on_animation_player_animation_finished(anim_name):
	if vida<0:
		if anim_name=="damage":
			queue_free()

func _on_area_2d_mouse_entered():
	$Cursor.visible=true

func _on_area_2d_mouse_exited():
	$Cursor.visible=false

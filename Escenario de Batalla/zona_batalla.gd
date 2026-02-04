extends Node2D

var enemigo_orco = preload("res://Orco/orco_de_batalla.tscn")

@onready var slot1= $Enemigos/Orco_de_batalla

func _ready() -> void:
	$AudioStreamPlayer2D.playing = true

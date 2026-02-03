extends CharacterBody2D

enum State{
	IDLE,
	WALK,
	ATTACK,
	ATTACK1,
	ATTACK2,
	ATTACK3,
	BUFF,
	DEATH
}

@export_category("Stats")
@export var SPEED: float = 600.0

var state: State = State.IDLE
var move_direction: Vector2 = Vector2.ZERO

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var animation_playback : AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")

func _physics_process(_delta: float) -> void:
	loop_de_movimiento()

func loop_de_movimiento() -> void:
	move_direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	velocity = move_direction * SPEED
	move_and_slide()
	
	if state == State.IDLE or state == State.WALK:
		if move_direction.x < 0:
			$Soldado.flip_h = true
		elif move_direction.x > 0:
			$Soldado.flip_h = false

	if velocity.length() > 0 and state == State.IDLE:
		state = State.WALK
		update_animation()
	elif velocity.length() == 0 and state == State.WALK:
		state = State.IDLE
		update_animation()
	
func update_animation() -> void:
	match state:
		State.IDLE:
			animation_playback.travel("Idle")
		State.WALK:
			animation_playback.travel("Walk")

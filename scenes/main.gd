extends Node2D

@export var player_char : Node
@export var enemy_char : Node
@export var next_turn_delay: float = 1.0

var current_char: Character
var game_over: bool = false

signal character_begin_turn(char)
signal character_end_turn(char)

func _ready():
	await get_tree().create_timer(next_turn_delay/2).timeout
	begin_next_turn()

func begin_next_turn():
	if current_char == player_char:
		current_char = enemy_char
	else:
		current_char = player_char
		
	emit_signal("character_begin_turn", current_char)
	
func end_current_turn():
	emit_signal("character_end_turn", current_char)
	
	await get_tree().create_timer(next_turn_delay).timeout
	
	if !game_over:
		begin_next_turn()
	
func character_died(char):
	game_over = true
	
	if char.is_player:
		print("Game Over!")
	else:
		print("You win!")

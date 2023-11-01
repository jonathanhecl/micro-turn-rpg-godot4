extends VBoxContainer

@export var buttons: Array[NodePath]

func _ready():
	get_node("/root/BattleScene").character_begin_turn.connect(_on_character_begin_turn)
	get_node("/root/BattleScene").character_end_turn.connect(_on_character_end_turn)

func _on_character_begin_turn(char):
	visible = char.is_player
	
	if char.is_player:
		_display_combat_actions(char.combat_actions)
	
func _on_character_end_turn(char):
	visible = false

func _display_combat_actions(combat_actions):
	for i in len(buttons):
		var button = get_node(buttons[i])
		
		if i < len(combat_actions):
			button.visible = true
			button.text = combat_actions[i].display_name
			button.combat_action = combat_actions[i]
		else:
			button.visible = false


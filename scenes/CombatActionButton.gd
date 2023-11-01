extends Button

var combat_action : CombatAction

func _ready():
	self.pressed.connect(_on_action_pressed)
	
func _on_action_pressed():
	get_node("/root/BattleScene").current_char.cast_combat_action(combat_action)

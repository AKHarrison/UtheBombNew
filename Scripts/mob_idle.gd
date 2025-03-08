class_name State_Mob_Idle  extends State

@onready var move: State_Mob_Move = $"../Move"
@onready var home: State_Mob_Idle = $"../Home"


func Enter() -> void:
	mob.UpdateAnimation("edna_idle")
	pass
	
func Exit() -> void:
	pass
	
func Process(_delta : float) -> State:
	if mob.home == true:
		return home
		
	mob.home == false
	return null
	
func Physics(_delta : float) -> State:
	return null
	
func HandleInput(_delta : InputEvent) -> State:
	return null

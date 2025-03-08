class_name MobState extends Node


var mob : Mob
var state_machine : MobStateMachine

func init() -> void:
	pass

func Enter() -> void:
	pass
	
func Exit() -> void:
	pass
	
func Process(_delta : float) -> MobState:
	return null
	
func Physics(_delta : float) -> MobState:
	return null
	

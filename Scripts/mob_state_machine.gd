class_name MobStateMachine extends Node

var states : Array[ MobState ]
var prev_state : MobState
var current_state : MobState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.
#
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ChangeState( current_state.Process( delta ) )
	pass

func _physics_process(delta):
	ChangeState( current_state.Physics( delta ) )
	pass



func Initialise(_mob : Mob ) -> void:
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)	

	if states.size() > 0:
		states[0].mob = _mob
		ChangeState( states[0] )
		process_mode = Node.PROCESS_MODE_INHERIT


func ChangeState( new_state : MobState ) -> void:
	if new_state == null || new_state == current_state:
		return
	
	if current_state:	
		current_state.Exit()
		
	prev_state = current_state
	current_state = new_state
	current_state.Enter()

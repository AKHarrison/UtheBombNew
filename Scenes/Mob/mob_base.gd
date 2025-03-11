class_name MobBase extends CharacterBody2D

var max_speed: float = 20.0
var low_speed: float = 5.0
var	acceleration: float = 10.0
var hit: bool = false
var home: bool = false


@onready var player: CharacterBody2D = null

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var msm: MobStateMachine = $MobStateMachine
@onready var mob_wander_state: MobWanderState = $MobStateMachine/MobWanderState as MobWanderState
@onready var mob_chase_state: MobChaseState = $MobStateMachine/MobChaseState as MobChaseState
@onready var mob_idle_state: MobIdleState = $MobStateMachine/MobIdleState as MobIdleState
@onready var mob_home_state: MobHomeState = $MobStateMachine/MobHomeState as MobHomeState

func _ready():
	player = get_tree().get_first_node_in_group("player")
	mob_wander_state.found_player.connect(msm.change_state.bind(mob_chase_state))
	mob_chase_state.lost_player.connect(msm.change_state.bind(mob_wander_state))
	mob_chase_state.insult_hit.connect(msm.change_state.bind(mob_idle_state))
	
func set_idle():
	hit = true
	
func send_home():
	home = true

		
func _physics_process(delta):
	ray_cast_2d.target_position = ray_cast_2d.to_local(player.global_position)

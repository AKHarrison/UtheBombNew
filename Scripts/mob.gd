class_name Mob extends CharacterBody2D

@onready var player: CharacterBody2D = null
@onready var anim: AnimationPlayer = $Anim
@onready var sprite: Sprite2D = $Sprite2D
@onready var mob_state_machine: MobStateMachine = $MobStateMachine
@onready var idle: State_Mob_Idle = $MobStateMachine/Idle

var hit: float = 1
var home: bool = false

func _ready():
	player = get_tree().get_first_node_in_group("player")
	if player == null:
		print("Error: Player not found in the scene!")
	
	mob_state_machine.Initialise(self)

func _physics_process(delta):    
	pass
func UpdateAnimation(state: String) -> void:
	anim.play("edna_move")

func set_idle():
	hit = 0
func set_home():
	home = true

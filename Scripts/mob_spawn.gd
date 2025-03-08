extends Node

var mob_types = [
	preload("res://Scenes/Mob/mob_base.tscn"),
] 


func spawn_mob_North():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %North.global_position
	add_child(new_mob)

func spawn_mob_South():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %South.global_position
	add_child(new_mob)
	
func spawn_mob_Eastn():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %East.global_position
	add_child(new_mob)
	
func spawn_mob_West():
	var mob_scene = mob_types.pick_random()
	var new_mob = mob_scene.instantiate()
	new_mob.global_position = %West.global_position
	add_child(new_mob)

func _on_timer_timeout() -> void:
	spawn_mob_North()
	spawn_mob_Eastn()
	spawn_mob_West()
	spawn_mob_South()
	

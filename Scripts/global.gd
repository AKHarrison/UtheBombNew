extends Node

var current_scene = null
# Using a negative index counts from the end, so this gets the last child node of `root`.
func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(-1)
	
func goto_scene(path):
	
	_deferred_goto_scene.call_deferred(path)
	
func _deferred_goto_scene(path):
	current_scene.free()
	
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()

	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

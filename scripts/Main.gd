extends Node3D

@export var matchstick_scene: PackedScene

signal match_count_changed(new_match_count: int)
var current_match_count: int

# Called when the node enters the scene tree for the first time.
func _ready():
	current_match_count = randi_range(20, 35)
	match_count_changed.emit(current_match_count)
	
	for i in range(current_match_count):
		_add_matchstick(i+5)
	
	await get_tree().create_timer(5).timeout
	
	while current_match_count > 0:
		await get_tree().create_timer(0.5).timeout
		get_tree().get_nodes_in_group("MatchesGroup")[0].queue_free()
		current_match_count -= 1
		match_count_changed.emit(current_match_count)

func _add_matchstick(height: int):
	var matchstick: Node3D = matchstick_scene.instantiate()
	matchstick.add_to_group("MatchesGroup")
	add_child(matchstick)
	matchstick.global_position = Vector3(0, height, 0)
	matchstick.rotate_x(randf_range(0,2*PI))
	matchstick.rotate_y(randf_range(0,2*PI))
	matchstick.rotate_z(randf_range(0,2*PI))



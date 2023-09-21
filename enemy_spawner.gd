extends Node2D

const ENEMY_SCENE = preload("res://enemy.tscn")
@onready var spawn_points = $SpawnPoints

func get_spawn_position():
	var points = spawn_points.get_children() #returns an array of all the children of the node	
	var random_points = points.pick_random() #picks a random target from the array
	return random_points.global_position
	
func spawn_enemy():
	var enemy = ENEMY_SCENE.instantiate()
	var world = get_tree().current_scene
	world.add_child(enemy)
	enemy.global_position = get_spawn_position()
	
func _on_timer_timeout():
	spawn_enemy()

extends Node2D

@export var EFFECT_SCENE : PackedScene
var width = ProjectSettings.get_setting("display/window/size/viewport_width")
var height = ProjectSettings.get_setting("display/window/size/viewport_height")

func _exit_tree():
	if not EFFECT_SCENE is PackedScene : return
	if global_position.x < 0 or global_position.x > width: return
	if global_position.y < 0 or global_position.y > height: return
	var effect = EFFECT_SCENE.instantiate()
	var world = get_tree().current_scene
	world.add_child.call_deferred(effect)
	effect.global_position = global_position 

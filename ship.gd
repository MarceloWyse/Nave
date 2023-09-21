extends Area2D

var speed = 150
const LASER_SCENE = preload("res://laser.tscn")

var height = ProjectSettings.get_setting("display/window/size/viewport_height")

signal ship_destroyed

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		if position.y > 10:
			position.y -= speed * delta	
	if Input.is_action_pressed("ui_down"):
		if position.y < height - 10:
			position.y += speed * delta
	if Input.is_action_just_pressed("ui_accept"):
		var laser = LASER_SCENE.instantiate()
		var world = get_tree().current_scene
		world.add_child(laser)
		laser.position = position #ship's position
	
	
func _on_area_entered(area):
	area.queue_free()
	queue_free()
	ship_destroyed.emit()
	

extends Node2D

@onready var cpu_particles_2d = $CPUParticles2D

# Called when the node enters the scene tree for the first time.
func _ready():
	cpu_particles_2d.one_shot = true

func _on_timer_timeout():
	queue_free()

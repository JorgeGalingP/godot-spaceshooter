extends Node2D

onready var hit_particles = $HitParticles

func _ready():
    hit_particles.emitting = true


func _on_Timer_timeout():
    queue_free() # destroy the node when the timeout is done

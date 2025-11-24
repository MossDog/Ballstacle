@tool
extends MeshInstance3D

@export var speed = 1:
	# Update speed and reset the rotation.
	set(new_speed):
		speed = new_speed


func _process(delta):
	rotation.y += PI * delta * speed

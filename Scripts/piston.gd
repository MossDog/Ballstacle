extends Node3D
class_name Piston

@export var animation_player : AnimationPlayer
@export var mesh : MeshInstance3D
@export var collision : CollisionShape3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	print(body)
	print("AREA ENTERED")
	animation_player.play("Trigger Piston")
	

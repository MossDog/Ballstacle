extends Node3D

@export var player : RigidBody3D
@export var spawn_point : Marker3D

@export var cam_offset : Vector3

@export var animation_player : AnimationPlayer

enum CAMERA_MODE {TRACK, SNAP}

var cam : Camera3D = Camera3D.new()
var cam_mode : CAMERA_MODE


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(cam)
	cam_mode = CAMERA_MODE.TRACK

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	move_camera()


func _input(event):
	if event.is_action_pressed("respawn"):
		player.spawn(spawn_point.position)
		cam_mode = CAMERA_MODE.SNAP


func move_camera(): #Default behavior with no params
	
	cam.look_at(player.position)

	if cam_mode == CAMERA_MODE.TRACK:
		#print("Smooth")
		var target = player.position + cam_offset
		cam.position = cam.position.lerp(target, 0.05)
		
		return 
	
	#print("Instant")
	cam.position = player.position + cam_offset
	cam_mode = CAMERA_MODE.TRACK
	#print(cam.position)
	

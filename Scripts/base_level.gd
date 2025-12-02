class_name BaseLevel extends Node

var PlayerScene : PackedScene = preload("res://Scenes/Player.tscn")
var player : RigidBody3D

var spawn_point : Marker3D

#@export var animation_player : AnimationPlayer

enum CameraMode {TRACK, SNAP}
#enum CAMERA_OFFSET {DEFAULT}

var camera : Camera3D
var camera_offset : Vector3 = Vector3(0, 3, 5)
var camera_mode : CameraMode

var timer : Timer
var time_elapsed : float
var time_label : Label


# Called when the node enters the scene tree for the first time.
func _ready():
	time_label = $Label
	spawn_camera()
	spawn_player()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	move_camera()
	update_elapsed_time(delta)

func _input(event):
	if event.is_action_pressed("respawn"):
		player.spawn(spawn_point.position)
		camera_mode = CameraMode.SNAP
		print("player position" + str(player.position))

func update_elapsed_time(delta):
	time_elapsed += delta
	time_label.text = str(time_elapsed).pad_decimals(2) + "\n"


func spawn_player():
	spawn_point = find_child("SpawnPoint") #Dynamically find the spawn marker
	if not spawn_point:
		push_error("No SpawnPoint found in this level!")
		return
	
	if PlayerScene:
		player = PlayerScene.instantiate() #Instantiate player
		player.position = spawn_point.position
		player.cutplane = $Portal.transform
		add_child(player) #Add player to scene_tree
	else:
		printerr("player_scene not assigned!")


func spawn_camera():
	camera = Camera3D.new()
	add_child(camera)
	camera_mode = CameraMode.SNAP


func move_camera():
	if camera_mode == CameraMode.TRACK:
		#print("Smooth")
		var target = player.position + camera_offset
		camera.position = camera.position.lerp(target, 0.05)
	else:	
		#print("Instant")
		camera.position = player.position + camera_offset
		camera_mode = CameraMode.TRACK

	camera.look_at(player.position)

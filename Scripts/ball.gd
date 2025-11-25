extends RigidBody3D

var speed = 3

var levelScene : PackedScene = preload("res://Scenes/Levels/BaseLevel.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	apply_forces()


func apply_forces():
	var input_force = Input.get_vector("left", "right", "forward", "backward") * speed
	#print(input_force)
	apply_central_force(Vector3(input_force.x, 0, input_force.y))


func spawn(point:Vector3):
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO
	
	PhysicsServer3D.body_set_state(
	get_rid(),
	PhysicsServer3D.BODY_STATE_TRANSFORM,
	Transform3D.IDENTITY.translated(point)

)

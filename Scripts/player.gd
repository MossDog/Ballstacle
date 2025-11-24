extends RigidBody3D

var cutplane: Transform3D
@onready var mesh: MeshInstance3D = $Sphere

var speed = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	mesh.material_override.set_shader_parameter("cutplane", cutplane)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	apply_forces()


func apply_forces():
	var input_force = Input.get_vector("left", "right", "forward", "backward") * speed
	#print(input_force)
	apply_central_force(Vector3(input_force.x, 0, input_force.y))


func spawn(point: Vector3):
	print("we have arrived fr")
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO
	
	PhysicsServer3D.body_set_state(get_rid(), PhysicsServer3D.BODY_STATE_TRANSFORM, Transform3D.IDENTITY.translated(point))
	print("player position from player" + str(position))

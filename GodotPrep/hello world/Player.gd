extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var inputForwBack = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	#var inputDown = Input.get_action_strength("ui_down")
	apply_central_force(inputForwBack * Vector3.FORWARD * 1200.0 * delta)

extends RigidBody3D

var mouse_sensitivity := 0.001
var twist_input := 0.0
var pitch_input := 0.0
var camera_mode := 0	# 0 is without pitch and 1 is with pitch

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rate := 2000.0
	var inputMove := Vector3.ZERO
	inputMove.x = Input.get_axis("move_left_player", "move_right_player")
	inputMove.z = Input.get_axis("move_forward_player", "move_backward_player")
	
	apply_central_force(inputMove * rate * delta)
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	$VertPivot.rotate_y(twist_input)

	twist_input = 0.0
	pitch_input = 0.0
	
	

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			twist_input = - event.relative.x * mouse_sensitivity
			pitch_input = - event.relative.y * mouse_sensitivity
			
	

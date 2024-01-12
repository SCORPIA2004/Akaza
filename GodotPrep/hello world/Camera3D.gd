extends Camera3D

var zoom_rate := 1.0
var zoom_level := 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rate := 10.0
	var inputMoveCamera := Vector3.ZERO
	inputMoveCamera.x = Input.get_axis("move_left_camera", "move_right_camera")
	inputMoveCamera.z = Input.get_axis("move_forward_camera", "move_backward_camera")

	global_transform.origin.x += inputMoveCamera.x * rate * delta
	global_transform.origin.z += inputMoveCamera.z * rate * delta
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			if(global_transform.origin.y <= 12):			
				global_transform.origin.y += zoom_rate
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			if(global_transform.origin.y >= 4):
				global_transform.origin.y -= zoom_rate
			

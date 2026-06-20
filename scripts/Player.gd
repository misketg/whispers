extends CharacterBody3D

## First-person controller for the whispers vertical slice.
## WASD to move, mouse to look, Esc to release mouse, click to recapture.

@export var walk_speed: float = 4.5
@export var mouse_sensitivity: float = 0.002
@export var pitch_limit_deg: float = 80.0
@export var gravity: float = 9.8

@onready var camera: Camera3D = $Camera3D
@onready var debug_label: Label = get_node_or_null("/root/Main/UI/DebugLabel")


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif event is InputEventMouseButton and event.pressed:
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		var limit: float = deg_to_rad(pitch_limit_deg)
		camera.rotation.x = clamp(camera.rotation.x, -limit, limit)


func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if direction:
		velocity.x = direction.x * walk_speed
		velocity.z = direction.z * walk_speed
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed)
		velocity.z = move_toward(velocity.z, 0, walk_speed)

	velocity.y -= gravity * delta
	move_and_slide()

	if debug_label:
		var h_speed: float = Vector2(velocity.x, velocity.z).length()
		debug_label.text = "pos: (%.2f, %.2f, %.2f)  speed: %.2f m/s  input: (%.2f, %.2f)" % [
			global_position.x, global_position.y, global_position.z,
			h_speed,
			input_dir.x, input_dir.y
		]

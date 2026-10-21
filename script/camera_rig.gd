extends Node3D

@export var pan_speed: float = 15.0
@export var zoom_speed: float = 1.5
@export var min_zoom: float = 5.0
@export var max_zoom: float = 25.0

var camera: Camera3D

func _ready() -> void:
	camera = Camera3D.new()
	camera.position = Vector3(0, 12, 12)
	camera.rotation_degrees = Vector3(-45, 0, 0)
	add_child(camera)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		# Right side of screen or two fingers = Pan
		if event.index == 1 or event.position.x > get_viewport().get_visible_rect().size.x / 2.0:
			translate(Vector3(-event.relative.x, 0, -event.relative.y) * pan_speed * get_process_delta_time())
		# Left side of screen = Rotate
		else:
			rotate_y(-event.relative.x * 0.005)

	if event is InputEventMagnifyGesture:
		camera.position.y = clampf(camera.position.y - event.factor, min_zoom, max_zoom)
		camera.position.z = clampf(camera.position.z - event.factor, min_zoom, max_zoom)

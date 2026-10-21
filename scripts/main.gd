extends Node3D

const CameraRig = preload("res://scripts/camera_rig.gd")

func _ready() -> void:
	# 1. The Sky and Lighting
	var env := Environment.new()
	env.background_mode = Environment.BG_SKY
	var sky := Sky.new()
	sky.sky_material = ProceduralSkyMaterial.new()
	env.sky = sky
	
	var world_env := WorldEnvironment.new()
	world_env.environment = env
	add_child(world_env)

	# 2. The Sun
	var sun := DirectionalLight3D.new()
	sun.rotation_degrees = Vector3(-45, -30, 0)
	sun.shadow_enabled = true
	sun.directional_shadow_max_distance = 50.0
	add_child(sun)

	# 3. The Ground (Green Grass)
	var ground := MeshInstance3D.new()
	var plane := PlaneMesh.new()
	plane.size = Vector2(100, 100)
	ground.mesh = plane
	
	var ground_mat := StandardMaterial3D.new()
	ground_mat.albedo_color = Color(0.4, 0.6, 0.3) # Stylized grass green
	ground.material_override = ground_mat
	add_child(ground)

	# 4. Add the Camera
	var cam_rig = CameraRig.new()
	add_child(cam_rig)

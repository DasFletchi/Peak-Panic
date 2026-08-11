extends CharacterBody3D
@export var mouse_sensitivity: float = 0.005
@export var anim_transition_time: float = 0.5
@onready var camera: Camera3D = $Camera3D
@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D
@onready var ray_cast_3d: RayCast3D = $RayCast3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	#animation_player.playback_default_blend_time = anim_transition_time #geiles godot feature damit man nicht so snappy von animation zu animation wechselts



func _unhandled_input(event: InputEvent) -> void: #unhandled inputs heist eif nur, wenn niemand anders bisher sich das hier geholt hat dann hol ich es mir halt
	if event is InputEventMouseMotion: #ohne input map auf shit zugreifen/is dieses event eine a
		rotate_y(-event.relative.x * mouse_sensitivity) #event.relative.x ist: Wie weit die Maus seit dem letzten Frame horizontal bewegt wurde.
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		#it makes sense but it doesnt i guess please just with the rotate x and y thingies its annoying fr
		#because in this cruel world rotate y means looking left/right we dont have the camera before that bc its fine if the whole player turns that fine its even wanted for nice fps movement
		#but on the next x = y  and no we dont actually want to change the y rotation of the player then we'd fly thats not so cool
		# also warum auch immer: s
		#Maus X-Bewegung → Rotation um Y-Achse
		#Maus Y-Bewegung → Rotation um X-Achse
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
		#PI ist anschei9nend immer 180 grad einmal die untere hälfte der blase und die obere hälfte der blase wundewrbar in der mitte auf der x der realen x achse durchgeschnitten (pi lol schneiden)
	if Input.is_action_just_pressed("left_click") and ray_cast_3d.is_colliding():
		ledge_boost()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("a", "d", "w", "s")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	
	move_and_slide()

func ledge_boost():
	velocity.y = JUMP_VELOCITY * 2


#	if velocity == Vector3.ZERO:
#		animation_player.play("idle")
#	else:
#		animation_player.play("walk")

#	camera.look_at($tempPlayer/MeshInstance3D.global_position)

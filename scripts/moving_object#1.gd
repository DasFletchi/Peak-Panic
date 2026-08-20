extends CSGBox3D

@onready var csg_box_3d: CSGBox3D = $"."
@onready var marker_3d: Marker3D = $Marker3D
@onready var marker_3d_2: Marker3D = $Marker3D2

var speed := 5.0
var pos1: bool = true

var target: Vector3

func _ready() -> void:
	target = marker_3d.position

func _physics_process(delta: float) -> void:
	
	if csg_box_3d.position.distance_to(target) < 0.01:
		pos1 = !pos1
	
	csg_box_3d.position = csg_box_3d.position.lerp(target, speed * delta)
	
	if pos1:
		target = marker_3d.position
	else:
		target = marker_3d_2.position

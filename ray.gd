extends RayCast2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	force_raycast_update()
	if is_colliding():
		get_collider().get_parent().hit(2)
		$"../Line2D".points[1] = to_local(get_collision_point())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

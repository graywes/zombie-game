extends RayCast2D
var shot = preload("res://shot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	force_raycast_update()
	if is_colliding():
		get_collider().get_parent().hit(4)
		$"../Line2D".points[-1] = to_local(get_collision_point())
		var part = shot.instantiate()
		part.position = get_collision_point()
		part.emitting = true
		part.rotation = global_rotation + deg_to_rad(180)
		$"../".add_sibling(part)
	for i in range(3):
		force_raycast_update()
		if is_colliding():
			print("yeaa")
			get_collider().get_parent().hit(4)
			$"../Line2D".points[-1] = to_local(get_collision_point())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$"..".queue_free()
	pass # Replace with function body.

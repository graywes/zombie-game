extends Sprite2D
var enem = preload("res://zom.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for enemy in 800:
		add_sibling.call_deferred(enem.instantiate())
	if Up.up:
		$Polygon2D/AudioStreamPlayer.play()
		Up.up = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Polygon2D.rotation = get_angle_to(get_global_mouse_position())
	if get_tree().get_nodes_in_group("zombie").size() == 0:
		Up.up = true
		get_tree().reload_current_scene()
	pass


func _on_area_2d_body_entered(body):
	get_tree().reload_current_scene()
	pass # Replace with function body.

extends Polygon2D
var bull = preload("res://bullet.tscn")
var shot = preload("res://shot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("shoot") and $Timer.is_stopped():
		print("pew")
		var bullet = bull.instantiate()
		bullet.rotation = rotation
		bullet.position = Vector2(cos(rotation), sin(rotation)) * 38
		get_tree().get_first_node_in_group("cam").shake(4)
		$AnimationPlayer.stop()
		var part = shot.instantiate()
		part.emitting = true
		$Node2D.add_child(part)
		$AnimationPlayer.play("shoot")
		add_sibling(bullet)
		$Timer.start()
	pass

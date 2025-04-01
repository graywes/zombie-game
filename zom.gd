extends Sprite2D
var health = 10
var die = preload("res://die.tscn").instantiate()
var blood = preload("res://blood.tscn").instantiate()
var speed = randf_range(10, 40) * 3

# Called when the node enters the scene tree for the first time.
func _ready():
	var ran = randf() * 6
	randomize()
	position = Vector2(sin(ran), cos(ran)) * (20 * 13 * randf_range(1, 2))
	print(ran)
	modulate = Color.WHITE.darkened(((speed / 3) - 10) / 30)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate((Vector2.ZERO - position).normalized() * delta * speed)
	pass

func hit(dam):
	health -= dam
	$AudioStreamPlayer2D.play()
	$AnimationPlayer.stop()
	$AnimationPlayer.play("hit")
	if health <= 0:
		print("dead")
		get_tree().get_first_node_in_group("cam").shake(10)
		die.position = position
		blood.position = position
		add_sibling(die)
		add_sibling(blood)
		queue_free()
	pass

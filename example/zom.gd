extends Sprite2D
var health = 10
var speed = randf_range(10, 20)

# Called when the node enters the scene tree for the first time.
func _ready():
	var ran = randf() * 6
	position = Vector2(sin(ran), cos(ran)) * (speed * 20 * randf_range(1, 0.7))
	print(ran)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate((Vector2.ZERO - position).normalized() * delta * speed)
	pass

func hit(dam):
	health -= dam
	$AnimationPlayer.stop()
	$AnimationPlayer.play("hit")
	if health <= 0:
		print("dead")
		queue_free()
	pass

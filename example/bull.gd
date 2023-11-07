extends Sprite2D
var time = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(cos(rotation), sin(rotation)) * 250 * delta)
	time -= delta
	if time <= 0:
		queue_free()
	pass


func _on_area_2d_body_entered(body):
	print("hit")
	body.get_parent().hit(2)
	pass # Replace with function body.

extends Camera2D
var shak = false
var much = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func shake(amount):
	$Timer.start()
	much = amount
	shak = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shak:
		var ran = randf()
		offset = Vector2(cos(ran), sin(ran)) * much * ($Timer.time_left * 5)
	else:
		offset = Vector2.ZERO
	pass


func _on_timer_timeout():
	shak = false
	pass # Replace with function body.

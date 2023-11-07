extends Node2D
var circle = preload("res://circle.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	print("stop")
	for chil in get_children():
		remove_child(chil)
	for child in range((($"../SpinBox".value / 2) * -1), ($"../SpinBox".value / 2) + 1):
		var circ = circle.instantiate()
		circ.position = Vector2(cos(child / $"../SpinBox".value), sin(child / $"../SpinBox".value)) * 200
		add_child(circ)
		print("cos")
		print(cos(child / $"../SpinBox".value))
		print("child")
		print(child)
		pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spin_box_value_changed(value):
	_ready()
	pass # Replace with function body.

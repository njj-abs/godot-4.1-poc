extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_button_pressed(node):
	var a = self.get_node("AnimationPlayer")
	var is_playing = a.is_playing()
	print('onclick')
	if(!is_playing):
		a.play('fatty')

extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var a = self.get_node("AnimationPlayer")
	var is_playing = a.is_playing()
	if(!is_playing):
		a.play('position')

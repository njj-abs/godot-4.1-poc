extends Label

func set_label_text(value):
	self.text = "Score " + str(value)

func _ready():
	var tween = create_tween()
	tween.tween_method(set_label_text, 10, 100, 1)

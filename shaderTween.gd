extends Sprite2D

func _on_button_pressed():
	var tween = get_parent().create_tween()
	tween.tween_property($".", 'material:shader_parameter/fattyness', 1.2, 1).from(self.material.get_shader_parameter("fattyness")).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property($".", 'material:shader_parameter/fattyness', 1, 1).from(1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

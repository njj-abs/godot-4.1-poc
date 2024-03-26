extends Control

var texture : Texture2D
var default_font : Font = ThemeDB.fallback_font


var font : Font


func _ready():
	# Load a font resource
#	font = preload("res://new_label_settings.tres")
	# Get the canvas item

	# Set the position where you want to draw the text
	var pos = Vector2(100, 100)

	# Set the text you want to draw
	var text = "Hello, World!"

	# Set the font size
	var font_size = 32

	# Set the color modulation
	var modulate = Color(1, 1, 1, 1)

	# Draw the text onto the canvas item using the font
	font.draw_string(default_font, pos, text, font_size, modulate)
	
#func _ready():
#	# Load a texture from file
#	texture = preload("res://icon.svg")
#
#func _draw():
#	# Draw the texture at position (100, 100) with white color modulation and no transpose
#	texture.draw(get_canvas_item(), Vector2(500, 100), Color(0, 0, 0, 1), false)


#func _ready():
#	texture = preload("res://icon.svg")
#
#func _draw():
#	if not texture:
#		return

	# Draw the texture at position (50, 50)
#	draw_texture(texture, Vector2(50, 50))
#	draw_string(default_font, Vector2(20, 130), "GODOT", HORIZONTAL_ALIGNMENT_CENTER, 90, 22)
	# Modify the texture with color tint and flipping
#	draw_set_modulate(Color.from_hsv(0.5, 0.5, 1.0))  # Set color tint to blue
#	draw_texture(texture, Vector2(200, 50), flip_x=true)  # Draw flipped horizontally at (200, 50)


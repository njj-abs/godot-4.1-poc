extends SubViewport


func _ready():
	await RenderingServer.frame_post_draw
	get_texture().get_image().save_png("res://Screenshot.png")

#	var texture = get_texture()
#
#	var image_data = texture.get_data()
#	var image_width = texture.get_width()
#	var image_height = texture.get_height()
#	var image = Image.new()
#
#	image.set_data(image_width, image_height, false, Image.FORMAT_RGBA8, image_data)
#
#	# Optional: Save the image
#	var save_path = "res://image01.png"
#	image.save_png(save_path)

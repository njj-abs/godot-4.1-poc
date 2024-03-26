extends Control

func _ready():
	# Create a blank image
	var image = Image.new()

	# Define some dummy pixel data (replace this with your actual pixel data)
	var width = 64
	var height = 64
	var pixel_data = PackedByteArray()
	for i in range(width * height):
		pixel_data.append(255)  # R
		pixel_data.append(0)    # G
		pixel_data.append(0)    # B
		pixel_data.append(255)  # A (alpha)

	# Create an image from the pixel data
	image.create_from_data(width, height, false, Image.FORMAT_RGBA8, pixel_data)
	print(image.get_data())
	# Create a Texture from the image
	var texture = ImageTexture.new()
	texture.create_from_image(image)

	# Create a Sprite to display the texture
	var sprite = Sprite2D.new()
	sprite.texture = texture
	add_child(sprite)


#func _ready():
#	var width = 100
#	var height = 200
#	var depth = 3
#
#	var data = PackedByteArray([1,2])
##	for i in range(width * height * depth):
##		data.push_back(randi() % 256) # Random values between 0 and 255
##	print(data)
#	# Create a 3D Image with RGBA8 format and without mipmaps
#	var image = Image.new()
#	image.set_data(24,24, true,Image.FORMAT_RGBA8, data)
##	image.load_bmp_from_buffer(data)
##	image.fill(Color.WHITE)
#	print(image.get_data())
#
##	image.set_pixel(1, 2, Color.GREEN)
#
#	image.save_png("res://image01.png")

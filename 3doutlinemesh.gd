extends Node3D

var font : Font
var default_font : Font = ThemeDB.fallback_font
@export var imageLoader : ImageLoader
#func _ready():
#	# Load your image from file or create it programmatically
#	var image = Image.new()  # Example: Create an empty image
#	image.create(64, 64, false, Image.FORMAT_RGBA8)  # Example: Create a 64x64 RGBA image
#
#	# Fill the image with some color (Optional)
#
#	for x in range(image.get_width()):
#		for y in range(image.get_height()):
#			image.set_pixel(x, y, Color(1, 0, 0, 1))  # Example: Fill with red color
#
#
#	# Create a Texture object from the Image
#	var texture = ImageTexture.new()
#	texture.create_from_image(image)
#
#	# Assign the Texture to the Sprite3D
#	$Sprite3D2.texture = texture


func _ready():
	print(imageLoader.load("res://tools/assets/pencil-create.png"))
	
#	var sprite = Sprite2D.new()
#	sprite.texture = texture
#	$Sprite2D.texture = load("res://tools/assets/time-icon.png")

	var loadedImage = Image.load_from_file("res://tools/assets/time-icon.png")
	var createdImage01 = Image.create(16, 15, false, Image.FORMAT_RGBA8)
	var red = loadedImage.get_data();
	createdImage01.fill(Color.RED)

#	createdImage01.set_data(16, 15, false, Image.FORMAT_RGBA8, red)
#	createdImage01.set_pixel(2, 2, Color.BLUE)
	var img = Image.create(16, 15, false, Image.FORMAT_RGBA8)
	img.blit_rect_mask(createdImage01, loadedImage, Rect2i(0, 0, 16, 15), Vector2i(0, 0))
	$Sprite2D.texture = ImageTexture.create_from_image(img)
	
#	var img = Image.create($Sprite2D.texture.get_width(), $Sprite2D.texture.get_height(), false, Image.FORMAT_ETC2_RGBA8)
#	img.load("res://scripts/time-input.gd")
#	img.fill(Color.WHITE)
#	print(img.save_png("res://image01.png"))
#	sprite.rotate_x(deg_to_rad(-32))
#	sprite.scale = Vector2(50,50)
#	add_child(sprite)
#	print($Sprite3D.texture.get_image().get_data())
#	$Sprite3D2.texture.update($Sprite3D.texture.get_image())
	$MeshInstance3D3/Sprite3D2.texture = $Sprite2D.texture
#	$Sprite2D.texture = $Sprite3D.texture
#	print($Sprite2D.texture)
	



#	var width = 5
#	var height = 5
#	var depth = 3
#
#	var data = PackedByteArray()
#	for i in range(width * height * depth):
#		data.push_back(randi() % 256) # Random values between 0 and 255
#
#	# Create a 3D Image with RGBA8 format and without mipmaps
#	var image = Image.create(width, height, false, Image.FORMAT_RGBA8)
#	image.fill(Color.RED)
##	image.set_pixel(1, 2, Color.GREEN)
#
#	image.save_png("res://image.png")
#	var texture = ImageTexture.new()
#	texture.create_from_image(image)
#	print(texture.get_image())

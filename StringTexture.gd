extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	# Create a 3D image with dimensions 256x256x3 (width x height x depth)
	var width = 256
	var height = 256
	var depth = 3

	# Create a PackedByteArray to hold the raw pixel data
	var data = PackedByteArray()

	# Fill the data array with pixel values (for demonstration purposes, we'll just fill it with random values)
	for i in range(width * height * depth):
		data.push_back(randi() % 256) # Random values between 0 and 255

	# Create a 3D Image with RGBA8 format and without mipmaps
	var image = Image.create_from_data(width, height, false, Image.FORMAT_RGBA8, data)
	print(image)
	# Now you can use the image object as needed, such as saving it to a file or displaying it



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends ResourceFormatLoader
class_name DynamicImageLoader

func _load(resource_path: String, type: String, x: bool, y: int):
	var image
	var regex = RegEx.new()
	regex.compile("^res://(?<processor>[^/]+)/(?<data>[^/]+)\\.abs$")
	var result = regex.search(resource_path)
	var imageData = (Marshalls.base64_to_variant(result.get_string("data")))
	var picture = Image.load_from_file(imageData.picture)
	if imageData.get("mask", false):
		var maskImage = Image.create(picture.get_width(), picture.get_height(), false, Image.FORMAT_RGBA8)
		maskImage.blit_rect_mask(picture, Image.load_from_file(imageData.mask), Rect2i(0,0,picture.get_width(), picture.get_height()), Vector2i(0,0))
		image = maskImage
	else:
		image = picture

	return  ImageTexture.create_from_image(image)

func _get_recognized_extensions():
	return ["abs"]
	
func _handles_type( typename: StringName ) -> bool:
	return typename == "abs"
	
func _get_resource_type( _path: String ):
	return "abs"

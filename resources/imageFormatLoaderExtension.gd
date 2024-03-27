extends ImageFormatLoaderExtension
class_name DynamicImageFormatLoaderExtension

func _load_image(image, fileaccess, flags, scale):
	print(image)

func _get_recognized_extensions():
	return ["abs1"]

func add_custom_loader():
	add_format_loader()

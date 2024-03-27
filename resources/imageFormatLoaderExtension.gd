extends ImageFormatLoaderExtension
class_name DynamicImageFormatLoaderExtension

func _init():
	add_format_loader()

func _load_image(image, fileaccess, flags, scale):
	print(image)

func _get_recognized_extensions():
	return ["abs1"]

#func add_format_loader():
#	return 1

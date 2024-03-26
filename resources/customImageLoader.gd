extends Resource
class_name ImageLoader

func load(path):
	var loadedImage = Image.load_from_file(path)
	return loadedImage

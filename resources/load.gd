extends Node2D


func _ready():
	var images = [
		{
			"picture": "res://picture.png",
			"mask": "res://tools/assets/time.png"
		},
		{
			"picture": "res://tools/assets/time.png"
		},
		{
			"picture": "res://picture.png",
			"mask": "res://tools/assets/time.png"
		},
		{
			"picture": "res://tools/assets/pencil-create.png"
		}
	]
	
	images.map(func(image):
		var data = Marshalls.variant_to_base64(image)
		var resource_path = "res://base64/{data}.abs".format([["data", data]])
		var loaded_resource = ResourceLoader.load(resource_path)
		if loaded_resource:
			print("Custom resource loaded:", loaded_resource)
			$Sprite2D.texture = loaded_resource
			$SubViewport/RichTextLabel.append_text("[img]{url}[/img]".format([["url", resource_path]]))
			$SubViewport/RichTextLabel.append_text("abc")
			$RichTextLabel.append_text("[img]{url}[/img]".format([["url", resource_path]]))
			$RichTextLabel.append_text("abc")
		else:
			print(ResourceLoader.get_recognized_extensions_for_type("abs"))
		)


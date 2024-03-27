extends Node2D


func _ready():
	$Sprite2D.texture = load("res://base64/GwAAAAEAAAAEAAAABwAAAHBpY3R1cmUABAAAABsAAAByZXM6Ly90b29scy9hc3NldHMvdGltZS5wbmcA.abs")
	pass


func _on_button_pressed(extra_arg_0):
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
#	var loaded_resource = ResourceLoader.load("res://base64/GwAAAAEAAAAEAAAABwAAAHBpY3R1cmUABAAAACQAAAByZXM6Ly90b29scy9hc3NldHMvcGVuY2lsLWNyZWF0ZS5wbmc=.abs")
	images.map(func(image):
		var data = Marshalls.variant_to_base64(image)
		var resource_path = "res://base64/{data}.abs".format([["data", data]])
		print(resource_path)
#		var loaded_resource = ResourceLoader.load(resource_path)
		$SubViewport/RichTextLabel.append_text("[img]{url}[/img]".format([["url",resource_path]]))
		$SubViewport/RichTextLabel.append_text("3D")
		$RichTextLabel.append_text("[img]{url}[/img]".format([["url", resource_path]]))
		$RichTextLabel.append_text("2D")
		)

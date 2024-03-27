extends Node2D


var coords_head : Array = [
	[ 22.952, 83.271 ],  [ 28.385, 98.623 ],
	[ 53.168, 107.647 ], [ 72.998, 107.647 ],
	[ 99.546, 98.623 ],  [ 105.048, 83.271 ],
	[ 105.029, 55.237 ], [ 110.740, 47.082 ],
	[ 102.364, 36.104 ], [ 94.050, 40.940 ],
	[ 85.189, 34.445 ],  [ 85.963, 24.194 ],
	[ 73.507, 19.930 ],  [ 68.883, 28.936 ],
	[ 59.118, 28.936 ],  [ 54.494, 19.930 ],
	[ 42.039, 24.194 ],  [ 42.814, 34.445 ],
	[ 33.951, 40.940 ],  [ 25.637, 36.104 ],
	[ 17.262, 47.082 ],  [ 22.973, 55.237 ]
]

var head : PackedVector2Array

func float_array_to_Vector2Array(coords : Array) -> PackedVector2Array:
	# Convert the array of floats into a PackedVector2Array.
	var array : PackedVector2Array = []
	for coord in coords:
		array.append(Vector2(coord[0], coord[1]))
	return array

func _draw():
	var image = Image.load_from_file("res://tools/assets/time.png")
	var texture = ImageTexture.create_from_image(image)
	# We are going to paint with this color.
	var godot_blue : Color = Color("478cbf")
	# We pass the PackedVector2Array to draw the shape.
	draw_polygon(head, [ godot_blue ], [], texture)


func _ready():
	await RenderingServer.frame_post_draw
	print($SubViewport2.get_texture().get_image().save_png("res://Screenshot.png")
)
	$Sprite2D.texture = $SubViewport2.get_texture()
#	print($Polygon2D.polygon)
#	print(Geometry2D.decompose_polygon_in_convex($Polygon2D.polygon))
#	print($Polygon2D.polygon.to_byte_array().size())
	var image1 = Image.create(15,16,false,Image.FORMAT_RGBA8)
	image1.fill(Color.BURLYWOOD)
	image1.set_data(15,16,false,Image.FORMAT_RGBA8, $Polygon2D.polygon.to_byte_array())
	image1.save_png("res://polygon.png")
	
	
	head = float_array_to_Vector2Array(coords_head);
	
	var dynamicImageFormatLoader = DynamicImageFormatLoaderExtension.new()
	dynamicImageFormatLoader.add_format_loader()
	
	$Sprite2D.texture = load("res://base64/GwAAAAEAAAAEAAAABwAAAHBpY3R1cmUABAAAABsAAAByZXM6Ly90b29scy9hc3NldHMvdGltZS5wbmcA.abs1")
#	var image = Image.new()
#	print(image.load("res://base64/GwAAAAEAAAAEAAAABwAAAHBpY3R1cmUABAAAABsAAAByZXM6Ly90b29scy9hc3NldHMvdGltZS5wbmcA.abs1"))
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
	var loaded_resource = ResourceLoader.load("res://base64/GwAAAAEAAAAEAAAABwAAAHBpY3R1cmUABAAAACQAAAByZXM6Ly90b29scy9hc3NldHMvcGVuY2lsLWNyZWF0ZS5wbmc=.abs")
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
